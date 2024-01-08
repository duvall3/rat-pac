// analyzeScatPos -- ad-hoc macro for loading scattering1/post_checking data
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2024 ~ //

void analyzeScatPos( const char* filename ) {

  // loading

  TFile *f = TFile::Open(filename);
  gSystem->mkdir("txt");
  gSystem->mkdir("png");
  Int_t k(0), nScat, nScatters[5] = {1, 2, 5, 10, 20};
  TString line;
  for (k=0; k<5; k++) {
    nScat = nScatters[k];
    line.Form("TTree *T%d = (TTree*)gDirectory->Get(\"T%d\");", nScat, nScat);
    gInterpreter->ProcessLine(line.Data());
  }
  TTree *T_s = (TTree*)gDirectory->Get("T_summary");

  // processing if desired

  // tree list
  TList *l = new TList;
  l->Add(T1);
  l->Add(T2);
  l->Add(T5);
  l->Add(T10);
  l->Add(T20);
  TIter i(l);
  TTree *T;

  // plot init
  TCanvas *c1 = new TCanvas("c1", "c1");
  TCanvas *c2 = new TCanvas("c2", "c2");
  Double_t axlim = 100.;
  TH1D *h1 = new TH1D("h1", "1-D plots", 100, -axlim, axlim);
  TH2D *h2 = new TH2D("h2", "2-D plots", 100, -axlim, axlim, 100, -axlim, axlim);
  h2->GetXaxis()->SetTitle("y (mm)");
  h2->GetYaxis()->SetTitle("x (mm)");
  TH1D *hcp = new TH1D("hcp", "Cos #psi", 20, -1.01, 1.01);
  T1->Draw("cos_psi>>hcp"); 	// init, for "same" below
  Long64_t nEntries;
  Double_t xMean, xRMS, yMean, yRMS, zMean, zRMS, cos_psi_mean;
  TString summary;
  const char *cpfilename = "txt/cp.txt";
  ofstream cpfile(cpfilename);
  cpfile << "Cos(psi) Histograms" << endl << endl << endl;
  ofstream sumfile("txt/summary.txt");

  // iterate
  Int_t iColor(2);
  for ( i=l->begin(); i!=l->end(); ++i ) {
    T = (TTree*)*i;
    nEntries = T->GetEntries();
    // plots and stats
    c1->cd();
    T->Draw("fX>>h1");
    xMean = h1->GetMean();
    xRMS = h1->GetRMS();
    T->Draw("fY>>h1");
    yMean = h1->GetMean();
    yRMS = h1->GetRMS();
    T->Draw("fZ>>h1");
    zMean = h1->GetMean();
    zRMS = h1->GetRMS();
    T->Draw("-fX:fY>>h2");
    c1->Print(TString::Format("png/%s_xy.png", T->GetName()));
    c2->cd();
    T->Draw("cos_psi>>hcp", "", "same");
    hcp->SetLineColor(iColor);
    cos_psi_mean = hcp->GetMean();
    if (gInterpreter->IsLoaded("TDuvallUtils.cxx")) {
      gSystem->RedirectOutput("txt/cp.txt");
      printf("%s\n********************************\n", T->GetName());
      TDuvallUtils::DumpHist(hcp);
      printf("********************************\nMean: %f\n\n\n", hcp->GetMean());
      gSystem->RedirectOutput(0);
    }
    summary.Form("\n%s Summary (%d Entries)\nx:\tmean = %f\tRMS = %f\ny:\tmean = %f\tRMS = %f\nz:\tmean = %f\tRMS = %f\nmean cos_psi = %f\n", T->GetName(), nEntries, xMean, xRMS,yMean, yRMS, zMean, zRMS, cos_psi_mean);
    /* printf(summary.Data()); //debug */
    sumfile << summary.Data();
    iColor++;
  }
  c2->Print("png/cp.png");

  // all pau!   )
  cpfile.close();
  sumfile.close();
  return;
}
