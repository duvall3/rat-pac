// PlotEndpoints -- simply makes a 3-D histogram of the endpoints of each top-level particle track
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2017 ~ //

void PlotEndpoints(const char* filename, const Int_t Events) {

RAT::DSReader r(filename);
RAT::DS::Root *ds;

Double_t side = 200;
TH3D* h_e = new TH3D("h_e", "Positron-Annihilation Locations", 100, -side, side, 100, -side, side, 100, -side, side);
TH3D* h_n = new TH3D("h_n", "Neutron-Capture Locations", 100, -side, side, 100, -side, side, 100, -side, side);

Int_t event;
TVector3 endpoint;
Double_t xf_e,yf_e,zf_e;
Double_t xf_n,yf_n,zf_n;

for (event=0; event < Events; event++) {
  
  // track navigation items
  ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);

  // positron stuff
  c.GoChild(0);
  n = c.GoTrackEnd();
  endpoint = n->GetEndpoint();
  xf_e = endpoint.x();
  yf_e = endpoint.y();
  zf_e = endpoint.z();
  h_e->Fill( xf_e, yf_e, zf_e );
  c.GoParent();

  // neutron stuff
  c.GoChild(1);
  n = c.GoTrackEnd();
  endpoint = n->GetEndpoint();
  xf_n = endpoint.x();
  yf_n = endpoint.y();
  zf_n = endpoint.z();
  h_n->Fill( xf_n, yf_n, zf_n );

} // end event loop

// draw histograms
TCanvas *c1 = new TCanvas("c1");
h_e->SetMarkerSize(3);
h_e->SetMarkerColor(kRed);
h_e->Draw();
h_n->SetMarkerSize(3);
h_n->SetMarkerColor(kBlue);
h_n->Draw("same");

// all pau!   )
} // end macro
