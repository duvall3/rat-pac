// ibdTracksToScint -- macro to translae prompt-to-delayed displacement vectors
//   from IBD candidate events to "_T.root" scint-data format
// -- for use with the macros in https://github.com/duvall3/rat-pac/tree/collab/user/root-macros/
// -- runs on original RAT-PAC .root file
//
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/21 ~ //

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

void ibdTracksToScint ( const char* filename ) {

// load utility macros if needed
if (! gInterpreter->IsLoaded("findCellScintTotal.cxx")) gROOT->LoadMacro("findCellScintTotal.cxx");
if (! gInterpreter->IsLoaded("findCellScintTotalQuenched.cxx")) gROOT->LoadMacro("findCellScintTotalQuenched.cxx");

// init
TString FileName = filename;
TString basename = FileName(0, FileName.Index(".root"));
//TFile* f_in = TFile::Open(filename);
TFile* f_in = TFile::Open(filename, "update");
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();
RAT::DS::MC* mc = ds->GetMC();

// possibly not needed in current version
//TRegexp tarname = ".*target.*"; // general
//TRegexp tarname = ".*[target|capture].*"; // SANTA
//TString volname;
//Bool_t prompt_tf, delayed_tf;

// get total top-level RAT-PAC MC events
Long64_t totalRATEvents;
totalRATEvents = T->GetEntries();
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);

// create tree and set branch addresses
TTree* T_scint = new TTree("T_scint", "Pseudo-Scintillation Data");
//TTree* T_scint = new TTree("T", "Pseudo-Scintillation Data");
T_scint->GetUserInfo()->Add(nMCEvents_tos);
Int_t event;
Double_t event_time, wall_time, energy, energy_q, x, y, z;
T_scint->Branch( "event", &event, "event/I" );
T_scint->Branch( "event_time", &event_time, "event_time/D" );
T_scint->Branch( "wall_time", &wall_time, "wall_time/D" );
T_scint->Branch( "energy", &energy, "energy/D" );
T_scint->Branch( "energy_q", &energy_q, "energy_q/D" );
T_scint->Branch( "x", &x, "x/D" );
T_scint->Branch( "y", &y, "y/D" );
T_scint->Branch( "z", &z, "z/D" );

// MAIN PASS 1

Long64_t k(0), N(totalRATEvents);
Int_t i(0);
Double_t eStep, eSum, eqStep, eqSum;
Double_t xStep, yStep, zStep, xEQ, yEQ, zEQ;

for ( k=0; k<N; k++ ) { // event loop

  // init
  event = k;
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  mc = ds->GetMC();
  event_time = mc->GetUTC().AsDouble();

  // positron
  n = c.GoChild(0);
  wall_time = event_time + n->GetGlobalTime()*1.e-9;
  xEQ = 0;
  yEQ = 0;
  zEQ = 0;
  eSum = 0;
  eqSum = 0;
  energy = 0;
  energy_q = 0;
  for ( i=0; i<c.StepCount(); i++ ) { // step loop
    n = c.GoStep(i);
    eStep = n->GetTotEDepScint();
    eqStep = n->GetTotEDepScintQuenched();
    xStep = n->GetEndpoint().X();
    yStep = n->GetEndpoint().Y();
    zStep = n->GetEndpoint().Z();
    xEQ += xStep * eqStep;
    yEQ += yStep * eqStep;
    zEQ += zStep * eqStep;
    eSum += eStep;
    eqSum += eqStep;
  } // step loop
  energy = eSum;
  energy_q = eqSum;
  x = xEQ / eqSum;
  y = yEQ / eqSum;
  z = zEQ / eqSum;
  if (energy_q > 0) {
    T_scint->Fill();
  }

  // neutron
  c.GoParent();
  c.GoChild(1);
  n = c.GoTrackEnd();
  wall_time = event_time + n->GetGlobalTime()*1.e-9;
  TString nProc = n->GetProcess();
  if ( (nProc == "nCapture") || (nProc == "hadInelastic") ) {
    energy = findCellScintTotal(c);
    energy_q = findCellScintTotalQuenched(c);
    x = n->GetEndpoint().X();
    y = n->GetEndpoint().Y();
    z = n->GetEndpoint().Z();
    if (energy_q > 0) {
      T_scint->Fill();
    }
  }

  // keep memory from blowing up
  nav.Clear();

} // event loop


// MAIN PASS 2

// create new branches
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T_scint->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T_scint->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T_scint->Branch("interevent_time", &interevent_time, "interevent_time/D");
T_scint->GetEntry(0);
run_start = event_time;

// fill new branches
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < T_scint->GetEntries(); k++ )) {
  T_scint->GetEntry(k);
  event_time_adj = event_time - run_start;
  wall_time_adj = wall_time - run_start;
  T_scint->GetBranch("event_time_adj")->Fill();
  T_scint->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k == 0 ) { 
    interevent_time = 0;
  } else {
    time_current = wall_time;
    T_scint->GetEntry(k-1);
    time_prev = wall_time;
    T_scint->GetEntry(k);
    interevent_time = time_current - time_prev;
  }
  T_scint->GetBranch("interevent_time")->Fill();
}

//// switch to outfile
//f_in->Close();
////TFile f_out = TFile(basename+"_scint.root", "new");
//TFile f_out = TFile(basename+"_scint.root", "recreate");
//
//// finish up
//T_scint->Write();
//f_out->Write();
//f_out->Close();

T_scint->Write();
//f_in->Write();
//f_in->Close();

// all pau!   )
}
