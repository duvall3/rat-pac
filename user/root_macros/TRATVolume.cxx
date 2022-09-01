// TRATVolume -- class for analyzing geometry from RAT-PAC ROOT file
// -- NOTE: To be set properly, TRATVolume::FindAbsolutePosition() *MUST* be run
//         after an object is created
//    -- Example: TRATVolume v("water_shield"); v.FindAbsolutePosition();
//    -- This does *not* need to be done manually if TRATVolume objects
//         are created by TRATGeo::Build()
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/2021 ~ //
// Updated 07/2022

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
  fVolumeType = "";
  fMaterial = "";
  fMother = "";
  fSize = TVector3(0.0,0.0,0.0);
  fRMin = 0.0;
  fRMax = 0.0;
  fSizeZ = 0.0;
  fRelativePosition = TVector3(0.0,0.0,0.0);
  fAbsolutePosition = TVector3(0.0,0.0,0.0);
}

//______________________________________________________________________________
// primary ctor
TRATVolume::TRATVolume( const char* name, const TMap *db )
{
  // init DB and check for existence
  TString *errLoc = new TString;
  errLoc->Form("%s::TRATVolume(const char* name)", defaultName.Data());
  if (name == "") {
    TString errMsg = TString::Format("Invalid volume name \"%s\"\n", name);
    this->Error(errLoc->Data(), errMsg.Data());
    return;
  }
  if (gFile) {
    fFile = gFile;
    fFileName = gFile->GetName();
  } else {
    TString errMsg = "Please open a RAT-PAC ROOT file before analyzing volumes.";
    this->Error(errLoc->Data(), errMsg.Data());
    return;
  }
//fDB = (TMap*)gDirectory->Get("db"); // CAUSED MEMORY LEAK
  fDB = db;
  if (fDB == 0) {
    TString errMsg = "RAT-PAC database \"db\" not found\n";
    this->Error(errLoc->Data(), errMsg.Data());
    return;
  }
  TString *dbKey = new TString;
  dbKey->Form("GEO[%s].type", name);
  if (fDB->GetValue(dbKey->Data()) == 0) {
    TString errMsg = TString::Format("No volume found with name \"%s\"\n", name);
    this->Error(errLoc->Data(), errMsg.Data());
    return;
  }
  // set remaining members
  SetName(name);
  TString *titStr = new TString;
  titStr->Form("TRATVolume for \"%s\"", name);
  SetTitle(titStr->Data());
  fVolNameChr = name;
  fVolName = TString(fVolNameChr);
  FindAll();
//FindAbsolutePosition();
  // cleanup
  delete errLoc;
  delete dbKey;
  delete titStr;
//// possible fix for derived quantities (honestly no idea why)
//Print(kTRUE);
}

//______________________________________________________________________________
// SetVolume
void TRATVolume::SetVolume(const char* newNameChr)
{
  TString errLoc = TString::Format("%s::TRATVolume(const char* name)", defaultName.Data());
  if (newNameChr == "") {
    TString errMsg = TString::Format("Invalid volume name \"%s\"\n", newNameChr);
    this->Error(errLoc.Data(), errMsg.Data());
    return;
  }
  SetName(newNameChr);
  TString titStr = TString::Format("TRATVolume for \"%s\"", newNameChr);
  SetTitle(titStr.Data());
  fVolNameChr = newNameChr;
  fVolName = TString(newNameChr);
  FindAll();
  FindAbsolutePosition();
  return;
}

//______________________________________________________________________________
// FindAll
void TRATVolume::FindAll()
{
  FindExperiment();
  FindVolumeType();
  FindMaterial();
  FindDensity();
  FindMother();
  FindSize();
  FindRelativePosition();
  return;
}

//______________________________________________________________________________
// FindExperiment
void TRATVolume::FindExperiment()
{
  if ( fDB == 0x0 ) {
    TString warnLoc = "TRATVolume::FindExperiment()";
    TString warnMsg = TString::Format("RAT-PAC database not found in %s; experiment name and path unknown.", fFileName);
    Warning(warnLoc.Data(), warnMsg.Data());
    fExperiment = "";
    fExperimentPath = "";
  } else {
    TObjString *tos = fDB->GetValue("DETECTOR[].experiment");
    fExperimentPath = tos->GetString();
    fExperimentPath.ReplaceAll("\"", "");
    TString *experimentPath = &fExperimentPath;
    TObjArray* toa = experimentPath->Tokenize("/");
    tos = (TObjString*)toa->At(toa->GetEntries()-1);
    fExperiment = tos->GetString();
  }
  return;
}

