// prepareNCapRefMatch -- prepare an neutronCapturesFinal results file
//   for use with TRefMatch
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ //

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

void prepareNCapRefMatch(const char* filename) {

// init
TFile *f = TFile::Open(filename, "update");
TTree *T_ncap = (TTree*)gDirectory->Get("T_ncap");
TTree *T_ts = new TTree("T_ts", "Tree to hold data for TRefMatch testing");
Double_t phi, phiTS;
Bool_t volCheck;
T_ncap->SetBranchAddress("phi", &phi);
T_ncap->SetBranchAddress("volCheck", &volCheck);
T_ts->Branch("phi", &phiTS);
TEntryList *eList = TDuvallUtils::EntryList("volCheck==1", T_ncap);
Long64_t k(0), N = eList->GetN();

// MAIN
for (k=0; k<N; k++) {
  T_ncap->GetEntry(eList->GetEntry(k));
  phiTS = phi;
  T_ts->Fill();
}

// save
T_ts->Write("T_ts");
f->Close();

// all pau!   )
return;
}
