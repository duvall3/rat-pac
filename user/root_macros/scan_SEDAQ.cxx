// scan_SEDAQ.cxx -- multidimensional scan across various values for the SONGS IBD trigger
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //
// Usage: Load BOTH this macro AND  SEDAQ.cxx;
//     "filename" should be a "<DATARUN>_T.root" file (see SEDAQ documentation/comments)


TTree* scan_SEDAQ(const char* filename) {


// init
// current vars: pl = prompt low-energy threshold, dl = delayed low-energy threshold
// result: ibds = resulting number of IBD candidates passing the trigger cuts
TString FileName = filename;
TString basename = FileName(0,FileName.Index("_T.root"));
TString resname = basename+"_results.root";
Double_t pl, dl, ibds;
Int_t k,l;

// tree containing scan values
TTree* T3 = new TTree("T3","IBD Candidates at Prompt E Cutoffs");
T3->Branch("pl",&pl);
T3->Branch("dl",&dl);
T3->Branch("ibds",&ibds);

// need TFile pointer for SEDAQ.cxx
TFile* f;

// MAIN: scan loop
// ** Note that SEDAQ is run on "filename" and T2 is pulled from "resname" **
pl=2..;
for (( k=0; k<20; k++ )) {
  dl=3.;
  for (( l=0; l<20; l++ )) {
    SEDAQ(filename,pl,dl);
    f = TFile::Open(resname);
    ibds = (Double_t)T2->GetEntries();
    T3->Fill();
    dl = dl + .05;
  }
  pl = pl + .05;
}

// create histogram
TH2D* h = new TH2D("h", "IBD Candidates Across Low-E Thresholds",21,1.99,3.01,21,2.99,4.01);

// fill histogram
for (( k=0; k<T3->GetEntries(); k++ )) {
  T3->GetEntry(k);
  h->Fill( pl, dl, ibds );
}

// draw histogram
TCanvas* c_new = new TCanvas("c_new","c_new");
c_new->SetLogy(0);
h->Draw("surf1");
h->SetTitle("IBD Candidates Across Low-E Thresholds");
h->GetXaxis()->SetTitle("Prompt Cutoff (MeV)");
h->GetXaxis()->SetTitleOffset(1.7);
h->GetYaxis()->SetTitle("Delayed Cutoff (MeV)");
h->GetYaxis()->SetTitleOffset(1.7);
h->GetZaxis()->SetTitle("Entries");
h->GetZaxis()->SetTitleOffset(1.7);
c_new->SetPhi(250.);
c_new->SetTheta(20.);


// all pau!
return T3;
}

