// TRATNeutronGen -- class for preparing sea-level muogenic fast neutrons:
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

#include <TRATNeutronGen.h>
//#include "TMath.h"

// Call the ClassImp() macro to give the TRATGeo class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TRATGeo);
#endif

//______________________________________________________________________________
// default ctor
TRATNeutronGen::TRATNeutronGen()
{
  // neutron mass in MeV/c^2
  fNeutronMass = 939.5654133;
  // set output
  const char* outFile = "bgNeutronSpec";
//fOutFilename.Form("%s.dat", outFile);
//fOutStream.open(fOutFilename.Data());
  fOutFilename.Form("%s.root", outFile);
  // pulling the functions and parameters from the JEDEC standard
  Double_t A1 = 1.006e-6, b1 = 0.35, c1 = 2.1451;
  Double_t A2 = 1.011e-3, b2 = 0.4106, c2 = -0.667;
  Double_t xmin(1.e-1), xmax(2.e3);
  // define function and set parameters
  fNeutronSpectrum = TF1("fNeutronSpectrum", "[0] * TMath::Exp( -[1] * (TMath::Log(x))**2 + [2] * TMath::Log(x) ) + [3] * TMath::Exp( -[4] * (TMath::Log(x))**2 + [5] * TMath::Log(x) )", xmin, xmax);
  fNeutronSpectrum.SetParameter(0, A1);
  fNeutronSpectrum.SetParameter(1, b1);
  fNeutronSpectrum.SetParameter(2, c1);
  fNeutronSpectrum.SetParameter(3, A2);
  fNeutronSpectrum.SetParameter(4, b2);
  fNeutronSpectrum.SetParameter(5, c2);
  // draw plot -- NOTE: NEEDED FOR CORRECT BINNING IN DISTRIBUTION
  TCanvas *c_nbgspectrum = new TCanvas("c_nbgspectrum", "Sea-Level Muogenic Fast-Neutron Background Spectrum");
  c_nbgspectrum->SetLogx(1);
  c_nbgspectrum->SetLogy(1);
  TH1D *fSpecHistptr = fNeutronSpectrum.GetHistogram();
  fSpecHist = *fSpecHistptr;
  delete c_nbgspectrum;
//  // plot adjustments and annotations -- can be skipped if deleting plot
//  fSpecHist.SetTitle(c_nbgspectrum->GetTitle());
//  fSpecHist.SetLineColor(kRed);
//  fSpecHist.Draw();
//  fSpecHist.GetXaxis()->SetTitle("Neutron Energy (MeV)");
//  fSpecHist.GetYaxis()->SetTitle("Differential Flux (cm^{-2} s^{-1} MeV^{-1})");
//  fSpecHist.GetYaxis()->SetLabelSize(0.033);
//  fSpecHist.GetXaxis()->SetLabelSize(0.033);
//  fSpecHist.GetYaxis()->SetTitleOffset(1.2);
//  fNeutronSpectrum.SetLineColor(kBlue);
//  fNeutronSpectrum.Draw("same");
}

////______________________________________________________________________________
//// set outfile
//TRATNeutronGen::SetOutFile( const char* newOutFile )
//{
//  if (fOutStream.is_open()) fOutStream.close();
//  fOutFilename.Form("%s", newOutFile);
//  fOutStream.open(newOutFile);
//}

//______________________________________________________________________________
// set outfile
TRATNeutronGen::SetOutFile( const char* newOutFile )
{
  fOutFilename.Form("%s.root", newOutFile);
}

