// TRATVolume -- class for analyzing geometry from RAT-PAC ROOT file
// -- NOTE: To be set properly, TRATVolume::FindAbsolutePosition() *MUST* be run
//         after an object is created
//    -- Example: TRATVolume v("water_shield"); v.FindAbsolutePosition();
//    -- This does *not* need to be done manually if TRATVolume objects
//         are created by TRATGeo::Build()
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

#include <TRATVolume.h>

// Call the ClassImp() macro to give the TRATVolume class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TRATVolume);
#endif

namespace TRV {

const TString defaultName = "TRATVolume";
const TString defaultTitle = "class for analyzing geometry from RAT-PAC ROOT file";
const char* defaultVolNameChr = "volume_name";
const TString defaultVolName = TString("volume_name");
TString keyStrVol;

//______________________________________________________________________________
// default ctor
TRATVolume::TRATVolume()
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fVolNameChr = defaultVolNameChr;
  fVolName = defaultVolName;
//fFile = 0;
//fFileName = "";
  fExperiment = "";
  fExperimentPath = "";
  fDB = 0;
  fVolumeType = "";
  fMother = "";
  fSize = TVector3(0.0,0.0,0.0);
  fRelativePosition = TVector3(0.0,0.0,0.0);
  fAbsolutePosition = TVector3(0.0,0.0,0.0);
}

