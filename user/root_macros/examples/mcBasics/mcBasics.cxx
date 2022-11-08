// mcBasics -- extract some general MC-Truth data from RAT-PAC output
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2022 ~ //

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

void mcBasics(const char* filename) {

// init
RAT::DSReader r(filename);			// init RAT data-structure reader
Long64_t k(0), N = r.GetTotal();		// get number of events
RAT::DS::Root *ds = r.GetEvent(0);		// set up RAT data-structure object
RAT::DS::MC *mc = ds->GetMC();			// set up RAT MC object
RAT::DS::MCSummary *mcs = mc->GetMCSummary();	// set up RAT MCSummary object
TTimeStamp TS = mc->GetUTC();			// get timestamp for run start
Double_t runStartTime = TS.AsDouble();		// convert timestamp to double

// set up TTree
Double_t t;					// for the event time
Double_t p;					// for the number of scintillation photons
TTree *T_mc = new TTree("T_mc", "Tree to hold MC data");
T_mc->Branch("evTime", &t);
T_mc->Branch("numScintPhoton", &p);

// MAIN
for ( k=0; k<N; k++ ) {			// event loop
  ds = r.GetEvent(k);			// load event
  mc = ds->GetMC();			// get Monte Carlo data
  TS = mc->GetUTC();			// get timestamp at event start
  t = TS.AsDouble() - runStartTime;	// get time since run start (s)
  mcs = mc->GetMCSummary();		// get MCSummary data
  p = mcs->GetNumScintPhoton();		// get number of scintillation photons
  T_mc->Fill();				// store values to tree
}

// plot results
TCanvas *c_mc = new TCanvas("c_mc", "c_mc");
c_mc->Divide(1,2);
TVirtualPad *p1 = c_mc->GetPad(1);
TVirtualPad *p2 = c_mc->GetPad(2);
p1->cd();
T_mc->Draw("evTime>>ht");				// event-time histogram, "ht"
ht->GetXaxis()->SetTitle("Event Time (s)");
p2->cd();
T_mc->Draw("numScintPhoton>>hp");			// scintillation-photon histogram, "hp"
hp->GetXaxis()->SetTitle("Number of Scintillation Photons");
hp->SetLineColor(kMagenta);

// write output file
TString saveName(filename);
saveName.ReplaceAll("\.root", "_mcBasics.root");
TFile *f = TFile::Open(saveName.Data(), "recreate");
T_mc->Write("T_mc");
c_mc->Write("c_mc");
ht->Write("ht");
hp->Write("hp");

// save plots as image (requires batch-mode to work properly on some systems)
Bool_t kBatchOrig = gROOT->IsBatch();
gROOT->SetBatch(kTRUE);
saveName.ReplaceAll("\.root", "");
c_mc->Print(saveName.Data(), "png");
c_mc->Close();
gROOT->SetBatch(kBatchOrig);

// all pau!   )
f->Close();
return;
}
