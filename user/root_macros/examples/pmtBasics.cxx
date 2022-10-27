// pmtBasics -- extract some general data from RAT-PAC EV/triggered events
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2022 ~ //

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

void pmtBasics(const char* filename) {

// init
RAT::DSReader r(filename);			// init RAT data-structure reader
Long64_t k(0), N = r.GetTotal();		// get number of events
RAT::DS::Root *ds = r.GetEvent(0);		// set up RAT data-structure object
RAT::DS::EV *ev = ds->GetEV(0);			// set up RAT PMT-event object
TTimeStamp TS = ev->GetUTC();			// get timestamp for run start
Double_t runStartTime = TS.AsDouble();		// convert timestamp to double
RAT::DS::Centroid *cent;			// prepare RAT object describing PMT centroids

// set up TTree
Double_t t;					// for the event time
Double_t q;					// for the event total charge
Int_t p;					// for the event PMT count
TVector3 R;					// for the event PMT centroid
TTree *T_qt = new TTree("T_qt", "Tree to hold charge/time and other PMT data");
T_qt->Branch("evTime", &t);
T_qt->Branch("qTotal", &q);
T_qt->Branch("pmtCount", &p);
T_qt->Branch("centPos", &R);

// MAIN
for ( k=0; k<N; k++ ) {			// event loop
  ds = r.GetEvent(k);			// load event
  ev = ds->GetEV(0);			// get triggered-event data
  TS = ev->GetUTC();			// get timestamp at event start
  t = TS.AsDouble() - runStartTime;	// get time since run start (s)
  q = ev->GetTotalCharge();		// get sum of all PMT charges for this event
  p = ev->GetPMTCount();		// get number of PMTs registering at least 1 PE
  cent = ev->GetCentroid();		// get centroid (which we aren't storing, but need for position)
  R = cent->GetPosition();		// get position of centroid
  T_qt->Fill();				// store values to tree
}

// plot results
TCanvas *c_qt = new TCanvas("c_qt", "c_qt");
c_qt->Divide(1,3);
TVirtualPad *p1 = c_qt->GetPad(1);
TVirtualPad *p2 = c_qt->GetPad(2);
TVirtualPad *p3 = c_qt->GetPad(3);
p1->cd();
T_qt->Draw("evTime>>ht");
ht->GetXaxis()->SetTitle("Event Time (s)");
p2->cd();
T_qt->Draw("qTotal>>hq");
hq->GetXaxis()->SetTitle("Event Total Charge (pC)");
hq->SetLineColor(kMagenta);
p3->cd();
T_qt->Draw("pmtCount>>hc");
hc->GetXaxis()->SetTitle("\# PMTs Hit");
hc->SetLineColor(kRed);

// write output file
TString saveName(filename);
saveName.ReplaceAll("\.root", "_pmtBasics.root");
TFile *f = TFile::Open(saveName.Data(), "recreate");
T_qt->Write("T_qt");
c_qt->Write("c_qt");
ht->Write("ht");
hq->Write("hq");
hc->Write("hc");
f->Close();

// workaround for drawing error
gROOT->LoadMacro("drawCentroid.cxx");
drawCentroid(saveName.Data());

// all pau!   )
return;
}
