// TRATNeutronGen
/// Class for preparing sea-level muogenic fast neutrons:
//   - as described in JEDEC standard JESD89a
//   - in HEPEVT-style format
//   - for use in RAT-Pac
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
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

#ifndef TRATNeutronGen
#define TRATNeutronGen

#include "TClass.h"
#include "TMath.h"
//#include "TF1.cxx"

class TRATNeutronGen : public TClass {

private:
  Double_t		fNeutronMass;			// neutron mass in MeV/c^2
  TF1			fNeutronSpectrum;		// TF1 containing the function and parameters from JEDEC
  TH1D			fSpecHist;			// automatic histogram created by fNeutronSpectrum
  TString		fOutFilename;			// name of ROOT outfile (for feeding into RAT-PAC)
  TTree			fTree;				// TTree holding neutron data

public:
  TRATNeutronGen();
  TVector3*		KEtoMom(Double_t KE);
  void			Generate(Long64_t numNeutrons);
  Double_t		GetNeutronMass() const { return fNeutronMass; }
  TF1*			GetSpectrum() const { return &fNeutronSpectrum; }
  TH1D*			GetSpecHist() const { return &fSpecHist; }
  TTree*		GetTree() const { return &fTree; }
  char*			GetOutFilename() const { return fOutFilename.Data(); }
  void			SetOutFile( const char* newOutFile );
  void			DrawSpectrum();

//Integrating the TRATNeutronGen class to ROOT.
ClassDef(TRATNeutronGen,1)

}; //endclass

// all pau!   )
#endif
