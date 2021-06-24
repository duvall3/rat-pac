// ibdMomenta.cxx -- check the transverse and parallel momenta
//   of the products from RAT-PAC's IBD generator
// -- NOTE: currently hard-coded for incoming antineutrinos along {+/-1, 0, 0}


void ibdMomenta ( const char* FileName = "", bool save_tf = false ) {

// global
gStyle->SetHistLineWidth(2);
gStyle->SetHistLineColor(kBlue);


// file operations
TString filename;
if (FileName != "") {
  filename = FileName;
} else {
  if (gFile != 0x0) {
    filename = gFile->GetName();
  } else {
    cout << "Error: Please load or specify a ROOT file." << endl;
    return;
  }
}
TString datarun = filename(0, filename.Index(".root"));
TString savename = datarun+"_ibd-product-momenta.png";

// init
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n = c.Here();
Int_t k = 0, N = r.GetTotal();
TVector3 pe, pn;
TH2D* h = new TH2D("h", "Transverse Momenta", 100, -1., 1., 100, -1., 1.);
TCanvas* can = new TCanvas("can", "IBD Generator pT Test");
TH1D* hx = new TH1D("hx", "Parallel Momenta", 100, -10., 10.);

// MAIN
for ( k=0; k<N-1; k++ ) {
  pe = TVector3(0,0,0);
  pe = TVector3(0,0,0);
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  n = c.GoChild(0);
  pe = n->GetMomentum();
  c.GoParent();
  n = c.GoChild(1);
  pn = n->GetMomentum();
  hx->Fill(pe.X()+pn.X());
  h->Fill(pe.Y()+pn.Y(), pe.Z()+pn.Z());
  nav.Clear();
}

// plot results
can->Divide(1,2);
can->cd(1);
h->Draw("colz");
h->GetXaxis()->SetTitle("Y Momenta (MeV)");
h->GetYaxis()->SetTitle("Z Momenta (MeV)");
can->cd(2);
hx->Draw();
hx->GetXaxis()->SetTitle("X Momenta (MeV)");

// save if desired
if (save_tf == true) can->SaveAs(savename);

// all pau!   )
return;
}
