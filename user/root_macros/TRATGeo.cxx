// TRATGeo -- class for assembling geometry in a RAT-PAC ROOT file
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <TRATGeo.h>

// Call the ClassImp() macro to give the TRATGeo class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TRATGeo);
#endif

//namespace TRG {

const TString defaultName = "TRATGeo";
const TString defaultTitle = "class for assembling geometry from RAT-PAC ROOT file";

//______________________________________________________________________________
// default ctor
TRATGeo::TRATGeo()
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = 0;
  fFileName = "";
  fExperiment = "";
  fExperimentPath = "";
  fDB = 0;
  fVolumeList = new TList;
  fActiveCells = new TList;
  fInertCells = new TList;
}

//______________________________________________________________________________
// FindExperiment
TRATGeo::FindExperiment()
{
  if ( fDB == 0x0 ) {
    TString warnLoc = TString::Format("%s::FindExperiment", defaultName.Data());
    TString warnMsg = TString::Format("RAT-PAC database not found in %s; experiment name and path unknown.", fFileName);
    this->Warning(warnLoc.Data(), warnMsg.Data());
    fExperiment = "";
    fExperimentPath = "";
  } else {
//  TPair* tp = fDB->FindObject("DETECTOR[].experiment");
//  TObjString* tos = tp->Value();
    TObjString *tos = fDB->GetValue("DETECTOR[].experiment");
    fExperimentPath = tos->GetString();
    fExperimentPath.ReplaceAll("\"", "");
    TString experimentPath = fExperimentPath;
    TObjArray* toa = experimentPath.Tokenize("/");
    tos = (TObjString*)toa->At(toa->GetEntries()-1);
    fExperiment = tos->GetString();
  }
}

