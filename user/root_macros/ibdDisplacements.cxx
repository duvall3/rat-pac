// ibdDisplacements -- macro to draw prompt-to-delayed displacement vectors
//   from IBD candidate events
// -- for use with the macros in https://github.com/duvall3/rat-pac/tree/collab/user/root-macros/
// -- runs on "$DATARUN_results.root" file created by SEDAQ.cxx
// -- run RATPACEventViewer.cxx in ROOT session first
// -- see "duvall3Include.h" in the above for installation
// -- see comments in the individual macros for details
//
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ //

TH1D* ibdDisplacements ( const char* filename ) {

// init
TString FileName = filename;
TFile* f = TFile::Open(filename, "update");
Int_t k=0, N=T->GetEntries();
Double_t xp, xd, yp, yd, zp, zd, energy, energy_q;
Double_t xp0, yp0, zp0, xpm, ypm, zpm;
TH1D* h = new TH1D("h", "deltaX_MC", 100, -60., 60.);
TRegexp tarname = ".*target.*";
TString volname;
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();
Bool_t prompt_tf, delayed_tf;

// create new TTree and TFile
TTree* T_xyz = new TTree("T_xyz", "MC Positron Position Data");
Double_t xpi, ypi, zpi, xpa, ypa, zpa, xpf, ypf, zpf;
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

// MAIN
for ( k=0; k<(N-1); k++ ) {
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
  c.GoParent();
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
//  cout << k << "\t" << xp << " " << yp << " " << zp << "\t" << xd << " " << yd << " " << zd << endl;
//  cout << k << "\t" << xpm << " " << ypm << " " << zpm << "\t" << xd << " " << yd << " " << zd << endl;
//  printf( "%d\t%f %f %f\n\t%f %f %f\n\t%f %f %f\n\t%f %f %f\n\n", k, xp0, yp0, zp0, xpm, ypm, zpm, xp, yp, zp, xd, yd, zd );
    // copy values to new TTree
    event = k; xpi = xp0; ypi = yp0; zpi = zp0; xpa = xpm; ypa = ypm; zpa = zpm; xpf = xp; ypf = yp; zpf = zp;
    T_xyz->Fill();
  }
}
//h->Draw();

// finish up
T_xyz->Write();

// all pau!   )
return h;
}