////______________________________________________________________________________
//// Generate
//TRATNeutronGen::Generate(Long64_t numNeutrons)
//{
////TString startMsg = TString::Format("Generating and writing neutrons to %s...", fOutFilename.Data());
//  TString startMsg = TString::Format("Generating and writing neutrons to %s...", "TTree* TN");
//  TString endMsg("Done.");
//  Double_t nEnergy;
//  Long64_t k(0);
//  this->Info("TRATNeutronGen", startMsg.Data());
//  TTree *TN = new TTree("TN", "Muogenic Fast Neutrons");
//  TN->Branch("nEnergy", &nEnergy, "nEnergy/D");
////// prepare hist (testing)
////const Int_t nBinsEBP = 100;
////Double_t xmin(1.e-1), xmax(2.e3);
////Double_t logxmin = TMath::Log10(xmin);
////Double_t logxmax = TMath::Log10(xmax);
////Double_t binwidth = (logxmax-logxmin)/nBinsEBP;
////Double_t xbinsEBP[nBinsEBP+1];
////xbinsEBP[0] = xmin;
////for (Int_t m=1;m<=nBinsEBP;m++) {
//// xbinsEBP[m] = TMath::Power(10,logxmin+m*binwidth);
////}
////TH1D *hgen = new TH1D("hgen", "hgen", nBinsEBP, xbinsEBP);
//  // GENERATE
//  for ( k=0; k<numNeutrons; k++ ) {
////  fOutStream << "Neutron_number: " << k << "\tNeutron_energy: " << fSpecHist.GetRandom() << endl;
////  fOutStream << k << "\t" << fSpecHist.GetRandom() << endl;
////  hgen->Fill( fSpecHist.GetRandom() );
//    nEnergy = fSpecHist.GetRandom();
//    TN->Fill();
//  }
//  this->Info("TRATNeutronGen", endMsg.Data());
////// plot results (testing)
////TCanvas *c_hgen = new TCanvas("c_hgen", "c_hgen");
////c_hgen->cd();
////hgen->SetAxisRange(0.5, hgen->GetMaximum(), "y");
////c_hgen->SetLogx(1);
////c_hgen->SetLogy(1);
////hgen->Draw();
////fOutStream.close();
//}

// from OCTAVE version:
//% generate energies from spectrum
//% combine energies & directions to express them as momenta in {x,y,z} for HEPEVT format
//% -- relevant kinematics: p^2 = E^2 - m^2, E = K + m --> p^2 = K^2 + 2Km, or p = sqrt( K*(K+2m) )
//neutron_momenta_magnitudes = sqrt( neutron_energies .* (neutron_energies+2*neutron_mass) );% .* neutron_directions;
////
//% generate random directions -- an n-by-3 matrix of random numbers in the range [-1,1]
//neutron_directions = zeros(NHEP,3); % initialize
//for k_neutrons = 1:NHEP
//  neutron_directions(k_neutrons,:) = hat( 2 * rand(3,1) - 1 );
//  neutron_momenta(k_neutrons,:) = neutron_momenta_magnitudes(k_neutrons) .* neutron_directions(k_neutrons,:);
//end %for

//______________________________________________________________________________
// KEtoMom -- convert KE scalar to random (isotropic) Mom vector
TRATNeutronGen::KEtoMom(Double_t KE)
{
  TVector3 *Mom = new TVector3;
  Double_t P, M = fNeutronMass;
  // get random direction
  Mom->SetXYZ( gRandom->Uniform(-1.,1.), gRandom->Uniform(-1.,1.), gRandom->Uniform(-1.,1.) );
  // using p^2 = K^2 - m^2  -->  p = sqrt( K*(K+2m) )
  P = TMath::Sqrt( KE * ( KE + 2*M ) );
  Mom = P * (Mom->Unit());
  return Mom;
}

//______________________________________________________________________________
// Generate
TRATNeutronGen::Generate(Long64_t numNeutrons)
{
  TString startMsg = TString::Format("Generating and writing neutrons to %s...", "TTree* TN");
  TString endMsg("Done.");
  Double_t nEnergy;
  TVector3 *nMom = new TVector3;
  Long64_t k;
//TTree *T = new TTree("T_BGN", "Muogenic Fast Neutrons");
  fTree = TTree("T_BGN", "Muogenic Fast Neutrons");
  fTree.Branch("nEnergy", &nEnergy);
  fTree.Branch("nMom", &nMom);
  this->Info("TRATNeutronGen", startMsg.Data());
  // GENERATE
  for ( k=0; k<numNeutrons; k++ ) {
    nEnergy = fSpecHist.GetRandom();
//  nEnergy = (Double_t)k + 10.; //debug
    nMom = (TVector3*)KEtoMom(nEnergy);
//  cout << k << "\t" << nEnergy << "\t" << nMom->X() << " " << nMom->Y() << " " << nMom->Z() << endl; //debug
    fTree.Fill();
  }
  this->Info("TRATNeutronGen", endMsg.Data());
}

//______________________________________________________________________________
// SaveROOT
TRATNeutronGen::SaveROOT()
{
  TFile *f = TFile::Open(fOutFilename.Data(), "recreate");
  fTree.Write("T_BGN");
  f->Write();
  f->Close();
}

//______________________________________________________________________________
// DrawSpectrum
TRATNeutronGen::DrawSpectrum()
{
  fNeutronSpectrum.Draw();
  gPad->SetLogx(1);
  gPad->SetLogy(1);
}

////______________________________________________________________________________
//TRATNeutronGen::
//{
//}

////______________________________________________________________________________
//TRATNeutronGen::
//{
//}

// all pau!   )

