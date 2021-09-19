// drawAllCosPsi -- macro to draw the cos[psi] results for all the specified *_reults.root files in a directory
// -- written for use with duvallAnalyze.cxx and associated software
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

//TList* drawAllCosPsi( const char* directoryName = "" ) {
TList* drawAllCosPsi() {

//// arg check
//TString dirName;
//if (directoryName=="") {
//  dirName = gSystem->pwd();
//} else {
//  dirName = directoryName;
//}

// filesystem setup
const char* RATROOT = gSystem->ExpandPathName("$RATROOT");
TString resultsDir(RATROOT);
resultsDir.Append("/data/COMPMAIN_RESULTS/ROOT_files");
gSystem->cd(resultsDir.Data());

// init
TFile *f0 = TFile::Open("COMPMAIN_CHOOZ_10k_results.root"), *f1 = TFile::Open("COMPMAIN_NULAT_10K_results.root");
TFile *f2 = TFile::Open("COMPMAIN_NULAT5_10K_results.root"), *f3 = TFile::Open("COMPMAIN_SANTA_10K_results.root");
TFile *f4 = TFile::Open("COMPMAIN_SANDD_10K_results.root"), *f5 = TFile::Open("COMPMAIN_CHECKERBOARD-2D_10K_results.root");
TList *fileList = new TList, *hList = new TList;
fileList->Add(f0);
fileList->Add(f1);
fileList->Add(f2);
fileList->Add(f3);
fileList->Add(f4);
fileList->Add(f5);
TIter iFile(fileList);
TFile *f;
TH1D *h;
TLegend *leg = new TLegend(.1, .60, .40, .90);
Int_t k=0, nFiles=fileList->GetEntries();
Color_t colors[6] = {4, 3, 7, 2, 6, 11};
TObjString d0("CHOOZ"), d1("NuLat3"), d2("NuLat5"), d3("SANTA"), d4("SANDD"), d5("2D Chkbd.");
TObjArray *detectorNames = new TObjArray;
detectorNames->Add(&d0);
detectorNames->Add(&d1);
detectorNames->Add(&d2);
detectorNames->Add(&d3);
detectorNames->Add(&d4);
detectorNames->Add(&d5);
TObjString *dName = new TObjString;
TString dLabel;

// file loop
for ( iFile=fileList->begin(); iFile!=fileList->end(); ++iFile ) {
  f = (TFile*)*iFile;
  f->cd();
  h = h_cos_psi;
  h->SetLineColor(colors[k]);
  dName = (TObjString*)detectorNames->At(k);
  dLabel = dName->GetString();
  dLabel.Append( TString::Format("  %.3f", h->GetMean()) );
  dLabel.ReplaceAll("0.", ".");
  leg->AddEntry(h, dLabel.Data());
  hList->Add(h);
  k++;
  dLabel.Clear();
} // end file loop

// draw
TCanvas *can_hcp = new TCanvas("can_hcp", "All Cos[psi] COMPMAIN Results");
can_hcp->cd();
TIter iH(hList);
h = (TH1D*)hList->At(0);
h->SetStats(0);
h->SetTitle("All Cos[#psi] Distributions");
h->Draw();
TVectorD binsMax(nFiles);
k=0;
for ( iH=hList->begin(); iH!=hList->end(); ++iH ) {
  h = (TH1D*)*iH;
  h->SetStats(0);
  h->Draw("same");
  binsMax[k] = h->GetMaximum();
  k++;
}
Double_t allMax = binsMax.Max();
h = (TH1D*)hList->At(0);
h->SetAxisRange(0., allMax, "y");
leg->Draw();

// user does something
// ...

//for ( iFile=fileList->begin(); iFile!=fileList->end(); ++i ) {
//  f = (TFile*)*iFile;
//  f->Close();
//}

// all pau!   )
return hList;
}
