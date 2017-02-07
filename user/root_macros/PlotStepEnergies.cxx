// PlotStepEnergies -- simple macro to get stepwise energy deposit info and make basic plots
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 2/17 ~ //

int PlotStepEnergies( const char* filename ) {

//TFile *file0 = TFile::Open("test_electrons.root");
//RAT::DSReader r("test_electrons.root")/

TFile *file0 = TFile::Open(filename);
RAT::DSReader r(filename);

RAT::DS::Root *ds = r.NextEvent();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(false);

c.GoChild(0);

Int_t steps = c.StepCount(); // currently 9789

Float_t t[9789];
Float_t ens[9789];
TH1F *h = new TH1F("h", "Step-wise Energies", 100, 0., 0.2);

for (Int_t k=0; k<9789; k++) {

  RAT::TrackNode *n = c.Step(k);
  t[k] = n->GetGlobalTime();
  ens[k] = n->GetTotEDepScintQuenched();
  h.Fill(ens[k]);

}

TCanvas *c1 = new TCanvas;
TGraph *g1 = new TGraph(9789, t, ens);
g1->SetTitle("Step-wise Energies");
g1->GetXaxis()->SetTitle("Time (ns)");
g1->GetYaxis()->SetTitle("Energy (MeV)");
g1->Draw("AL");
c1->Update();

TCanvas *c2 = new TCanvas;
c2->SetLogy(true);
h->GetXaxis()->SetTitle("Energy (MeV)");
h->GetYaxis()->SetTitle("Entries");
h->SetLineColor(kRed);
h->Draw();
c2->Update();

// all pau!   )
return 0;
}
