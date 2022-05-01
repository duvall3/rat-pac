// subsetMeans -- macro to separate data into subsets and collect the means of quantities per subset
// -- designed for usage with output of $RATROOT/user/root_macros/duvallAnalyze.cxx in this repository
// -- USAGE: subsetMeans(<TTree* T_sub>, [Int_t subsetSize]);
//    -- "T_sub" is the TTree where the means are to be stored
//    -- "subsetSize" is the number of events per subset (default 100)
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 05/2022 ~ //

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

void subsetMeans(TTree *T_sub, Int_t subsetSize = 100) {

/* // file operations */
/* TTree *T2 = (TTree*)gDirectory->Get("T2"); */
/* if ( T2 == 0 ) { */
/*   cerr << "Error: Please open a source-datafile first (i.e., *_results.root)." << endl; */
/*   return; */
/* } */


// quantities to record
Double_t phi_sub, theta_sub;
T_sub->SetBranchAddress("phi_sub", &phi_sub);
T_sub->SetBranchAddress("theta_sub", &theta_sub);
Double_t phi_recon, theta_recon;
T2->SetBranchAddress("phi_recon", &phi_recon);
T2->SetBranchAddress("theta_recon", &theta_recon);

// init
Long64_t k = 0, N = T2->GetEntries(), k_max = TMath::Floor(N/subsetSize), j(0), j_max(0);
TString cutString;
TCut cut;
TEntryList *eList = new TEntryList;

// MAIN
for ( k = 0; k < k_max; k++ ) { // loop over entire tree

  // prepare for next subset
  phi_sub = 0;
  theta_sub = 0;
  cutString.Form("(prompt_cand_event>=%d)&(prompt_cand_event<%d)", k*subsetSize, (k+1)*subsetSize);
  cut = TCut(cutString.Data());
  T2->Draw(">>eList", cut, "entrylist");
  eList = (TEntryList*)gDirectory->FindObjectAny("eList");

  // loop over subset
  for ( j = 0; j < eList->GetN(); j++ ) { 
    T2->GetEntry( eList->GetEntry(j) );
    phi_sub += phi_recon;
    theta_sub += theta_recon;
  } // subset-event loop

  // calculate and store subset mean
  phi_sub /= (Double_t)eList->GetN();
  theta_sub /= (Double_t)eList->GetN();
  T_sub->Fill();

} // full-tree loop

// all pau!   )
}
