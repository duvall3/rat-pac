// exportRadars -- extract the radar-results plots produced by neutronCapturesFinal.cxx
//   and save in a handful of formats

// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 12/2023 ~ //

void exportRadars( const char* detector ) {

  // batch check
  Bool_t kBatchOrig(gROOT->IsBatch());

  // init
  TString detectorName(detector);//, fileName;
  TList *sfList = TDuvallUtils::ListFiles(".*_results\.root");
  detectorName.ToUpper();
  TSystemFile *sf = (TSystemFile*)(TDuvallUtils::FindMatchingObjects(sfList, detectorName.Data())->At(0));
  TFile *f = TFile::Open(sf->GetName());
  TString savename;
  savename.Form("Radar/%s/%s", detector, detector);

  // get plot and export
  /* if (! kBatchOrig) gROOT->SetBatch(kTRUE); */
  TH1D *h = (TH1D*)gDirectory->Get("h_phi");
  TCanvas *c = TDuvallUtils::RadarPlot(h, "cyllego", kTRUE);
  c->Print(savename+TString(".png").Data());
  c->Print(savename+TString(".svg").Data());
  c->Print(savename+TString(".eps").Data());
  c->SaveAs(savename+TString(".C").Data());
  c->Close();
  cerr << detector << "\t" << detectorName.Data() << "\t" << savename.Data() << "\t" << f << "\t" << gFile->GetName() << endl; //debug
  f->Close();

  // done
  gROOT->SetBatch(kBatchOrig);
  /* return; */
}