//______________________________________________________________________________
// FindMaterial
void TRATVolume::FindMaterial()
{
  keyStrVol.Form("GEO[%s].material", fVolNameChr);
  TObjString* matTOS = fDB->GetValue(keyStrVol.Data());
  TString volMaterial = matTOS->GetString();
  volMaterial.ReplaceAll("\"","");
  fMaterial = volMaterial;
  return;
}

//______________________________________________________________________________
// FindDensity
void TRATVolume::FindDensity()
{
  TString keyStr = TString::Format("MATERIAL[%s].density", fMaterial.Data());
  TObjString *dos = (TObjString*)fDB->GetValue(keyStr.Data());
  TString dStr = dos->GetString();
  dStr.ReplaceAll("d","");
  Double_t density = dStr.Atof();
  fDensity = density;
  return;
}

//______________________________________________________________________________
// FindVolumeType
void TRATVolume::FindVolumeType()
{
  keyStrVol.Form("GEO[%s].type", fVolNameChr);
  TObjString* typeTOS = fDB->GetValue(keyStrVol.Data());
  TString volumeType = typeTOS->GetString();
  volumeType.ReplaceAll("\"","");
  fVolumeType = volumeType;
  return;
}

//______________________________________________________________________________
// FindMother
void TRATVolume::FindMother()
{
  keyStrVol.Form("GEO[%s].mother", fVolNameChr);
  TObjString* motherTOS = fDB->GetValue(keyStrVol.Data());
  TString mother = motherTOS->GetString();
  mother.ReplaceAll("\"","");
  fMother = mother;
  return;
}

//______________________________________________________________________________
// FindSize
void TRATVolume::FindSize()
{
  TString valStrRelative;
  if ( fVolumeType.Contains("box") ) { 			//TODO: change this 'if' to a 'switch' using Enums for the volume types
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
  } else if ( fVolumeType.Contains("tube") ) {
    TObjString *valTOS;
    TString r_maxStr, size_zStr;
    keyStrVol.Form("GEO[%s].r_max", fVolNameChr);
    if (fDB->GetValue(keyStrVol.Data())) {
      valTOS = (TObjString*)fDB->GetValue(keyStrVol.Data());
      r_maxStr = valTOS->GetString();
      r_maxStr.ReplaceAll("d","");
      fRMax = r_maxStr.Atof();
    }
    keyStrVol.Form("GEO[%s].size_z", fVolNameChr);
    if (fDB->GetValue(keyStrVol.Data())) {
      valTOS = (TObjString*)fDB->GetValue(keyStrVol.Data());
      size_zStr = valTOS->GetString();
      size_zStr.ReplaceAll("d","");
      fSizeZ = size_zStr.Atof();
    }
  } // end "tube"
  return;
}

//______________________________________________________________________________
// FindRelativePosition
void TRATVolume::FindRelativePosition()
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
  return;
}

//______________________________________________________________________________
// FindAbsolutePosition
void TRATVolume::FindAbsolutePosition()
{
  TRATVolume *motherVol;
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
//      motherVol->SetVolume(motherVolName.Data());
	motherVol = new TRATVolume(motherVolName.Data(), fDB);
	volTrans += *(motherVol->GetRelativePosition());
	motherVolName = motherVol->GetMother();
	motherVolName.ReplaceAll("\"","");
      } // end if
    } // end mother loop
  fAbsolutePosition = fRelativePosition + volTrans;
  delete motherVol;
  }
  return;
}

//______________________________________________________________________________
// Area	// m^2	// currently box-type only
Double_t TRATVolume::Area()
{
  if ( fVolumeType == "box" ) {
    Double_t l = 2*fSize.X()*1.e-3, w = 2*fSize.Y()*1.e-3, h = 2*fSize.Z()*1.e-3;
    Double_t A = 2 * (l*w + w*h + h*l);
//  printf("%f %f %f\t%e\n", fSize.X(), fSize.Y(), fSize.Z(), A); //debug
    return A;
  } else {
    this->Warning("TRATVolume::Area", "currently implemented for \"box\"-type volumes only\n");
    return 0.;
  }
}

