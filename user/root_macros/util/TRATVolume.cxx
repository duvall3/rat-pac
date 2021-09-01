// TRATVolume -- class for analyzing geometry in a RAT-PAC ROOT file
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

const TString defaultName = "TRATVolume";
const TString defaultTitle = "class for analyzing geometry in a RAT-PAC ROOT file";
const char* defaultVolNameChr = "volume_name";
const TString defaultVolName = TString("volume_name");
TString keyStr;

//______________________________________________________________________________
// default ctor
TRATVolume::TRATVolume()
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fVolNameChr = defaultVolNameChr;
  fVolName = defaultVolName;
  fFile = 0;
  fFileName = "";
  fExperiment = "";
  fExperimentPath = "";
  fDB = 0;
  fMother = "";
  fRelativePosition = TVector3(0.0,0.0,0.0);
  fAbsolutePosition = TVector3(0.0,0.0,0.0);
//fHistList = new TObjArray;
}

//______________________________________________________________________________
// primary ctor
TRATVolume::TRATVolume( const char* name )
{
  // init and check for existence
  if (name == "") {
    TString errMsg = TString::Format("Invalid volume name \"%s\"\n", name);
    this->Error("TRATVolume(const char* name)", errMsg.Data());
    return;
  }
  fDB = (TMap*)gDirectory->FindObjectAny("db");
  if (fDB == 0) {
    TString errMsg = "RAT-PAC database \"db\" not found\n";
    this->Error("TRATVolume(const char* name)", errMsg.Data());
    return;
  }
  TString dbKey = TString::Format("GEO[%s].size", name);
  if (fDB->GetValue(dbKey) == 0) {
    TString errMsg = TString::Format("No volume found with name \"%s\"\n", name);
    this->Error("TRATVolume(const char* name)", errMsg.Data());
    return;
  }
  // set (remaining) members
  SetName(name);
  TString titStr = TString::Format("TRATVolume for volume \"%s\"", name);
  SetTitle(titStr.Data());
  fVolNameChr = name;
  fVolName = TString(name);
  if (gFile) {
    fFileName = gFile->GetName();
  } else {
    fFileName = "";
  }
  FindExperiment();
  FindMother();
  FindRelativePosition();
//FindAbsolutePosition();
}

//______________________________________________________________________________
// FindExperiment
TRATVolume::FindExperiment()
{
//TMap* db = (TMap*)fFile->FindObjectAny("db");
  if ( fDB == 0x0 ) {
    TString warnLoc = TString::Format("%s::FindExperiment", Class_Name());
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
// FindMother
TRATVolume::FindMother()
{
  keyStr.Form("GEO[%s].mother", fVolNameChr);
  TObjString* motherTOS = fDB->GetValue(keyStr.Data());
  TString mother = motherTOS->GetString();
  mother.ReplaceAll("\"","");
  fMother = mother;
}

//______________________________________________________________________________
// FindRelativePosition
TRATVolume::FindRelativePosition()
{
  TString valStrRelative;
  TObjString* valTOS, xTOS, yTOS, zTOS;
  TObjArray* posArr;
  keyStr.Form("GEO[%s].position", fVolNameChr);
  if ( fDB->GetValue(keyStr.Data()) != 0 ) {
    valTOS = (TObjString*)fDB->GetValue(keyStr.Data());
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
  TVector3 volTrans;
  TString motherVolName = fMother;
  // mother loop
//while ( motherVolName != "" ) { // keeps giving free(): Invalid pointer//Aborted (core dumped)
  for ( Int_t k=0; k<1000; k++ ) { // workaround: valid for volume nesting depths up to 1000 levels
    if ( motherVolName == "" ) {
      TString infoMsg = "Reached top volume\n"; //debug
//    this->Info("FindAbsolutePosition()", infoMsg.Data()); //debug
      break;
    } else {
//    cout << motherVolName.Data() << endl; //debug
      TRATVolume motherVol = TRATVolume(motherVolName.Data());
      volTrans += motherVol.GetRelativePosition();
      motherVolName = motherVol.GetMother();
      motherVolName.ReplaceAll("\"","");
//    cout << motherVolName.Data() << endl; //debug
    } // end if
  } // end mother loop
  fAbsolutePosition = fRelativePosition + volTrans;
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
  printf("Experiment:\t%s\n", fExperiment.Data());
  printf("ROOT File:\t%s\n", fFileName);
  printf("Volume Name (chr): %s\nVolume Name (TString): %s\n", fVolNameChr, fVolName.Data());
  printf("RAT-PAC Database TMap*: "); cout << fDB << endl;
  printf("Mother Volume: %s\n", fMother.Data());
  printf("Relative Position: "); fRelativePosition.Print();
  printf("Absolute Position: "); fAbsolutePosition.Print();
//printf("Relative Position: %f %f %f\n", fRelativePosition.X(), fRelativePosition.Y(), fRelativePosition.Z());
//printf("Absolute Position: %f %f %f\n", fAbsolutePosition.X(), fAbsolutePosition.Y(), fAbsolutePosition.Z());
//fCutList->ls(); //temp
//fHistList->ls(); //temp
  printf("\n");
}

// all pau!   )
