// burstsDeltaX.cxx -- calculate displacement just from "_T.root" bursts file
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ //

void burstsDeltaX( TTree* T ) {

// init
Int_t k = 0, N = T->GetEntries();
Int_t event, event_prev;
Double_t energy, energy_q, x, y, z;
Double_t xp, yp, zp;

// read tree
T->SetBranchAddress("event", &event);
T->SetBranchAddress("energy", &energy);
T->SetBranchAddress("energy_q", &energy_q);
T->SetBranchAddress("x", &x);
T->SetBranchAddress("y", &y);
T->SetBranchAddress("z", &z);

// prepare histogram
//TH1D* h = new TH1D("h", "deltaX_bursts", 100, -25., 25.);
TH1D* h = new TH1D("h", "deltaX_bursts", 100, -60., 60.);

// get starting entry
T->GetEntry(0);
event_prev = event;
xp = x;

// MAIN
for ( k=1; k<(N-1); k++ ) {
  T->GetEntry(k);
  if (event==event_prev) {
    h->Fill(x-xp);
  }
  event_prev = event;
  xp = x;
}
h->Draw();

// all pau!   )
}
