// findAllScintSteps.cxx -- macro to (hopefully) recreate Marc Bergevin's algorithm
//   for finding "bursts" of scintillation energy based on MC track steps in RAT-PAC
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2021 ~ //

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


//TTree* findAllScintSteps( const char* filename ) {
void findAllScintSteps( const char* filename ) {


//// PART 1: RETRIEVE DATA

// fetch original total events:
TFile* f_orig = TFile::Open(filename);
Long64_t totalRATEvents;
totalRATEvents = T->GetEntries();
f_orig->Close();

// general init
TString FileName = filename;
TString basename = FileName(0, FileName.Index(".root"));
TString savename = basename + "_ScintSteps.root";
TFile* f = new TFile(savename, "recreate");
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::DS::MC* mc = ds->GetMC();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(kFALSE);
RAT::TrackNode* n = c.Here();
Int_t k, event, N(r.GetTotal()), step;
Double_t t_event_start, t_step, wall_time;
Double_t en, en_q;
Double_t t_run_start = mc->GetUTC().AsDouble();
TVectorD run_start_time(1);
run_start_time[0] = t_run_start;
Double_t energy, energy_q;
Double_t x, y, z;

// TTree init
TTree* T_steps = new TTree("T_steps", "PER-STEP Scintillation data");
T_steps->Branch("event", &event);
T_steps->Branch("t_event_start", &t_event_start);
T_steps->Branch("t_step", &t_step);
T_steps->Branch("wall_time", &wall_time);
T_steps->Branch("energy", &energy);
T_steps->Branch("energy_q", &energy_q);
T_steps->Branch("x", &x);
T_steps->Branch("y", &y);
T_steps->Branch("z", &z);
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);
T_steps->GetUserInfo()->Add(nMCEvents_tos);

// event loop
printf( "Processing particle tracks...\n" );
for ( k=0; k<N; k++ ) {
//for ( k=0; k<50; k++ ) { //debug
  ds = r.GetEvent(k);
  mc = ds->GetMC();
  event = mc->GetID(); // should be same as k
//cout << event << endl; //debug
  t_event_start = mc->GetUTC().AsDouble() - t_run_start; // offset to run start
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  n = c.Here();

  // particle/track loop
  while ( n != 0 ) {
//cout << n->GetTrackID() << "\t"; //debug

    // step loop
    for ( step=0; step<c.StepCount(); step++ ) {
      n = c.GoStep(step);
      t_step = n->GetGlobalTime()*1e-9;
      wall_time = t_event_start + t_step;
      energy = n->GetTotEDepScint();
      energy_q = n->GetTotEDepScintQuenched();
      x = n->GetEndpoint().X();
      y = n->GetEndpoint().Y();
      z = n->GetEndpoint().Z();
      T_steps->Fill();
    } // end step loop

  n = c.FindNextTrack();
  } // end particle/track loop

  nav.Clear();
} // end event loop
//cout << endl; //debug
printf( "Done.\n" );


// plot results
TCanvas* can = new TCanvas("can", savename);
can->SetLogz(1);
T_steps->Draw("(1.e6*t_step):energy_q>>h", "", "lego2");
h->SetTitle("All Scintillating MC Track Steps");
TAxis* hx = h->GetXaxis();
TAxis* hy = h->GetYaxis();
hx->SetTitle("energy_q (MeVee)");
hy->SetTitle("#Deltat (#mus)");
hx->SetTitleOffset(1.5);
hy->SetTitleOffset(2);
h->Draw("lego2");


// finish up
h->Write();
run_start_time.Write("run_start_time");
TString can_savename = basename;
can_savename.Append("_ScintSteps.png");
can->SaveAs(can_savename);
can->Write();
can->Close();
f->Close();

// all pau!   )
//return T_steps;
}
