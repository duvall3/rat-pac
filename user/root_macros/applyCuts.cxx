// applyCuts -- apply cuts to a _results.root file
//   prompt event to take place in target plane and
//   delayed event to take place in capture plane
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/21 ~ //


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


void applyCuts( TCut cut, Bool_t save_tf = kFALSE ) {


//// init
TString filename = gFile->GetName();
TString datarun = filename(0, filename.Index("_results.root"));
TTree* T2 = (TTree*)gFile->FindObjectAny("T2");


//// MAIN -- apply cut(s) to histograms

// neutrino trigger
TH1D* h_ibd2 = (TH1D*)gDirectory->FindObjectAny("h_ibd2");
TH1D* h_ibd = (TH1D*)gDirectory->FindObjectAny("h_ibd");
c2->Draw();
c2->cd();
T2->Draw("prompt_cand_eq:tmin>>h_ibd2", cut, "lego3");
T2->Draw("delayed_cand_t-prompt_cand_t:delayed_cand_eq>>h_ibd", cut, "legosame");

// positions
TH3D* h_prompt = (TH3D*)gFile->FindObjectAny("h_prompt");
TH3D* h_delayed = (TH3D*)gFile->FindObjectAny("h_delayed");
c3->Draw();
c3->cd();
T2->Draw("prompt_cand_z:prompt_cand_x:prompt_cand_y>>h_prompt", cut);
T2->Draw("delayed_cand_z:delayed_cand_x:delayed_cand_y>>h_delayed", cut, "same");

// angular results -- separate
TH1D* h_phi = (TH1D*)gFile->FindObjectAny("h_phi");
TH1D* h_theta = (TH1D*)gFile->FindObjectAny("h_theta");
c4->Draw();
c4->cd(1);
T2->Draw("phi_recon>>h_phi", cut);
c4->cd(2);
T2->Draw("theta_recon>>h_theta", cut);

// angular results -- cos[psi]
TH1D* h_cos_psi = (TH1D*)gFile->FindObjectAny("h_cos_psi");
c5->Draw();
c5->cd();
T2->Draw("cos_psi>>h_cos_psi", cut);

// angular results -- skymap
TH2D* h_map = (TH2D*)gFile->FindObjectAny("h_map");
c6->Draw();
c6->cd();
T2->Draw("lattd:longtd>>h_map", cut, "aitoff");


//// finalize -- save if desired
if (save_tf == kTRUE) {
  TFile* f = TFile::Open(filename, "update");
  TString sn2, sn3, sn4, sn5, sn6;
  sn2 = datarun+"_nu-trg.png";
  sn3 = datarun+"_pd-xyz.png";
  sn4 = datarun+"_results-ang-separate.png";
  sn5 = datarun+"_results-ang.png";
  sn6 = datarun+"_results-skymap.png";
  c2->SaveAs(sn2);
  c3->SaveAs(sn3);
  c4->SaveAs(sn4);
  c5->SaveAs(sn5);
  c6->SaveAs(sn6);
  c2->Write("", TObject::kWriteDelete);
  c3->Write("", TObject::kWriteDelete);
  c4->Write("", TObject::kWriteDelete);
  c5->Write("", TObject::kWriteDelete);
  c6->Write("", TObject::kWriteDelete);
  h_ibd->Write("", TObject::kWriteDelete);
  h_ibd2->Write("", TObject::kWriteDelete);
  h_prompt->Write("", TObject::kWriteDelete);
  h_delayed->Write("", TObject::kWriteDelete);
  h_phi->Write("", TObject::kWriteDelete);
  h_theta->Write("", TObject::kWriteDelete);
  h_cos_psi->Write("", TObject::kWriteDelete);
  h_map->Write("", TObject::kWriteDelete);
}


// all pau!   )
return;
}
