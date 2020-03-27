// PlotStepEnergies -- simple macro to get stepwise energy deposit info and make basic plots
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 2/17 ~ //


int PlotStepEnergies( const char* filename ) {


// open file
TFile *file0 = TFile::Open(filename);
RAT::DSReader r(filename);

// prepare RAT navigation
RAT::DS::Root *ds = r.NextEvent();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(false);

// enter track and find number of steps
c.GoChild(0);
Int_t steps = c.StepCount();

// prepare vectors
TVectorT <Float_t> t(steps);
TVectorT <Float_t> ens(steps);

// fill vectors
for (Int_t k=0; k<steps; k++) {
  RAT::TrackNode *n = c.Step(k);
  t[k] = n->GetGlobalTime();
  ens[k] = n->GetTotEDepScintQuenched();
}

// set up and fill histogram
TH1D *h = new TH1D("h", "Step-wise Energies", 100, ens.Min(), ens.Max());
for (Int_t k=0; k<steps; k++) { h->Fill(ens[k]); }

// draw time plot
TCanvas *c1 = new TCanvas;
TGraph *g1 = new TGraph(9789, &t[0], &ens[0]);
g1->SetTitle("Step-wise Energies");
g1->GetXaxis()->SetTitle("Time (ns)");
g1->GetYaxis()->SetTitle("Energy (MeV)");
g1->Draw("AL");
c1->Update();

// draw histogram
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