//______________________________________________________________________________
// primary ctor
TRATVolume::TRATVolume( const char* name )
{
  // init DB and check for existence
  TString errLoc = TString::Format("%s::TRATVolume(const char* name)", defaultName.Data());
  if (name == "") {
    TString errMsg = TString::Format("Invalid volume name \"%s\"\n", name);
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  fDB = (TMap*)gDirectory->FindObjectAny("db");
  if (fDB == 0) {
    TString errMsg = "RAT-PAC database \"db\" not found\n";
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  TString dbKey = TString::Format("GEO[%s].type", name);
  if (fDB->GetValue(dbKey) == 0) {
    TString errMsg = TString::Format("No volume found with name \"%s\"\n", name);
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  // set remaining members
  SetName(name);
  TString titStr = TString::Format("TRATVolume for \"%s\"", name);
  SetTitle(titStr.Data());
  fVolName = TString(name);
  fVolNameChr = fVolName.Data();
//if (gFile) {
//  fFile = gFile;
//  fFileName = gFile->GetName();
//} else {
//  fFile = 0;
//  fFileName = "";
//}
  FindAll();
//FindAbsolutePosition();
}

//______________________________________________________________________________
// FindAll
TRATVolume::FindAll()
{
  FindExperiment();
  FindVolumeType();
  FindMaterial();
  FindMother();
  FindSize();
  FindRelativePosition();
}

//______________________________________________________________________________
// FindExperiment
TRATVolume::FindExperiment()
{
  if ( fDB == 0x0 ) {
    TString warnLoc = TString::Format("%s::FindExperiment()", defaultName.Data());
//  TString warnMsg = TString::Format("RAT-PAC database not found in %s; experiment name and path unknown.", fFileName);
    TString warnMsg = TString::Format("RAT-PAC database not found in file; experiment name and path unknown.");
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
// FindMaterial
TRATVolume::FindMaterial()
{
  keyStrVol.Form("GEO[%s].material", fVolNameChr);
  TObjString* typeTOS = fDB->GetValue(keyStrVol.Data());
  TString volMaterial = typeTOS->GetString();
  volMaterial.ReplaceAll("\"","");
  fMaterial = volMaterial;
}

//______________________________________________________________________________
// FindVolumeType
TRATVolume::FindVolumeType()
{
  keyStrVol.Form("GEO[%s].type", fVolNameChr);
  TObjString* typeTOS = fDB->GetValue(keyStrVol.Data());
  TString volumeType = typeTOS->GetString();
  volumeType.ReplaceAll("\"","");
  fVolumeType = volumeType;
}

//______________________________________________________________________________
// FindMother
TRATVolume::FindMother()
{
  keyStrVol.Form("GEO[%s].mother", fVolNameChr);
  TObjString* motherTOS = fDB->GetValue(keyStrVol.Data());
  TString mother = motherTOS->GetString();
  mother.ReplaceAll("\"","");
  fMother = mother;
}

//______________________________________________________________________________
// FindSize
TRATVolume::FindSize()
{
  TString valStrRelative;
  TObjString* valTOS, dxTOS, dyTOS, dzTOS;
  TObjArray* sizeArr;
  keyStrVol.Form("GEO[%s].size", fVolNameChr);
  if (fDB->GetValue(keyStrVol.Data())) {
    valTOS = (TObjString*)fDB->GetValue(keyStrVol.Data());
    valStrRelative = valTOS->GetString();
    valStrRelative.ReplaceAll("[","");
    valStrRelative.ReplaceAll("d","");
    valStrRelative.ReplaceAll("]","");
    valStrRelative.Replace(valStrRelative.Last(','), 1, "");
    sizeArr = valStrRelative.Tokenize(",");
    dxTOS = (TObjString*)sizeArr->At(0);
    dyTOS = (TObjString*)sizeArr->At(1);
    dzTOS = (TObjString*)sizeArr->At(2);
    fSize = TVector3( dxTOS.GetString().Atoll(), dyTOS.GetString().Atoll(), dzTOS.GetString().Atoll() ); // ROOT wanted "." member access operators
  }
}

//______________________________________________________________________________
// FindRelativePosition
TRATVolume::FindRelativePosition()
{
  TString valStrRelative;
  TObjString* valTOS, xTOS, yTOS, zTOS;
  TObjArray* posArr;
  keyStrVol.Form("GEO[%s].position", fVolNameChr);
  if ( fDB->GetValue(keyStrVol.Data()) != 0 ) {
    valTOS = (TObjString*)fDB->GetValue(keyStrVol.Data());
    valStrRelative = valTOS->GetString();
    valStrRelative.ReplaceAll("[","");
    valStrRelative.ReplaceAll("d","");
    valStrRelative.ReplaceAll("]","");
    valStrRelative.Replace(valStrRelative.Last(','), 1, "");
    posArr = valStrRelative.Tokenize(",");
    xTOS = (TObjString*)posArr->At(0);
    yTOS = (TObjString*)posArr->At(1);
    zTOS = (TObjString*)posArr->At(2);
    fRelativePosition = TVector3( xTOS.GetString().Atoll(), yTOS.GetString().Atoll(), zTOS.GetString().Atoll() ); // ROOT wanted "." member access operators
  } else { // no position given ==> use default at (0,0,0)
    fRelativePosition = TVector3(0.0,0.0,0.0);
  }
}

//______________________________________________________________________________
// FindAbsolutePosition
TRATVolume::FindAbsolutePosition()
{
  if (fMother == "") {
//  TString infoMsg = "Top volume is located at (0,0,0) by definition.";
//  this->Info("FindAbsolutePosition", infoMsg.Data()); //debug
    fAbsolutePosition = TVector3(0.0,0.0,0.0);
  } else {
    TVector3 volTrans;
    TString motherVolName = fMother;
    // mother loop
  //while ( motherVolName != "" ) { // keeps giving free(): Invalid pointer//Aborted (core dumped)
    for ( Int_t k=0; k<1000; k++ ) { // workaround: valid for volume nesting depths up to 1000 levels
      if ( motherVolName == "" ) {
        TString infoMsg = "Reached top volume"; // KEEP ME
//      this->Info("FindAbsolutePosition", infoMsg.Data()); //debug
	break;
      } else {
//      cout << motherVolName.Data() << endl; //debug
	TRATVolume motherVol = TRATVolume(motherVolName.Data());
	volTrans += motherVol.GetRelativePosition();
	motherVolName = motherVol.GetMother();
	motherVolName.ReplaceAll("\"","");
//      cout << motherVolName.Data() << endl; //debug
      } // end if
    } // end mother loop
    fAbsolutePosition = fRelativePosition + volTrans;
  }
}

////______________________________________________________________________________
//TRATVolume::
//{
//}

////______________________________________________________________________________
//TRATVolume::
//{
//}

////______________________________________________________________________________
//TRATVolume::
//{
//}

//______________________________________________________________________________
// override Print
TRATVolume::Print()
{
  printf("\n");
  printf("%s\t%s\t%s\n", Class_Name(), GetName(), GetTitle());
  printf("Volume Name: %s\n", fVolNameChr);
//printf("ROOT File: "); cout << fFile << endl;
//printf("ROOT Filename:\t%s\n", fFileName);
  printf("Experiment:\t\t%s\n", fExperiment.Data());
  printf("Experiment Path:\t%s\n", fExperimentPath.Data());
  printf("RAT-PAC Database TMap: "); cout << fDB << endl;
  printf("Volume Type: %s\n", fVolumeType.Data());
  printf("Material: %s\n", fMaterial.Data());
  printf("Mother Volume: %s\n", fMother.Data());
  printf("Volume Size: %f  %f  %f\n", fSize.X(), fSize.Y(), fSize.Z());
  printf("Relative Position: %f  %f  %f\n", fRelativePosition.X(), fRelativePosition.Y(), fRelativePosition.Z());
  printf("Absolute Position: %f  %f  %f\n", fAbsolutePosition.X(), fAbsolutePosition.Y(), fAbsolutePosition.Z());
  printf("\n");
}

} // namespace TRV

// all pau!   )
