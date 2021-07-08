// rt_to_root -- small ancillary script to bring .rt file data into ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //
// Last modified: 7/2021 //

int rt_to_root( const char* filename ) {


// arg check
TString FileName, basename;
FileName = filename;
if ( FileName.Contains(".rt") ) {
  basename=FileName(0,FileName.Index(".rt"));
} else {
  cout << endl << "ERROR: Check file type. Exiting..." << endl << endl;
  return 2;
}

// retrieve total top-level RAT-PAC MC events from the original ROOT file
TFile* _f = TFile::Open(basename+".root");
Long64_t totalRATEvents;
totalRATEvents = T_scint->GetEntries();
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);
_f->Close();

// create outfile
TFile f = TFile(basename+"_T.root", "new");

// create tree, read ASCII data, set branch addresses
TTree* T_scint = new TTree("T_scint","Scintillation Data");
T_scint->GetUserInfo()->Add(nMCEvents_tos);
T_scint->ReadFile( filename, "event/I:event_time/D:wall_time/D:energy/D:energy_q/D:x/D:y/D:z/D" );
Long64_t num_bursts = T_scint->GetEntries();
Int_t event;
Double_t event_time, wall_time, energy, energy_q, x, y, z;
T_scint->SetBranchAddress( "event", &event );
T_scint->SetBranchAddress( "event_time", &event_time );
T_scint->SetBranchAddress( "wall_time", &wall_time );
T_scint->SetBranchAddress( "energy", &energy );
T_scint->SetBranchAddress( "energy_q", &energy_q );
T_scint->SetBranchAddress( "x", &x );
T_scint->SetBranchAddress( "y", &y );
T_scint->SetBranchAddress( "z", &z );

// create and address new branches 
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T_scint->GetEntry(0);
run_start = event_time;
T_scint->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T_scint->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T_scint->Branch("interevent_time", &interevent_time, "interevent_time/D");

// fill new branches
Int_t k;
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < num_bursts; k++ )) {
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


// all pau!   )
f.Write();
f.Close();
return 0;
}
