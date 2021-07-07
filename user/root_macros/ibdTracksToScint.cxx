// ibdTracksToScint -- macro to translae prompt-to-delayed displacement vectors
//   from IBD candidate events to "_T.root" scint-data format
// -- for use with the macros in https://github.com/duvall3/rat-pac/tree/collab/user/root-macros/
// -- runs on original RAT-PAC .root file
//

void ibdTracksToScint ( const char* filename ) {

// init
TString FileName = filename;
TFile* f = TFile::Open(filename, "update");
//FIXME Int_t k=0, N=T->GetEntries();
Double_t xp, xd, yp, yd, zp, zd, energy, energy_q;
Double_t xp0, yp0, zp0, xpm, ypm, zpm;
Double_t xd0, yd0, zd0;
TH1D* h = new TH1D("h", "deltaX_MC", 100, -60., 60.);
TRegexp tarname = ".*target.*"; // general
//TRegexp tarname = ".*[target|capture].*"; // SANTA
TString volname;
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();
Bool_t prompt_tf, delayed_tf;

// create new TTree
TTree* T_xyz = new TTree("T_xyz", "MC Position Data");
Double_t xpi, ypi, zpi, xpa, ypa, zpa, xpf, ypf, zpf;
Double_t xdi, ydi, zdi, xdf, ydf, zdf;
Int_t event;
T_xyz->Branch("event", &event);
T_xyz->Branch("xpi", &xpi);
T_xyz->Branch("ypi", &ypi);
T_xyz->Branch("zpi", &zpi);
T_xyz->Branch("xpa", &xpa);
T_xyz->Branch("ypa", &ypa);
T_xyz->Branch("zpa", &zpa);
T_xyz->Branch("xpf", &xpf);
T_xyz->Branch("ypf", &ypf);
T_xyz->Branch("zpf", &zpf);
T_xyz->Branch("xdi", &xdi);
T_xyz->Branch("ydi", &ydi);
T_xyz->Branch("zdi", &zdi);
T_xyz->Branch("xdf", &xdf);
T_xyz->Branch("ydf", &ydf);
T_xyz->Branch("zdf", &zdf);

// MAIN
for ( k=0; k<N; k++ ) {
  prompt_tf = kFALSE;
  delayed_tf = kFALSE;
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  n = c.GoChild(0);
  xp0 = n->GetEndpoint().X();
  yp0 = n->GetEndpoint().Y();
  zp0 = n->GetEndpoint().Z();
  n = c.GoTrackEnd();
  volname = n->GetVolume();
  if (volname.Contains(tarname)) {
    prompt_tf = kTRUE;
    xp = n->GetEndpoint().X();
    yp = n->GetEndpoint().Y();
    zp = n->GetEndpoint().Z();
  }
  // IBD (or other run w/ 2 top-level RAT particles)
  if (ibd_tf == kTRUE) {
    c.GoParent();
    xd0 = n->GetEndpoint().X();
    yd0 = n->GetEndpoint().Y();
    zd0 = n->GetEndpoint().Z();
    c.GoChild(1);
    n = c.GoTrackEnd();
    volname = n->GetVolume();
    if (volname.Contains(tarname)) {
      delayed_tf = kTRUE;
      xd = n->GetEndpoint().X();
      yd = n->GetEndpoint().Y();
      zd = n->GetEndpoint().Z();
    }
    if (prompt_tf && delayed_tf) {
      h->Fill(xd-xp);
      xpm = (xp0+xp)/2;
      ypm = (yp0+yp)/2;
      zpm = (zp0+zp)/2;
      // copy values to new TTree
      event = k;
      xpi = xp0; ypi = yp0; zpi = zp0; xpa = xpm; ypa = ypm; zpa = zpm; xpf = xp; ypf = yp; zpf = zp;
      xdi = xd0; ydi = xd0; zdi = zd0; xdf = xd; ydf = yd; zdf = zd;
      T_xyz->Fill();
    }
  } else {
    event = k;
    xpi = xp0; ypi = yp0; zpi = zp0; xpf = xp; ypf = yp; zpf = zp;
    T_xyz->Fill();
  }
  nav.Clear();
}
//h->Draw();

// finish up
T->Write();

// retrieve total top-level RAT-PAC MC events from the original ROOT file
TFile* _f = TFile::Open(filename);
Long64_t totalRATEvents;
totalRATEvents = T->GetEntries();
TString nMCEvents = TString::LLtoa(totalRATEvents, 10); // Long to TString, base-10
TObjString *nMCEvents_tos = new TObjString(nMCEvents);
_f->Close();

// create outfile
TFile f = TFile(basename+"_T.root", "new");

// create tree and set branch addresses
TTree* T = new TTree("T","Scintillation Data");
T->GetUserInfo()->Add(nMCEvents_tos);
//T->ReadFile( filename, "event/I:event_time/D:wall_time/D:energy/D:energy_q/D:x/D:y/D:z/D" );
//FIXME Long64_t num_bursts = T->GetEntries();
Int_t event;
Double_t event_time, wall_time, energy, energy_q, x, y, z;
Double_t run_start, interevent_time, event_time_adj, wall_time_adj;
T->Branch( "event", &event );
T->Branch( "event_time", &event_time );
T->Branch( "wall_time", &wall_time );
T->Branch( "energy", &energy );
T->Branch( "energy_q", &energy_q );
T->Branch( "x", &x );
T->Branch( "y", &y );
T->Branch( "z", &z );
//FIXME?
T->GetEntry(0);
run_start = event_time;
//
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
}
