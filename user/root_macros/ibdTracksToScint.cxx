// ibdTracksToScint -- macro to translae prompt-to-delayed displacement vectors
//   from IBD candidate events to "_T.root" scint-data format
// -- for use with the macros in https://github.com/duvall3/rat-pac/tree/collab/user/root-macros/
// -- runs on original RAT-PAC .root file
//

void ibdTracksToScint ( const char* filename ) {

// init
TString FileName = filename;
TString basename = FileName(0, FileName.Index(".root"));
//TFile* f_in = TFile::Open(filename);
TFile* f_in = TFile::Open(filename, "update");
//TRegexp tarname = ".*target.*"; // general
//TRegexp tarname = ".*[target|capture].*"; // SANTA
//TString volname;
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();
//Bool_t prompt_tf, delayed_tf;

// get total top-level RAT-PAC MC events
Long64_t totalRATEvents;
totalRATEvents = T->GetEntries();
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);

// create tree and set branch addresses
TTree* T_scint = new TTree("T_scint","Pseudo-Scintillation Data");
T_scint->GetUserInfo()->Add(nMCEvents_tos);
Int_t event;
Double_t event_time, wall_time, energy, energy_q, x, y, z;
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T_scint->Branch( "event", &event, "event/I" );
//T_scint->Branch( "event_time", &event_time, "event_time/D" );
//T_scint->Branch( "wall_time", &wall_time, "wall_time/D" );
T_scint->Branch( "energy", &energy, "energy/D" );
T_scint->Branch( "energy_q", &energy_q, "energy_q/D" );
T_scint->Branch( "x", &x, "x/D" );
//T_scint->Branch( "y", &y, "y/D" );
//T_scint->Branch( "z", &z, "z/D" );
//T_scint->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
//T_scint->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
//T_scint->Branch("interevent_time", &interevent_time, "interevent_time/D");
//T->GetEntry(0);
//run_start = event_time;

// MAIN
Long64_t k(0), N(totalRATEvents);
Int_t i(0);
Double_t xStep, eqStep, xeq, eqSum;
for ( k=0; k<N; k++ ) { // event loop
  event = k;
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  // positron
  n = c.GoChild(0);
  xeq = 0;
  eqSum = 0;
  energy = 0;
  energy_q = 0;
  for ( i=0; i<c.StepCount(); i++ ) { // step loop
    n = c.GoStep(i);
    xStep = n->GetEndpoint().X();
    eqStep = n->GetTotEDepScintQuenched();
    xeq += xStep * eqStep;
    eqSum += eqStep;
    energy += n->GetTotEDepScint();
  } // step loop
  energy_q = eqSum;
//cout << xeq << " " << xStep << " " << eqSum << endl; //debug
  x = xeq / eqSum;
  if (eqSum > 0) T_scint->Fill();
  // neutron
  c.GoParent();
  n = c.GoChild(1);
//if (eqSum > 0) T_scint->Fill();
  nav.Clear();
} // event loop

//// fill new branches
//Int_t k;
//Double_t time_current, time_prev;
//// times aligned to run start
//for (( k = 0; k < num_bursts; k++ )) {
//  T_scint->GetEntry(k);
//  event_time_adj = event_time - run_start;
//  wall_time_adj = wall_time - run_start;
//  T_scint->GetBranch("event_time_adj")->Fill();
//  T_scint->GetBranch("wall_time_adj")->Fill();
//  // interevent times
//  if ( k == 0 ) { 
//    interevent_time = 0;
//  } else {
//    time_current = wall_time;
//    T_scint->GetEntry(k-1);
//    time_prev = wall_time;
//    T_scint->GetEntry(k);
//    interevent_time = time_current - time_prev;
//  }
//  T_scint->GetBranch("interevent_time")->Fill();
//}

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
f_in->Write();
//f_in->Close();

// all pau!   )
}
