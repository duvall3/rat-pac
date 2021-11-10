// TIBDParams -- class for storing and calculating basic IBD parameters
// -- NOTE: Default units are as follows, though some alternatives are provided:
//      * {Length,Area,Volume} (cm^{1,2,3})    * Energy (MeV)    * Time (s)
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

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

#include <TIBDParams.h>

// Call the ClassImp() macro to give the TIBDParams class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TIBDParams);
#endif

//______________________________________________________________________________
// default ctor
TIBDParams::TIBDParams()
{
  SetName("TIBDParams");
  SetTitle("class for basic IBD parameters");
  fReactorNuRate = 0.; // nu_e_bar / s
  fStandoff = 0.; // cm
  fnH = 0.; // H_atoms / cm^3
  fTRV = 0; // default TRATVolume empty
}

//______________________________________________________________________________
// base NCNR ctor
// -- values are for miniTimeCube (EJ-254) at 5m-baseline from NIST NCNR reactor (20MW_Th)
TIBDParams::TIBDParams( TRATVolume *TRV )
{
  TString name = TString::Format("TIBDParams_%s", TRV->GetName());
  SetName(name.Data());
  SetTitle("class for basic IBD parameters");
  fReactorNuRate = 4.e18; // nu_e_bar / s
  fStandoff = 500.; // cm
  fnH = 5.16e22; // H_atoms / cm^3
  fTRV = TRV;
}

//______________________________________________________________________________
// full ctor
TIBDParams::TIBDParams( Double_t reactorNuRate, Double_t standoff, Double_t nH, TRATVolume *TRV )
{
  TString name = TString::Format("TIBDParams_%s", TRV->GetName());
  SetName(name.Data());
  SetTitle("class for basic IBD parameters");
  fReactorNuRate = reactorNuRate;
  fStandoff = standoff;
  fnH = nH;
  fTRV = TRV;
}

//______________________________________________________________________________
// SetVolume
TIBDParams::SetVolume( TRATVolume *TRV )
{
  TString errLoc, errMsg;
  if (TRV == 0) {
    errLoc.Form("TIBDParams::SetVolume");
    errMsg.Form("Invalid TRATVolume 0x%x.", TRV);
    this->Error(errLoc.Data(), errMsg.Data());
  } else {
    fTRV = TRV;
  }
}

//______________________________________________________________________________
// NuFlux
TIBDParams::NuFlux()
{
  Double_t sphArea = 4. * TMath::Pi() * fStandoff**2;
  Double_t nuFlux = fReactorNuRate / sphArea;
  return nuFlux;
}

//______________________________________________________________________________
// IBDVolRate
TIBDParams::IBDVolRate()
{
  Double_t volRate = fnH * GetXS() * NuFlux();
  return volRate;
}

//______________________________________________________________________________
// MuNeutronRate
TIBDParams::MuNeutronRate()
{
  TString errLoc, errMsg;
  errLoc.Form("TIBDParams::MuNeutronRate()");
  if ( fTRV == 0 ) {
    errMsg.Form("No current TRATVolume.");
    this->Error(errLoc.Data(), errMsg.Data());
    return 0;
  } else {
    Double_t muNR = GetMuNeutronFlux() * (fTRV->AreaCM());
    return muNR;
  }
}

//______________________________________________________________________________
// IBDRate
TIBDParams::IBDRate()
{
  TString errLoc, errMsg;
  errLoc.Form("TIBDParams::IBDRate()");
  if ( fTRV == 0 ) {
    errMsg.Form("No current TRATVolume.");
    this->Error(errLoc.Data(), errMsg.Data());
    return 0;
  } else {
    Double_t muNR = IBDVolRate() * (fTRV->VolumeCM());
    return muNR;
  }
}

//______________________________________________________________________________
// override Print
//TIBDParams::Print(Bool_t kPrint = kTRUE)
TIBDParams::Print()
{
  Bool_t reqParams(kFALSE);
  printf("\n");
//printf("%s\t%s\t%s\n", Class_Name(), GetName(), GetTitle());
  printf("%s at 0x%x\n", Class_Name(), this);
  printf("CONSTANTS:\nIBD_XS\t\t%e\tcm^2\nIBD_XSBarns\t%e\tbarns\nIBD_Threshold\t%e\tMeV\nMuNeutron_Flux\t%e\tn0/cm^2/s\n", GetXS(), GetXSBarns(), GetThreshold(), GetMuNeutronFlux());
//printf("DERIVED QUANTITES, GENERAL:\nNuFlux\t\t%e\tnu_e_bar/cm^2/s\nIBDVolRate\t%e\tIBD/cm^3/s\n", NuFlux(), IBDVolRate());
//printf("DERIVED QUANTITES, GENERAL:\n");
  if ( (fReactorNuRate!=0) || (fStandoff!=0) ) printf("DERIVED QUANTITES, GENERAL:\n");
  if (fReactorNuRate!=0) printf("ReactorNuRate\t%e\tnu_e_bar/s\n", GetReactorNuRate());
  if (fStandoff!=0) printf("Standoff\t%e\tcm\n", GetStandoff());
  if ( (fReactorNuRate!=0) && (fStandoff!=0) ) printf("NuFlux\t\t%e\tnu_e_bar/cm^2/s\n", NuFlux());
  if ( (fReactorNuRate!=0) && (fStandoff!=0) && (fnH!=0) ) printf( "IBDVolRate\t%e\tIBD/cm^3/s\n", IBDVolRate());
  if ( (fReactorNuRate!=0) && (fStandoff!=0) && (fnH!=0) && (fTRV!=0) ) reqParams = kTRUE;
  if (reqParams) printf("DERIVED QUANTITES, VOLUME-SPECIFIC:\nMuNeutronRate\t%e\tn0/cm^2/s\nIBDRate\t\t%e\tIBD/s\n", MuNeutronRate(), IBDRate());
  printf("\n");
}

////______________________________________________________________________________
//TIBDParams::
//{
//}

////______________________________________________________________________________
//TIBDParams::
//{
//}

// all pau!   )
