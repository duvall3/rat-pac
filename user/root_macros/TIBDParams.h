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

#ifndef TIBDParams
#define TIBDParams

#include "TFile.h"
#include "TClass.h"
#include <TRATVolume.cxx>

class TIBDParams : public TClass {

private:
  Double_t		fReactorNuRate;		// total antineutrino flux from reactor (nu_e_bar / s)
  Double_t		fStandoff;		// detector distance to reactor core (cm)
  Double_t		fnH;			// H-atom density of target material (atoms / cm^3)
  TRATVolume*		fTRV;			// pointer to TRATVolume object being analyzed

//private:
//  void			Update();		// update calculations

public:
  TIBDParams();
  TIBDParams( TRATVolume *vol );
  TIBDParams( Double_t reactorNuRate, Double_t standoff, Double_t nH, TRATVolume *TRV );
  // constants
  Double_t		GetXS() { return 5.e-43; } // IBD cross-section (cm^2)
  Double_t		GetXSBarns() { return 5.e-19; } // IBD cross-section (barns)
  Double_t		GetThreshold() { return 1.85; } // IBD threshold (MeV)
  Double_t              GetMuNeutronFlux() { return 0.00648312; } // (muogenic_neutrons / cm^2 / s) at sea level
  // data members
  void			SetReactorNuRate( Double_t reactorNuRate ) { fReactorNuRate = reactorNuRate; }
  void			SetStandoff( Double_t standoff ) { fStandoff = standoff; }
  void			SetHydrogenDensity( Double_t nH ) { fnH = nH; }
  Double_t		GetReactorNuRate() const { return fReactorNuRate; }
  Double_t		GetStandoff() const { return fStandoff; }
  Double_t		GetHydrogenDensity() const { return fnH; }
  TRATVolume*		GetTRATVolume() const { return fTRV; }
  // derived quantities, general
  Double_t		NuFlux(); // predicted antineutrino flux (nu_e_bar / cm^2 / s)
  Double_t		IBDVolRate(); // predicted volumetric IBD rate (IBDs / cm^3 / s)
  // derived quantites for a given TRATVolume
//Double_t		MuNeutronRate() { return GetMuNeutronFlux()*(fTRV->GetAreaCM()); } // predicted muogenic fast-neutron rate
//Double_t		IBDRate() { return IBDVolRate()*(fTRV->GetVolumeCM()); } // predicted IBD rate for this volume (IBDs / s)
  Double_t		MuNeutronRate(); // predicted muogenic fast-neutron rate (n0/s)
  Double_t		IBDRate(); // predicted IBD rate (IBD/s)

//Integrating the TIBDParams class to ROOT.
ClassDef(TIBDParams,1)

}; //end class

// all pau!   )
#endif
