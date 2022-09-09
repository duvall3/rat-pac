// refMatchDemo -- macro for generating a set of image files (PNG)
//   that illustrate our KS-test reference-matching algorithm
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
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

#pragma <TDuvallUtils.cxx>

void refMatchDemo( const char* filename, Bool_t isMCdata = kFALSE, const char* referenceDir = "../.." ) {


//// init

// object names
TString treeName, branchName;

if (isMCdata) {
  treeName.Form("T_ncap");
  branchName.Form("phi");
} else {
  treeName.Form("T_ts");
  branchName.Form("phiSeg");
}

// batch mode
Bool_t origBatch = gROOT->IsBatch();
if (! origBatch) gROOT->SetBatch(kTRUE);

// output image prep
TString outDirName(filename);
outDirName.ReplaceAll("\.root", "_Demo");
gSystem->mkdir(outDirName.Data());


// test/experimental datafile
TFile *fT = TFile::Open(filename);
TCanvas *c = (TCanvas*)gDirectory->Get("c_RefMatch");
TVectorD *v = (TVectorD*)gDirectory->Get("resultsVector"), V = *v;
TMatrixD *m = (TMatrixD*)gDirectory->Get("resultsMatrix"), M = *m;

// get graphics objects and attributes
c->Draw();
TVirtualPad *p1 = c->GetPad(1), *p2 = c->GetPad(2);
TVirtualPad *p2_1 = p2->GetPad(1), *p2_2 = p2->GetPad(2);
// p1
p1->cd();
TPaveText *hTitle = (TPaveText*)gPad->GetPrimitive("title");
TH1D *ht = (TH1D*)gPad->GetPrimitive("h_TestSample");
TH1D *hr = (TH1D*)gPad->GetPrimitive("hRef");
TLegend *leg = (TLegend*)gPad->GetPrimitive("TPave");
Color_t htColor = ht->GetLineColor(), refColor = hr->GetLineColor();
Color_t htFill = ht->GetFillColor(), refFill = hr->GetFillColor();
Double_t lineWidth = ht->GetLineWidth();
// p2_1
p2_1->cd();
TPaveText *gTitle = (TPaveText*)gPad->GetPrimitive("title");
TGraph *g = (TGraph*)gPad->GetPrimitive("Graph");
Color_t gColor = g->GetLineColor();
Style_t gMarker = g->GetMarkerStyle();
Size_t gSize = g->GetMarkerSize();
// p2_2
p2_2->cd();
TGraph *g2 = (TGraph*)gPad->GetPrimitive("g2");
// get various data parameters
Double_t htMax = ht->GetMaximum();
Double_t *x = g->GetX(), *y = g->GetY(), *x2 = g2->GetX(), *y2 = g2->GetY();


//// cycle through reference distributions

// clear the current reference histogram
hRef->SetLineColor(0);
hRef->SetFillColor(0);

// adjust the legend accordingly
TLegendEntry *legEntry = (TLegendEntry*)leg->GetListOfPrimitives()->At(1);
legEntry->SetLabel("Reference Distribution (scaled)");

// get list of reference files
TString refFileName;
/* const char* origDir = gSystem->WorkingDirectory(); */
TString origDir(gSystem->WorkingDirectory());
gSystem->cd(referenceDir);
TList *refList = TDuvallUtils::ListFiles(); // lists only ROOT files by default
gSystem->cd(origDir.Data());
TSystemFile *sf;
TIter i(refList);

// MAIN
Int_t kFile(0);
TFile *fRef;
TH1D *hRefD;
Double_t hRefDMax;
TString outImgName;
for ( i = refList->begin(); i != refList->end(); ++i ) {

  // reference file and plot
  sf = (TSystemFile*)*i;
  /* sf = (TSystemFile*)refList->At(kFile+0); //debug */
  refFileName.Form("%s/%s", sf->GetTitle(), sf->GetName());
  fRef = TFile::Open(refFileName.Data());
  fRef->cd();
  hRefD = (TH1D*)gDirectory->Get( TString::Format("h_%s", branchName.Data()) );
  hRefDMax = hRefD->GetMaximum();
  hRefD->Scale( htMax / hRefDMax );
  hRefD->SetLineWidth(lineWidth);
  hRefD->SetLineColor(refColor);
  hRefD->SetFillColorAlpha(refFill, 0.3);
  p1->cd();
  hRefD->Draw("same");
  legEntry->SetObject(hRefD); // fix legend entry
  ht->Draw("same"); // redraw experimental plot

  // highlight marker(s) in lower graph(s)
  // TODO

  // save current canvas
  outImgName.Form( "%s/%s/%03i.png", origDir.Data(), outDirName.Data(), kFile );
  c->Print( outImgName.Data() );

  // file finished
  fRef->Close();
  kFile++;

}


//// finish up

// close source file
fT->Close();

// reset batch mode
gROOT->SetBatch(origBatch);


// all pau!   )
return;
}