//______________________________________________________________________________
// Volume // m^3  // currently box-type only
Double_t TRATVolume::Volume()
{
  if ( fVolumeType == "box" ) {
    Double_t l = 2*fSize.X()*1.e-3, w = 2*fSize.Y()*1.e-3, h = 2*fSize.Z()*1.e-3;
    Double_t V = l * w * h;
    return V;
//  return 2.5; //debug
  } else {
    this->Warning("TRATVolume::Volume", "currently implemented for \"box\"-type volumes only\n");
    return 0.;
  }
}

//______________________________________________________________________________
// NuFlux
Double_t TRATVolume::NuFlux( Double_t standoff, Double_t reactorNuRate )
{
  Double_t nuFlux = reactorNuRate / ( 4 * TMath::Pi() * standoff**2 );
  return nuFlux;
}

//______________________________________________________________________________
// IBDVolRate
// some typical values: standoff = 500 cm, reactorNuRate = 4e18 nu_e_bar/s, nH = 5.16e22 hydrogens/cm^3
Double_t TRATVolume::IBDVolRate( Double_t standoff, Double_t reactorNuRate, Double_t nH )
{
  Double_t nuFlux = NuFlux(standoff, reactorNuRate);
  Double_t volRate = nH * 5.e-43 * nuFlux; // IBD cross-section ~ 5x10^-43 cm^2 at E_nu ~ 2 MeV (mTC Invited Article)
  return volRate;
}

//______________________________________________________________________________
// override Print
void TRATVolume::Print()
{
  printf("\n");
  printf("%s at 0x%x\n", Class_Name(), this);
  printf("Volume Name: %s\n", GetName());
  printf("ROOT File: "); cout << fFile << endl;
  printf("ROOT Filename: %s\n", fFileName);
  printf("Experiment:  %s\n", fExperiment.Data());
  printf("Experiment Path: %s\n", fExperimentPath.Data());
  printf("RAT-PAC Database TMap: "); cout << fDB << endl;
  printf("Volume Type: %s\n", fVolumeType.Data());
  printf("Material: %s\n", fMaterial.Data());
  printf("Mother Volume: %s\n", fMother.Data());
  if (fVolumeType.Contains("box")) {
    printf("Volume Half-Size (mm): %f  %f  %f\n", fSize.X(), fSize.Y(), fSize.Z());
  } else if (fVolumeType.Contains("tube")) {
    printf("Minimum Radius (mm): %f\nMaximum Radius (mm): %f\nHalf-height (mm): %f\n", fRMin, fRMax, fSizeZ);
  }
  printf("Relative Position (mm): %f  %f  %f\n", fRelativePosition.X(), fRelativePosition.Y(), fRelativePosition.Z());
  printf("Absolute Position (mm): %f  %f  %f\n", fAbsolutePosition.X(), fAbsolutePosition.Y(), fAbsolutePosition.Z());
  printf("\n");
  return;
}

//______________________________________________________________________________
// PrintDerived
void TRATVolume::PrintDerived()
{
  printf("\n");
  printf("Volume Name: %s\n", GetName());
  printf("Area:\t%e m^2\t%e cm^2\t%e mm^2\n", Area(), AreaCM(), AreaMM());
  printf("Volume:\t%e m^3\t%e cm^3\t%e mm^3\t%e L\n", Volume(), VolumeCM(), VolumeMM(), VolumeL());
  printf("Mass:\t%e kg\t\t%e g\t\t%e t\n", Mass(), MassG(), MassTons());
  /* printf("Muogenic Neutron Rate at Sea Level (cps): %e\n", MuNeutronRate()); */
  printf("\n");
  return;
}

// TODO: HOLD until args converted to data members (see header file)
/* //______________________________________________________________________________ */
/* // PrintIBD */
/* void TRATVolume::PrintIBD() */
/* { */
/*   printf("\n"); */
/*   printf("Volume Name: %s\n", GetName()); */
/*   printf("Reactor-Antineutrino Flux: %e nu_e_bar / cm^2 / s\n", NuFlux(...); */
/*   printf("Volumetric IBD Rate: %e IBD / cm^3 / s\n", IBDVolRate(...); */
/*   printf("IBD Rate for this volume: %e IBD / s\n", IBDRate(...); */
/*   printf("\n"); */
/* } */

////______________________________________________________________________________
//TRATVolume::
//{
//}

// all pau!   )
