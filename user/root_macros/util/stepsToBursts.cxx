// stepsToBursts.cxx -- macro to convert per-step scintillation data to per-burst
// -- based on code by Marc F. Bergevin
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


void stepsToBursts(const char* filename) {
//TTree* stepsToBursts(const char* filename) {


//// INIT

// open file
TFile* f = TFile::Open("allscint_ScintSteps.root", "update");
//TTree* T = T_steps;

// init T_steps
Int_t event;
Double_t t_event_start, t_step, wall_time, energy, energy_q, x, y, z;
Double_t time_window = 200.e-9;
Double_t old_time = -1.e-9, start_time = -1.e-9;
Double_t rollingEnergy = 0., rollingEnergyQ = 0.;
Long64_t k=0, N=T_steps->GetEntries();
T_steps->SetBranchAddress("event", &event);
T_steps->SetBranchAddress("t_event_start", &t_event_start);
T_steps->SetBranchAddress("t_step", &t_step);
T_steps->SetBranchAddress("wall_time", &wall_time);
T_steps->SetBranchAddress("energy", &energy);
T_steps->SetBranchAddress("energy_q", &energy_q);
T_steps->SetBranchAddress("x", &x);
T_steps->SetBranchAddress("y", &y);
T_steps->SetBranchAddress("z", &z);

// init T_bursts
TTree* T_bursts = new TTree("T_bursts", "PER-BURST Scintillation Data");
Int_t bevent;
Double_t bt_event_start, bwall_time, benergy, benergy_q, bx, by, bz;
T_bursts->Branch("event", &bevent);
T_bursts->Branch("event_time", &bt_event_start);
T_bursts->Branch("wall_time", &bwall_time);
T_bursts->Branch("energy", &benergy);
T_bursts->Branch("energy_q", &benergy_q);
T_bursts->Branch("x", &bx);
T_bursts->Branch("y", &by);
T_bursts->Branch("z", &bz);


// MAIN

// no event or particle loops; just loop over steps
for ( k=0; k<N; k++ ) {
  T_steps->GetEntry(k);
//if ( (event%10==0) && (k%1000==0) ) printf("%d %f %f %f %f\n", event, wall_time, old_time, wall_time-old_time, time_window); //debug
  if ( (wall_time-old_time) > time_window ) {
//  cout << "burst found" << endl; //debug
    if ( rollingEnergy > 0.001 ) {
      bevent = event;
      bwall_time = wall_time;
      bt_event_start = t_event_start;
      benergy = rollingEnergy;
      benergy_q = rollingEnergyQ;
      bx = x; // go here, or is this the problem?? -- NEW
      by = y; // go here, or is this the problem?? -- NEW
      bz = z; // go here, or is this the problem?? -- NEW
      T_bursts->Fill();
    } // endif -- rollingEnergy > .001
    rollingEnergy = 0.;
    rollingEnergyQ = 0.;
    start_time = wall_time;
  } // endif -- time_window
  old_time = wall_time;
  rollingEnergy += energy;
  rollingEnergyQ += energy_q;
//bx = x; // go here, or is this the problem?? -- ORIG
//by = y; // go here, or is this the problem?? -- ORIG
//bz = z; // go here, or is this the problem?? -- ORIG
} // end main loop
  
//// PART 2: FIND INTEREVENT TIMES
printf("Relating times...\n");

// create new branches
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T_bursts->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T_bursts->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T_bursts->Branch("interevent_time", &interevent_time, "interevent_time/D");
T_bursts->GetEntry(0);
run_start = bt_event_start;

// fill new branches
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < T_bursts->GetEntries(); k++ )) {
  T_bursts->GetEntry(k);
  event_time_adj = bt_event_start - run_start;
  wall_time_adj = bwall_time - run_start;
  T_bursts->GetBranch("event_time_adj")->Fill();
  T_bursts->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k == 0 ) {
    interevent_time = 0;
  } else {
    time_current = bwall_time;
    T_bursts->GetEntry(k-1);
    time_prev = bwall_time;
    T_bursts->GetEntry(k);
    interevent_time = time_current - time_prev;
  }
  T_bursts->GetBranch("interevent_time")->Fill();
}
printf("Done.\n");


// finish up
T_bursts->Write("T_scint");
f->Close();

// all pau!   )
//return T_bursts;
return;
}

//// overload
//TTree* stepsToBursts() {
//  TString dirname = gSystem->pwd();
//  dirname = dirname( dirname.Last('/')+1, dirname.Length()-1 );
//  TString fileName = dirname+"_ScintSteps.root";
//  TTree* T_bursts = stepsToBursts( fileName.Data() );
//  return T_bursts;
//}

