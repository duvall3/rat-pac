// tradRes -- EWISotT
// ~ Mark J. Duvall ~ duvall3@github.com ~ 01/2023 ~ //

void tradRes() {

// init
TList *l = TDuvallUtils::ListFiles(".*_ncap_res\.root");
TIter i(l);
TFile *f = TFile::Open("tradRes.root", "recreate");
TFile *ff;
TSystemFile *sf;
TFitResult *phiFR;
Int_t PHI_TRUE;

// prepare tree
Double_t phi, phiTrue, phiDiff;
TTree *T = new TTree("T", "trad-style angular determination");
T->Branch("phi", &phi);
T->Branch("phiTrue", &phiTrue);
T->Branch("phiDiff", &phiDiff);

// main
for ( i=l->begin(); i!=l->end(); ++i ) {
  sf = (TSystemFile*)*i;
  ff = TFile::Open(sf->GetName());
  phiFR = (TFitResult*)gDirectory->Get("phiFR");
  phi = phiFR->GetParams()[2];
  phiTrue = (Double_t)PHI_TRUE;
  phiDiff = phi - phiTrue;
  T->Fill();
  ff->Close();
  PHI_TRUE++;
}

// save
f->cd();
T->Write("T");
f->Close();

// all pau!   )
return;
}
