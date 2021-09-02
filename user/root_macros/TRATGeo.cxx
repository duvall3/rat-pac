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
}

//______________________________________________________________________________
// FindExperiment
TRATGeo::FindExperiment()
{
  if ( fDB == 0x0 ) {
    TString warnLoc = TString::Format("%s::FindExperiment", defaultName.Data());
    TString warnMsg = TString::Format("RAT-PAC database not found in %s; experiment name and path unknown.", fFileName);
    Warning(warnLoc.Data(), warnMsg.Data());
    fExperiment = "";
    fExperimentPath = "";
  } else {
    TPair* tp = fDB->FindObject("DETECTOR[].experiment");
    TObjString* tos = tp->Value();
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
  if (gFile) {
    fFile = gFile;
    fFileName = gFile->GetName();
  } else {
    fFile = 0;
    fFileName = "";
  }
  fDB = (TMap*)fFile->FindObjectAny("db");
  if (fDB == 0) {
    TString errLoc = TString::Format("%s::TRATVolume(const char* name)", defaultName.Data());
    TString errMsg = "RAT-PAC database \"db\" not found\n";
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  FindExperiment();
}

//______________________________________________________________________________
// Build
TRATGeo::Build()
{
  Init();
  // Build init
  TRegexp dbIndexPattern("GEO.*size");
  Long64_t N = fDB->GetEntries();
  TPair* tp;
  TObjString* keyTOS;
  TString keyStr, infoLoc, infoMsg;
  TIter i(db);
  // db entry loop
  infoLoc.Form("%s::Build()", defaultName.Data());
  infoMsg.Form("Generating volumes...");
  this->Info(infoLoc.Data(), infoMsg.Data());
  for ( i=db->begin(); i!=db->end(); ++i ) {
    tp = (TPair*)*i;
    keyTOS = (TObjString*)tp->Key();
    keyStr = keyTOS->GetString();
    if ( keyStr.Contains(dbIndexPattern) ) { // relevant entry
      keyStr.ReplaceAll("GEO[","");
      keyStr.ReplaceAll("].size","");
//    infoMsg.Form("Found relevant entry: %s", keyStr.Data()); //debug
//    this->Info("Build()", infoMsg.Data()); //debug
      // create TRATVolume* and add to list
      TRATVolume* v = new TRATVolume(keyStr.Data());
      v->FindAbsolutePosition();
      fVolumeList->Add(v);
    } // end if -- relevant entry
  } // end db entry loop
  infoMsg.Form("Done.");
  this->Info(infoLoc.Data(), infoMsg.Data());
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
  TVector3 volSize;
  TRATVolume* vol;
  Int_t k, N(fVolumeList->GetEntries());
  for ( k=0; k<(N-1); k++ ) {
    vol = (TRATVolume*)fVolumeList->At(k);
    volName = vol->GetName();
    volSize = vol->GetSize();
    printf( "%s\t\t%f  %f  %f\n", volName.Data(), volSize.X(), volSize.Y(), volSize.Z() );
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
  printf("Volume List:\n");
  fVolumeList->Print();
  printf("\n");
}

// all pau!   )
