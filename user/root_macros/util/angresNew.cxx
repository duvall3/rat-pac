// angresNew -- angular results for COMPMAIN data (IBD directionality)
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2024 ~ //

//Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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

TList* angresNew( const char* filename, Bool_t kSave = kFALSE, Bool_t kMono = kFALSE ) {

// init
TFile *f = TFile::Open(filename, "update");
//TFile *f = TFile::Open(filename);
TObjString *experiment = (TObjString*)gDirectory->Get("experiment");
TString exper = experiment->GetString();
exper.ReplaceAll("\"","");
if (exper.Contains("/")) exper = exper( exper.Last('/')+1, exper.Length()-1 );

// scint system vs nCap
TString fileName(filename);
if (fileName.Contains("_results.root")) {
  TTree *T_r = (TTree*)gDirectory->Get("T_r");
  TString dispVectorName = "r";
  TCut cuts("");
} else if (fileName.Contains("_ncap_res.root")) {
  TTree *T_r = (TTree*)gDirectory->Get("T_ncap");
  TString dispVectorName = "dr_q";
  TCut rcut("dr_q.Mag()>1.0");
  TCut vcut("volCheck==1");
  TCut cuts = rcut+vcut;
} else {
  TString errLoc = "::angresNew.cxx";
  TString errMsg = "Filetype error: Expecting a scint \"_results.root\" or an nCap \"_ncap_res.root\" file.";
  gROOT->Error(errLoc.Data(), errMsg.Data());
  return;
}
Long64_t N = T_r->GetEntries(cuts);
Double_t l, dp, P = TMath::QuietNaN();
TVector3 mu;
TCanvas *c_angresNew = new TCanvas("c_angresNew", "c_angresNew");

/* // detector-specific position resolutions (mm) */
/* // -- yes, this should be a 'switch/case' statement; no, I don't currently care (TString switches are weird) */
/* if ( exper.Contains("chooz") ) { // Double CHOOZ */
/*   P = 150.; */
/* } else if ( exper.Contains("nulat") || exper.Contains("rboard-3d") ) { // NuLat and 3D-Chkbd. */
/*   P = 25.; */
/* } else if ( exper.Contains("santa") ) { // SANTA */
/*   P = (1./3.) * (2.5 + 50. + (1./2.)*(25.+30.)); */
/* } else if ( exper.Contains("sandd") || exper.Contains("rboard-2d") ) { // SANDD, 2D-Chkbd. */
/*   P = (1./3.) * (2.5 + 2.5 + 25.); */
/* } else if ( exper.Contains("prospect") ) { // PROSPECT */
/*   P = 150.; */
/* } else if ( exper.Contains("forest") ) { // FOREST */
/*   P = (1./3.) * (4*25.4 + 4*25.4 + 100.); */
/* } */

// main

// find l = sqrt( lx**2 + ly**2 + lz**2 )
if ( exper.Contains("chooz") ) { // Double CHOOZ
  T_r->Draw("r.fX>>hx", "abs(r.fX)<500."); // DC ONLY
  T_r->Draw("r.fY>>hy", "abs(r.fY)<500."); // DC ONLY
  T_r->Draw("r.fZ>>hz", "abs(r.fZ)<500."); // DC ONLY
} else {
  T_r->Draw(dispVectorName+".fX>>hx", cuts);
  T_r->Draw(dispVectorName+".fY>>hy", cuts);
  T_r->Draw(dispVectorName+".fZ>>hz", cuts);
}
c_angresNew->Close();
mu.SetXYZ(hx->GetMean(), hy->GetMean(), hz->GetMean());
l = mu.Mag();

// guesses for fitter // alternative: use TF1::SetParLimits with fit option "B"(ounds)
Double_t
  constantGuess = 1.e1, \
  muGuess = 0., \
  sigmaGuess = 1.e1 \
  ;

// find phi
TVector3 mu, axLim;
Int_t nBinsX = hx->GetNbinsX(), nBinsY = hy->GetNbinsX(), nBinsZ = hz->GetNbinsX();
axLim.SetX( TMath::Max(TMath::Abs(hx->GetBinLowEdge(0)), TMath::Abs(hx->GetBinLowEdge(nBinsX)+hx->GetBinWidth(nBinsX))) );
axLim.SetY( TMath::Max(TMath::Abs(hy->GetBinLowEdge(0)), TMath::Abs(hy->GetBinLowEdge(nBinsY)+hy->GetBinWidth(nBinsY))) );
axLim.SetZ( TMath::Max(TMath::Abs(hz->GetBinLowEdge(0)), TMath::Abs(hz->GetBinLowEdge(nBinsZ)+hz->GetBinWidth(nBinsZ))) );
hx->SetLineColor(kBlue);
hy->SetLineColor(kBlue);
hz->SetLineColor(kBlue);
Double_t phi;
if (kMono) { // monolithic (single-volume) detector
  // x coord
  TCanvas *cx = new TCanvas("cx", "cx");
  TF1 *fhx = new TF1("fhx", "[0]+[1]*TMath::Gaus(x,[2],[3])", -axLim.X(), axLim.X());
  fhx->SetLineColor(kRed);
  fhx->SetParNames("Constant", "Normalization", "Mu", "Sigma");
  fhx->SetParameters(0., constantGuess, muGuess, sigmaGuess);
  printf("\nX Distribution:");
  TFitResultPtr hxFRP = hx->Fit(fhx, "SR");
  TFitResult *hxFR = hxFRP.Get();
  mu.SetX(fhx->GetParameter("Mu"));
  printf("\n");
  // y coord
  TCanvas *cy = new TCanvas("cy", "cy");
  TF1 *fhy = new TF1("fhy", "[0]+[1]*TMath::Gaus(x,[2],[3])", -axLim.Y(), axLim.Y());
  fhy->SetLineColor(kRed);
  fhy->SetParNames("Constant", "Normalization", "Mu", "Sigma");
  fhy->SetParameters(0., constantGuess, muGuess, sigmaGuess);
  printf("\nY Distribution:");
  TFitResultPtr hyFRP = hy->Fit(fhy, "SR");
  TFitResult *hyFR = hyFRP.Get();
  mu.SetY(fhy->GetParameter("Mu"));
  printf("\n");
  // z coord
  TCanvas *cz = new TCanvas("cz", "cz");
  TF1 *fhz = new TF1("fhz", "[0]+[1]*TMath::Gaus(x,[2],[3])", -axLim.Z(), axLim.Z());
  fhz->SetLineColor(kRed);
  fhz->SetParNames("Constant", "Normalization", "Mu", "Sigma");
  fhz->SetParameters(0., constantGuess, muGuess, sigmaGuess);
  printf("\nZ Distribution:");
  TFitResultPtr hzFRP = hz->Fit(fhz, "SR");
  TFitResult *hzFR = hzFRP.Get();
  mu.SetZ(fhz->GetParameter("Mu"));
  printf("\n");
//} else { // all other detectors
} // endif -- kMono
phi = TMath::ATan2(mu.Y(), mu.X())*TMath::RadToDeg();

// find P = (sigX + sigY + sigZ) / 3
Double_t P;
TVector3 sigma;
if ( (kMono) || (exper.Contains("chooz")) ) { // monolithic (single-volume) detector
  sigma.SetX( fhx->GetParameter("Sigma") );
  sigma.SetY( fhy->GetParameter("Sigma") );
  sigma.SetZ( fhz->GetParameter("Sigma") );
//} else { // all other detectors
}
P = ( sigma.X() + sigma.Y() + sigma.Z() ) / 3.;
/* P = 150.; //debug */

// calculate angular resolution via (Delta phi)_{1#sigma} = #arctan( (P/l) / #sqrt{N} )
dp = TMath::ATan( (P/l) / sqrt(N) ) * TMath::RadToDeg();

// report and save results
// result
TVectorD deltaPhi(2);
deltaPhi[0] = dp;
deltaPhi[1] = phi;
// details
TString deltaPhiReportStr;
deltaPhiReportStr.Form( "\n\nExperiment = %s\nFilename = %s\nN = %d\nP = %e mm\nl = %e mm\nPhi = %3.4f deg.\nDeltaPhi_{1sigma} = %3.4f deg,\n\t from DeltaPhi_{1sigma} = arctan( (P/l) / sqrt(N) )\n\n", exper.Data(), gFile->GetName(), N, P, l, phi, dp );
printf( "%s\n", deltaPhiReportStr.Data() );
TObjString *deltaPhiReport = new TObjString(deltaPhiReportStr);
// save if desired
if (kSave) {
  deltaPhi.Write("deltaPhi");
  deltaPhiReport->Write("deltaPhiReport");
  cx->Print( TString::Format("%s_%s.png", exper.Data(), "cx") );
  cy->Print( TString::Format("%s_%s.png", exper.Data(), "cy") );
  cz->Print( TString::Format("%s_%s.png", exper.Data(), "cz") );
}
// return value(s), mainly for interactive use
TList *parList = new TList;
//parList->Add(&mu);
//parList->Add(&sigma);
parList->Add(new TParameter<double>("P", P));
parList->Add(new TParameter<double>("l", l));
parList->Add(new TParameter<double>("phi", phi));
parList->Add(new TParameter<double>("deltaPhi", dp));
f->Close();

// all pau!   )
//return;
return parList;
}