//______________________________________________________________________________
// Init
TRATGeo::Init()
{
  TString errLoc = "TRATGeo::Init()";
  if (gFile) {
    fFile = gFile;
    fFileName = gFile->GetName();
  } else {
    TString errMsg = "Please open a RAT-PAC ROOT file before building geometry.";
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  fDB = (TMap*)fFile->FindObjectAny("db");
  if (fDB == 0) {
    TString errMsg = "RAT-PAC database \"db\" not found\n";
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  FindExperiment();
}

//______________________________________________________________________________
// FindCheckerboardActive
TRATGeo::FindCheckerboardActive( const Int_t kDims ) // = 3
{
  // build check
  TString errLoc = "TRATGeo::GetCheckerboardActive()";
  if ( (fVolumeList==0) || (fVolumeList->GetEntries()==0) ) {
    TString errMsg = "Volume list is currently empty; run TRATGeo::Build() first.";
    this->Error(errLoc.Data(), errMsg.Data());
    return (TList*)0;
  }
  // if list is already filled, simply return pointer
  if ( fActiveCells->GetEntries() != 0 ) return fActiveCells;
  // init
  TRegexp tcr0 = "target_cell_.*_.*", tcr1 = "target_cube_.*_.*";
  TRATVolume *v;
  TIter i(fVolumeList);
  TString vName;
  TObjArray *vNameTOA;
  TObjString *vTOS;
  Int_t R, C, L;
  Bool_t chkTest(kFALSE);
  // MAIN
  for ( i=fVolumeList->begin(); i!=fVolumeList->end(); ++i ) {
    v = (TRATVolume*)*i;
    vName = v->GetName();
    if ( (vName.Contains(tcr0)) || (vName.Contains(tcr1)) ) {
      // extract row, column, and layer
      vNameTOA = vName.Tokenize('_');
      vTOS = (TObjString*)vNameTOA->At(2);
      R = vTOS->GetString().Atoi();
      vTOS = (TObjString*)vNameTOA->At(3);
      C = vTOS->GetString().Atoi();
      vTOS = (TObjString*)vNameTOA->At(4);
      L = vTOS->GetString().Atoi();
      // perform checkerboarding test
      if (kDims==2) {
	chkTest = ( R%2 == C%2 );
      } else if (kDims==3) {
	chkTest = ( (R%2==C%2) && (C%2==L%2) );
      } else {
	TString errMsg = "Invalid checkerboarding dimension";
	this->Error(errLoc.Data(), errMsg.Data());
        return (TList*)0;
      } // end if -- kDims
      // if cell should be active, add it to list
      if (chkTest) fActiveCells->Add(v);
    } // end if -- target-cell regex
  } // end volume-list loop
  return fActiveCells;
}

//______________________________________________________________________________
// FindCheckerboardInert
TRATGeo::FindCheckerboardInert( const Int_t kDims ) // = 3
{
  // build check
  TString errLoc = "TRATGeo::GetCheckerboardActive()";
  if ( (fVolumeList==0) || (fVolumeList->GetEntries()==0) ) {
    TString errMsg = "Volume list is currently empty; run TRATGeo::Build() first.";
    this->Error(errLoc.Data(), errMsg.Data());
    return (TList*)0;
  }
  // if list is already filled, simply return pointer
  if ( fInertCells->GetEntries() != 0 ) return fInertCells;
  // init
  TRegexp tcr0 = "target_cell_.*_.*", tcr1 = "target_cube_.*_.*";
  TRATVolume *v;
  TIter i(fVolumeList);
  TString vName;
  // volume-list loop
  for ( i=fVolumeList->begin(); i!=fVolumeList->end(); ++i ) {
    v = (TRATVolume*)*i;
    vName = v->GetName();
    // add any target cell not on the "active" list to the "inert" list
    if ( (vName.Contains(tcr0)) || (vName.Contains(tcr1)) ) {
      if ( fActiveCells->FindObject(v) == 0 ) fInertCells->Add(v);
    } // end if -- target-cell regex
  } // end volume-list loop
  return fInertCells;
}

//______________________________________________________________________________
// Build
TRATGeo::Build()
{
  Int_t volCount; //debug
  Init();
  // Build init
  TRegexp dbIndexPattern("GEO.*size");
  Long64_t N = fDB->GetEntries();
  TPair *tp;
  TObjString *keyTOS;
  TString keyStr, infoLoc, infoMsg;
  TIter i(db);
  // db entry loop
  infoLoc.Form("%s::Build()", defaultName.Data());
  infoMsg.Form("Generating volumes...");
  this->Info(infoLoc.Data(), infoMsg.Data());
  // db entry loop
  for ( i=db->begin(); i!=db->end(); ++i ) {
    tp = (TPair*)*i;
    keyTOS = (TObjString*)tp->Key();
    keyStr = keyTOS->GetString();
    if ( keyStr.Contains(dbIndexPattern) ) { // relevant entry
      keyStr.ReplaceAll("GEO[","");
      keyStr = keyStr(0, keyStr.Index(']'));
//    infoMsg.Form("Found relevant entry: %s", keyStr.Data()); //debug
//    this->Info("Build()", infoMsg.Data()); //debug
      // create TRATVolume* and add to list
      TRATVolume *v = new TRATVolume(keyStr.Data(), fDB); //KEEPME //debug disable
      volCount++;
//    if (volCount % 10 == 0) cout << volCount << endl; //debug
      v->FindAbsolutePosition();
      fVolumeList->Add(v);
    } // end if -- relevant entry
  } // end db entry loop
infoMsg.Form("Done.\n");
this->Info(infoLoc.Data(), infoMsg.Data());
}

//______________________________________________________________________________
// BuildCheckerboard
TRATGeo::BuildCheckerboard( const Int_t kDims ) // = 3
{
  FindCheckerboardActive(kDims);
  FindCheckerboardInert(kDims);
}

//______________________________________________________________________________
// GetVolume
// -- Note: Result must be cast back to correct type
// -- Example: TRATGeo g; g.Build(); TRATVolume *v = (TRATVolume*)g.GetVolume("water_shield");
TRATGeo::GetVolume(const char* volumeName)
{
  return fVolumeList->FindObject(volumeName);
}

//______________________________________________________________________________
// FindVolumesContaining (TVector3)
TRATGeo::FindVolumesContaining( TVector3 location, Bool_t kPrint )
{
  TList *volList = new TList;
  Double_t x = location.X(), y = location.Y(), z = location.Z();
  TRATVolume *v;
  TVector3 vXYZ, vSizeXYZ;
  Bool_t inX, inY, inZ;
  TIter i(fVolumeList);
  for ( i=fVolumeList->begin(); i!=fVolumeList->end(); ++i ) {
    v = (TRATVolume*)*i;
    vXYZ = v->GetAbsolutePosition();
    vSizeXYZ = v->GetSize();
    inX = ( TMath::Abs(x-vXYZ.X()) < vSizeXYZ.X() );
    inY = ( TMath::Abs(y-vXYZ.Y()) < vSizeXYZ.Y() );
    inZ = ( TMath::Abs(z-vXYZ.Z()) < vSizeXYZ.Z() );
    if ( inX && inY && inZ ) volList->Add(v);
  }
  if (kPrint) volList->Print();
  return volList;
  delete volList;
}

//______________________________________________________________________________
// FindVolumesContaining (Double_t...)
TRATGeo::FindVolumesContaining(Double_t x, Double_t y, Double_t z, Bool_t kPrint)
{
  TList *volList = (TList*)FindVolumesContaining( TVector3(x,y,z), kPrint );
  return volList;
}

//______________________________________________________________________________
// FindLowestVolumeContaining (TVector3)
TRATGeo::FindLowestVolumeContaining( TVector3 location )
{
  TRATVolume *v0, *v1;
  TList *volList = (TList*)FindVolumesContaining(location);
  TIter i(volList), j(volList);
  TString volName, motherVolName;
  Bool_t matchFound;
  for ( i=volList->begin(); i!=volList->end(); ++i ) {
    matchFound = kFALSE;
    v0 = (TRATVolume*)*i;
    volName = v0->GetName();
    for ( j=volList->begin(); j!=volList->end(); ++j ) {
      v1 = (TRATVolume*)*j;
      motherVolName = v1->GetMother();
      if ((volName.Contains(motherVolName)) && (motherVolName.Length()>0)) {
	matchFound = kTRUE;
        continue;
      }
    }
    if (! matchFound) return v0;
  }
}

//______________________________________________________________________________
// FindLowestVolumeContaining (Double_t...)
TRATGeo::FindLowestVolumeContaining( Double_t x, Double_t y, Double_t z)
{
  TRATVolume *v = (TRATVolume*)g.FindLowestVolumeContaining( TVector3(x,y,z) );
  return v;
}

//______________________________________________________________________________
// ShowVolume
TRATGeo::ShowVolume(const char* volumeName)
{
  TRATVolume* v = (TRATVolume*)fVolumeList->FindObject(volumeName);
  v->Print();
}

//______________________________________________________________________________
// ShowAll
TRATGeo::ShowAll()
{
  TRATVolume* v;
  TIter i(fVolumeList);
  for ( i=fVolumeList->begin(); i!=fVolumeList->end(); ++i ) {
    v = (TRATVolume*)*i;
    v->Print();
  }
}

//______________________________________________________________________________
// Types
TRATGeo::Types()
{
  TString volName, volType;
  TRATVolume* vol;
  Int_t k, N(fVolumeList->GetEntries());
  for ( k=0; k<(N-1); k++ ) {
    vol = (TRATVolume*)fVolumeList->At(k);
    volName = vol->GetName();
    volType = vol->GetVolumeType();
    printf( "%s\t\t%s\n", volName.Data(), volType.Data() );
  }
}

//______________________________________________________________________________
// Materials
TRATGeo::Materials()
{
  TString volName, volMaterial;
  TRATVolume* vol;
  Int_t k, N(fVolumeList->GetEntries());
  for ( k=0; k<(N-1); k++ ) {
    vol = (TRATVolume*)fVolumeList->At(k);
    volName = vol->GetName();
    volMaterial = vol->GetMaterial();
    printf( "%s\t\t%s\n", volName.Data(), volMaterial.Data() );
  }
}

//______________________________________________________________________________
// Mothers
TRATGeo::Mothers()
{
  TString volName, volMother;
  TRATVolume* vol;
  Int_t k, N(fVolumeList->GetEntries());
  for ( k=0; k<(N-1); k++ ) {
    vol = (TRATVolume*)fVolumeList->At(k);
    volName = vol->GetName();
    volMother = vol->GetMother();
    printf( "%s\t\t%s\n", volName.Data(), volMother.Data() );
  }
}

//______________________________________________________________________________
// Sizes
TRATGeo::Sizes()
{
  TString volName;
  TVector3 *volSize;
  TRATVolume* vol;
  Int_t k, N(fVolumeList->GetEntries());
  for ( k=0; k<(N-1); k++ ) {
    vol = (TRATVolume*)fVolumeList->At(k);
    volName = vol->GetName();
    volSize = vol->GetSize();
    printf( "%s\t\t%f  %f  %f\n", volName.Data(), volSize->X(), volSize->Y(), volSize->Z() );
  }
}

//______________________________________________________________________________
// Positions
TRATGeo::Positions()
{
  TString volName;
  TVector3 volPosition;
  TRATVolume* vol;
  Int_t k, N(fVolumeList->GetEntries());
  for ( k=0; k<(N-1); k++ ) {
    vol = (TRATVolume*)fVolumeList->At(k);
    volName = vol->GetName();
    volPosition = vol->GetAbsolutePosition();
    printf( "%s\t\t%f  %f  %f\n", volName.Data(), volPosition.X(), volPosition.Y(), volPosition.Z() );
  }
}

////______________________________________________________________________________
//TRATGeo::
//{
//}

////______________________________________________________________________________
//TRATGeo::
//{
//}

//______________________________________________________________________________
// override Print
TRATGeo::Print()
{
  printf("\n");
  printf("%s\t%s\t%s\n", Class_Name(), GetName(), GetTitle());
  printf("Experiment:\t\t%s\n", fExperiment.Data());
  printf("Experiment Path:\t%s\n", fExperimentPath.Data());
  printf("ROOT File:\t%s\n", fFileName);
  printf("RAT-PAC Database TMap*: "); cout << fDB << endl;
  printf("Entries: %d\n", fVolumeList->GetEntries());
  printf("Volume List:  "); cout << fVolumeList << endl;
//fVolumeList->Print();
  printf("\n");
}

//} // namespace TRG

// all pau!   )
