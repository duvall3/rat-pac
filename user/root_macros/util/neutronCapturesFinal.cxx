// void neutronCapturesFinal( <nCap_filename> )
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
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

void neutronCapturesFinal( const char* filename, TVector3 nu_dirn = TVector3(-1.,0.,0.) ) {

// for graphics output:
// switch default rendering engine
const Bool_t origOGL = gStyle->GetCanvasPreferGL();
if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);
// set to batch mode if needed
const Bool_t origBatch = gROOT->IsBatch();
if (! origBatch) gROOT->SetBatch(kTRUE);

// init
TFile *fnc = TFile::Open(filename, "update");
TTree *T_ncap = (TTree*)gDirectory->Get("T_ncap");
Long64_t k = 0, N = T_ncap->GetEntries();
nu_dirn = -1*nu_dirn.Unit();
// zeta (neutron-reconstructed source direction)
TString savename = filename;
savename.ReplaceAll("_ncap.root","_zeta.png");
// capture/interevent time
Double_t *tbins = logBins(1.e-10, 1.e3);
TH1D *h_dt = new TH1D("h_dt", "Capture Time", 100, tbins);
// cos[psi]
TH1D *h_cospsi = new TH1D("h_cospsi", "Cos[#psi]", 100, -1.01, 1.01);

// tree
Double_t dt, cospsi;
Bool_t volCheck;
TVector3 *dr;
T_ncap->SetBranchAddress("dt", &dt);
T_ncap->SetBranchAddress("volCheck", &volCheck);
T_ncap->SetBranchAddress("dr", &dr);
TBranch* br_cp = T_ncap->Branch("cospsi", &cospsi);

// MAIN
for ( k=0; k<N; k++ ) {
  T_ncap->GetEntry(k);
  cospsi = nu_dirn.Dot( dr->Unit() );
  if (volCheck) {
    h_dt->Fill(dt);
    h_cospsi->Fill(cospsi);
    br_cp->Fill();
  }
}

// plots
//TODO: add plot annotations
// zeta
TCanvas *c_zeta = new TCanvas("c_zeta", "c_zeta");
T_ncap->Draw("zeta>>h_zeta", "volCheck==1");
h_zeta->Fit("gaus");
// dt
TCanvas *c_dt = new TCanvas("c_dt", "c_dt");
c_dt->SetLogy(kTRUE);
c_dt->SetLogx(kTRUE);
h_dt->Draw();
// cos[psi]
TCanvas *c_cp = new TCanvas("c_cp", "c_cp");
h_cospsi->Draw();
h_cospsi->SetAxisRange(0., 1.4 * h_cospsi->GetMaximum(), "Y");
// skymap
TCanvas *c_map = new TCanvas("c_map", "c_map");
T_ncap->Draw("lattd:longtd>>h_map", "volCheck==1", "aitoff");
h_map->GetXaxis()->SetLimits(-180., 180.);
h_map->GetYaxis()->SetLimits(-90., 90.);
// list
TList *plotList = new TList;
plotList->Add(c_zeta);
plotList->Add(c_dt);
plotList->Add(c_cp);
plotList->Add(c_map);

// save, print, close
// plots
/* c_zeta->Print(savename.Data()); */
/* c_dt->Print */
/* c_cp->Print */
/* c_map->Print */
c_zeta->Write("c_zeta");
c_dt->Write("c_dt");
c_cp->Write("c_cp");
c_map->Write("c_map");
c_zeta->Close();
c_dt->Close();
c_cp->Close();
c_map->Close();
/* plotList->Write();//"plotList"); */
// file
fnc->Write();
fnc->Close();

// reset graphics settings if applicable
if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);
if (! origBatch) gROOT->SetBatch(kFALSE);

// all pau!   )
}
