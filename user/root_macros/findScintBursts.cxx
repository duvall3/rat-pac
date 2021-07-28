// findScintBursts.cxx -- macro to (hopefully) recreate Marc Bergevin's algorithm
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


//TTree* findScintBursts( const char* filename ) {
void findScintBursts( const char* filename ) {


//// PART 1: RETRIEVE DATA

// fetch original total events:
TFile* f_orig = TFile::Open(filename);
Long64_t totalRATEvents;
totalRATEvents = T->GetEntries();
f_orig->Close();

// general init
TString FileName = filename;
TString basename = FileName(0, FileName.Index(".root"));
TString savename = basename + "_T.root";
TFile* f = new TFile(savename, "recreate");
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::DS::MC* mc = ds->GetMC();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(kFALSE);
RAT::TrackNode* n = c.Here();
Int_t k, event, N(r.GetTotal()), step;
Double_t t_event_start, wallTime, t_step;
Double_t en, en_q;
Double_t timeWindow = 200.e-9;
Double_t t_run_start = mc->GetUTC().AsDouble();
Double_t old_time, start_time, rollingEnergy, rollingEnergyQ;
Double_t x, y, z;

// TTree init
TTree* T_scint = new TTree("T_scint", "Stepwise-generated Scintillation data");
T_scint->Branch("event", &event);
T_scint->Branch("event_time", &t_event_start);
T_scint->Branch("wall_time", &wallTime);
T_scint->Branch("energy", &rollingEnergy);
T_scint->Branch("energy_q", &rollingEnergyQ);
T_scint->Branch("x", &x);
T_scint->Branch("y", &y);
T_scint->Branch("z", &z);
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);
T_scint->GetUserInfo()->Add(nMCEvents_tos);

// event loop
printf( "Processing particle tracks...\n" );
for ( k=0; k<N; k++ ) {
//for ( k=0; k<50; k++ ) { //debug
  ds = r.GetEvent(k);
  mc = ds->GetMC();
  event = mc->GetID(); // should be same as k
//cout << event << endl; //debug
  old_time = -1.;
  start_time = -1.;
  rollingEnergy = 0.;
  rollingEnergyQ = 0.;
  t_event_start = mc->GetUTC().AsDouble();
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
      if (t_step-old_time > timeWindow) {
	if (rollingEnergy > 0.001) {
	  // TEMPORARY: LOCATE BURST AT BEGINNING POSITION
	  x = n->GetEndpoint().X();
	  y = n->GetEndpoint().Y();
	  z = n->GetEndpoint().Z();
	  T_scint->Fill();
	}
	rollingEnergy = 0.0;
	rollingEnergyQ = 0.0;
	start_time = t_step;
	wallTime = t_event_start + t_step;
      }
    old_time = t_step;
    rollingEnergy += n->GetTotEDepScint();
    rollingEnergyQ += n->GetTotEDepScintQuenched();
    } // end step loop

  n = c.FindNextTrack();
  } // end particle/track loop

  nav.Clear();
} // end event loop
//cout << endl; //debug
printf( "Done.\n" );


//// PART 2: FIND INTEREVENT TIMES
printf("Relating times...\n");

// create new branches
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T_scint->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T_scint->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T_scint->Branch("interevent_time", &interevent_time, "interevent_time/D");
T_scint->GetEntry(0);
run_start = t_event_start;

// fill new branches
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < T_scint->GetEntries(); k++ )) {
  T_scint->GetEntry(k);
  event_time_adj = t_event_start - run_start;
  wall_time_adj = wallTime - run_start;
  T_scint->GetBranch("event_time_adj")->Fill();
  T_scint->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k == 0 ) {
    interevent_time = 0;
  } else {
    time_current = wallTime;
    T_scint->GetEntry(k-1);
    time_prev = wallTime;
    T_scint->GetEntry(k);
    interevent_time = time_current - time_prev;
  }
  T_scint->GetBranch("interevent_time")->Fill();
}
printf("Done.\n");

// finish up
T_scint->Write();
f->Close();

// all pau!   )
//return T_scint;
}
