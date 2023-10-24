// iso_comp.cxx -- macro to recreate the wonderful iso_comp plots,
//   since the #*!$ things didn't save properly the first time

{

  // file and canvas init
  TFile *f0 = TFile::Open("COMPMAIN_SANTA_10K_ncap_res.root");
  TFile *f1 = TFile::Open("MAIN_ISO_RUN_ncap_res.root");
  TFile *f = TFile::Open("iso_comp.root", "recreate");
  TCanvas *cc = new TCanvas("c_comp", "Iso Comparison");
  TCanvas *cs = new TCanvas("c_sub", "Iso Subtraction");

  // retrieve items
  f0->cd();
  TH1D *hz0 = (TH1D*)gDirectory->Get("h_zeta");
  f1->cd();
  TH1D *hz1 = (TH1D*)gDirectory->Get("h_zeta");
  f->cd();
  TF1 *hf0 = (TF1*)hz0->GetListOfFunctions()->At(0);
  /* TF1 *hf1 = (TF1*)hz1->GetListOfFunctions()->At(0);   //NOPE */
  /* TF1 *hf1 = new TF1("hf1", "[0]*TMath::Gaus(x,[1],[2])", hf0->GetXmin(), hf0->GetXmax()); */
  TF1 *hf1 = new TF1("hf1", "[0]*TMath::Gaus(x,[1],[2])", -90., 90.);
  hf1->SetParameters(TMath::Sqrt(hz1->GetEntries()), -1., 40.);
  hf1->SetLineColor(kGreen);
  hf1->SetLineWidth(4);

  // redraw separate
  /* gStyle->SetStatStyle(0); */
  /* hz0->SetStats(0); */
  hz0->SetStats(kFALSE);
  hz1->SetStats(kFALSE);
  cc->cd();
  hz1->Fit(hf1, "SR");
  hz0->Draw();
  hz1->Draw("same");
  hf0->SetLineColor(kMagenta);
  hz1->SetLineColor(kRed);
  hz0->SetLineWidth(5);
  hz1->SetLineWidth(5);
  hf0->SetLineWidth(4);
  hz0->GetXaxis()->SetTitle("#varphi (^{o})");

  // legend(s)
  TLegend *legcL = new TLegend(0.1, 0.7, 0.4, 0.9);
  TLegend *legcR = new TLegend(0.6, 0.7, 0.9, 0.9);
  legcL->AddEntry((TObject*)0, "Incoming #vec{p_{#nu}} :", "");
  legcL->AddEntry(hz0, "Aligned with SANTA");
  legcL->AddEntry(hz1, "Isotropic");
  legcL->Draw();
  legcR->AddEntry(hf0, "#mu #approx -0.26^{o}   #sigma #approx 22.6^{o}", "l");
  legcR->AddEntry(hf1, "#mu #approx -0.96^{o}   #sigma #approx 37.5^{o}", "l");
  legcR->Draw();

  // subtract and draw / fit new
  cs->cd();
  TH1D *hsAll = new TH1D, *hs = new TH1D;
  hz0->Copy(*hs);
  hs->SetStats(kTRUE);
  hs->Add(hz1, -1);
  hs->Copy(*hsAll);
  hsAll->SetLineStyle(kDashed);
  TF1 *hsf = new TF1("hsf", "[0]+[1]*TMath::Gaus(x,[2],[3])", -90., 90.);
  hsf->SetParameters(0., TMath::Sqrt(hz1->GetEntries()), 0., 25.);
  hsf->SetLineColor(kRed);
  hsf->SetLineWidth(4);
  Int_t k, N = hs->GetNbinsX();
  for ( k=0; k<N; k++ ) {
    hs->SetBinContent( k, TMath::Max(hs->GetBinContent(k), 0.) );
  }
  TFitResultPtr hsFRP = hs->Fit(hsf, "SR");
  TFitResult *hsFR = hsFRP.Get();
  /* hs->Draw("same"); */
  hsf->Draw("same");
  hsAll->Draw("same");
  hs->GetYaxis()->SetRangeUser(hsAll->GetMinimum(), 1.2*hs->GetMaximum());
  hs->SetName("h_subtracted");

  // save
  /* f0->Close(); */
  /* f1->Close(); */
  cc->Write("c_comp");
  cs->Write("c_sub");
  hz0->Write("hz0");
  hz1->Write("hz1");
  hf0->Write("hf0");
  hf1->Write("hf1");
  hs->Write("hs");
  hsf->Write("hsf");
  hsFR->Write("hsFR");
  hsAll->Write("hsAll");
  f->Close();

  // all pau!   )

}
