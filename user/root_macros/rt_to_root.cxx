// rt_to_root -- small ancillary script to bring .rt file data into ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //

void rt_to_root( const char* filename ) {


// arg check, create outfile
TString FileName, basename;
FileName = filename;
if ( FileName.Contains(".rt") ) {
  basename=FileName(0,FileName.Index(".rt"));
} else {
  cout << endl << "ERROR: Check file type. Exiting..." << endl << endl;
  return 2;
}
TFile f = TFile(basename+"_T.root", "new");

// create tree, read ASCII data, set branch addresses
TTree* T = new TTree("T","Scintillation Data");
T->ReadFile( filename, "event/I:event_time/D:wall_time/D:energy/D:energy_q/D:x/D:y/D:z/D" );
Long64_t num_bursts = T->GetEntries();
Int_t event;
Double_t event_time, wall_time, energy, energy_q, x, y, z;
T->SetBranchAddress( "event", &event );
T->SetBranchAddress( "event_time", &event_time );
T->SetBranchAddress( "wall_time", &wall_time );
T->SetBranchAddress( "energy", &energy );
T->SetBranchAddress( "energy_q", &energy_q );
T->SetBranchAddress( "x", &x );
T->SetBranchAddress( "y", &y );
T->SetBranchAddress( "z", &z );

// create and address new branches 
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T->GetEntry(0);
run_start = event_time;
T->Branch("event_time_adj", &event_time_adj, "event_time_adj/D");
T->Branch("wall_time_adj", &wall_time_adj, "wall_time_adj/D");
T->Branch("interevent_time", &interevent_time, "interevent_time/D");

// fill new branches
Int_t k;
Double_t time_current, time_prev;
// times aligned to run start
for (( k = 0; k < num_bursts; k++ )) {
  T->GetEntry(k);
  event_time_adj = event_time - run_start;
  wall_time_adj = wall_time - run_start;
  T->GetBranch("event_time_adj")->Fill();
  T->GetBranch("wall_time_adj")->Fill();
  // interevent times
  if ( k == 0 ) { 
    interevent_time = 0;
  } else {
    time_current = wall_time;
    T->GetEntry(k-1);
    time_prev = wall_time;
    T->GetEntry(k);
    interevent_time = time_current - time_prev;
  }
  T->GetBranch("interevent_time")->Fill();
}


// all pau!   )
f.Write();
f.Close();
return;
}
