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

TList* drawAllCosPsi( const Bool_t kNormalized = kFALSE, const Bool_t kInteractive = kFALSE ) {

//// INIT

// graphics-related settings
gStyle->SetCanvasPreferGL(kTRUE);
if (! kInteractive) gROOT->SetBatch(kTRUE);

// filesystem setup
const char* RATROOT = gSystem->ExpandPathName("$RATROOT");
TString resultsDir(RATROOT);
resultsDir.Append("/data/COMPMAIN_RESULTS/ROOT_files");
gSystem->cd(resultsDir.Data());
ofstream summaryFile = "summary.txt";

// defint decent legend coordinates
Double_t legxy[4] = {.10, .60, .40, .90};

// settings for normalization
if (kNormalized) {
  const char *savename = "cos_psi_all_norm.png";
} else {
  const char *savename = "cos_psi_all.png";
}

// file and hist operations
TFile *f;
TH1D *h;
TFile *f0 = TFile::Open("COMPMAIN_CHOOZ_10k_results.root");
TFile *f1 = TFile::Open("COMPMAIN_NULAT_10K_results.root");
TFile *f2 = TFile::Open("COMPMAIN_NULAT5_10K_results.root");
TFile *f3 = TFile::Open("COMPMAIN_CHECKERBOARD-3D_10K_results.root");
TFile *f4 = TFile::Open("COMPMAIN_SANTA_10K_results.root");
TFile *f5 = TFile::Open("COMPMAIN_SANDD_10K_results.root");
TFile *f6 = TFile::Open("COMPMAIN_CHECKERBOARD-2D_10K_results.root");
TFile *f7 = TFile::Open("COMPMAIN_IDEAL_10K_results.root");
TList *fileList = new TList, *hList = new TList;
fileList->Add(f0);
fileList->Add(f1);
fileList->Add(f2);
fileList->Add(f3);
fileList->Add(f4);
fileList->Add(f5);
fileList->Add(f6);
fileList->Add(f7);
TIter iFile(fileList);

// annotations
TLegend *leg = new TLegend(legxy[0], legxy[1], legxy[2], legxy[3]);
Int_t k=0, nFiles=fileList->GetEntries();
//Color_t colors[8] = {4, 3, 7, 11, 2, 6, 5, 1}; // decent colors if using Fill
Color_t colors[8] = {4, 3, 7, 11, 2, 6, 9, 1}; // decent colors if not using Fill
// labeling
TObjString d0("CHOOZ"), d1("NuLat 3"), d2("NuLat 5"), d3("3D Chk."), d4("SANTA"), d5("SANDD"), d6("2D Chk."), d7("LN3 LIMIT");
TObjArray *detectorNames = new TObjArray;
detectorNames->Add(&d0);
detectorNames->Add(&d1);
detectorNames->Add(&d2);
detectorNames->Add(&d3);
detectorNames->Add(&d4);
detectorNames->Add(&d5);
detectorNames->Add(&d6);
detectorNames->Add(&d7);
TObjString *dName = new TObjString;
TString dLabel;
// mean markers
Double_t ylow, yup, yMarker, hMean, kMarkerOffset(0.003);
TLine *meanLine = new TLine;
TMarker *meanMarker = new TMarker;

//// MAIN

// file loop
TString labSANTA, dLabelLower;
for ( iFile=fileList->begin(); iFile!=fileList->end(); ++iFile ) {
  f = (TFile*)*iFile;
  f->cd();
  h = h_cos_psi;
  h->SetLineWidth(4.);
//h->SetLineColor(colors[k]);
  h->SetLineColor(TColor::GetColorTransparent(colors[k], 0.50));
//h->SetFillColor(TColor::GetColorTransparent(colors[k], 0.15));
//h->SetMarkerStyle(k+20);
//h->SetMarkerColor(colors[k]);
  dName = (TObjString*)detectorNames->At(k);
  dLabel = dName->GetString();
  dLabelLower = dLabel;
  dLabelLower.ToLower();
  dLabel.Append( TString::Format("  %.3f", h->GetMean()) );
  dLabel.ReplaceAll("0.", ".");
//if ( dLabel.Contains("NuLat 3") ) dLabel.Append(" *");
//if ( dLabel.Contains("SANDD") || dLabel.Contains("2D Chk.") ) dLabel.Append(" *");
//if ( dLabelLower.Contains("lim") ) dLabel.Append(" **");
  k++;
  hList->Add(h);
  leg->AddEntry(h, dLabel.Data());
  dLabel.Clear();
} // end file loop

// hist / legend loop
TString canTitle = "All Cos[psi] COMPMAIN Results";
if (kNormalized) canTitle.Append(" (Normalized)");
TCanvas *can_hcp = new TCanvas("can_hcp", canTitle.Data());
can_hcp->cd();
TIter iH(hList);
h = (TH1D*)hList->At(0);
h->SetStats(0);
TString hTitle = "All Cos[#psi] Distributions";
Double_t N, cp, cpN;
TString NString, cpString, cpNString;
h->Draw();
if (kNormalized) {
  hTitle.Append(" (Normalized)");
  TText *ylabel = new TText(1.1, 0., "Relative Frequency (arb.)");
} else {
  TText *ylabel = new TText(1.1, 0., "Entries");
}
ylabel->SetTextSize(.035);
ylabel->SetTextAngle(-90);
ylabel->Draw("same");
h->SetTitle(hTitle.Data());
TVectorD binsMax(nFiles);
Double_t maxSANTA;
Int_t maxSANTAbin;
k=0;
for ( iH=hList->begin(); iH!=hList->end(); ++iH ) {
  h = (TH1D*)*iH;
  N = h->GetEntries();
  cp = h->GetMean();
  cpN = cp / N;
  h->SetStats(0);
  dName = (TObjString*)detectorNames->At(k);
  dLabel = dName->GetString();
  dLabelLower = dLabel;
  dLabelLower.ToLower();
  if ( dLabel.Contains("SANDD") || dLabel.Contains("2D Chk.") ) {
    h->SetLineStyle(5);
  } else if (dLabelLower.Contains("lim")) {
    h->SetLineStyle(kDashed);
  }
  if (kNormalized) {
    h->Scale(1/N);
    if (dLabel.Contains("SANTA")) {
      maxSANTA = h->GetMaximum();
      maxSANTAbin = h->GetMaximumBin();
      k++;
      h->Draw("same");
      continue;
    }
  }
  h->Draw("same");
  binsMax[k] = h->GetMaximum();
  // generate data-dependent portion of LaTeX table
  if ( ! kNormalized ) {
    NString.Form(" %d", (Long64_t)N);
    cpString.Form("\t& %.3f", cp);
    cpNString.Form("%1.2e", cpN);
//  cout << dLabel.Data() << "\t" << NString.Data() << "\t" << cpString.Data() << "\t" << cpNString.Data() << endl; //debug
    cpNString.Form("\t& %.2f", cpNString.Atof()*1.e6);
    if (dLabel.Contains("NuLat 3")) {
      NString.Append("^\\emph{\\dag}");
      cpString.Append("^\\emph{\\dag}");
      cpNString.Append("^\\emph{\\dag}");
    } else if ( (dLabel.Contains("SANDD")) || (dLabel.Contains("2D")) ) {
      NString.Append("~\t\t");
      cpString.Append("^\\emph{\\ddag}");
      cpNString.Append("^\\emph{\\ddag}");
    } else {
      NString.Append("~\t\t");
      cpString.Append("~\t");
      cpNString.Append("~");
    }
    if ( ! dLabelLower.Contains("lim") ) summaryFile << NString.Data() << cpString.Data() << cpNString.Data();
    if ( k < (hList->GetEntries()-1) ) summaryFile << "\\\\";
    summaryFile << endl;
  }
  k++;
}

// add summaryFile to .tex base
if ( ! kNormalized ) {
  TString shellCmd = TString::Format("paste $THESIS_MAIN/chapters/table_base.tex %s/summary.txt > $THESIS_MAIN/chapters/table.tex", resultsDir.Data()); //HC//
  gSystem->Exec(shellCmd.Data());
}

// draw completed legend
leg->Draw();

// axis limits
Double_t allMax = binsMax.Max();
h = (TH1D*)hList->At(0);
h->SetAxisRange(0., allMax, "y");
ylabel->SetY(allMax);

// mean indicators
Int_t nBins, markerBin;
ylow = 0;
yup = allMax;
meanLine->SetLineWidth(3.);
meanLine->SetLineStyle(kDotted);
yMarker = ylow + 0.9*(yup-ylow);
meanMarker->SetMarkerSize(1.7);
k = 0;
for ( iH = hList->begin(); iH!=hList->end(); ++iH ) {
  h = (TH1D*)(*iH);
  nBins = h->GetNbinsX();
  dName = (TObjString*)detectorNames->At(k);
  dLabel = dName->GetString();
  dLabelLower = dLabel;
  dLabelLower.ToLower();
  if ( dLabel.Contains("SANDD") || dLabel.Contains("2D Chk.") ) {
    meanLine->SetLineStyle(kDashDotted);
  } else if ( dLabelLower.Contains("lim") ) {
    meanLine->SetLineStyle(7);
//} else if ( dLabel.Contains("NuLat 5") ) {
//  meanLine->SetLineColor(colors[k]);
  } else {
    meanLine->SetLineStyle(kDotted);
  }
  hMean = h->GetMean();
  meanLine->SetLineColor(colors[k]);
  meanMarker->SetMarkerColor(colors[k]);
  meanLine->DrawLine(hMean, ylow, hMean, yup);
  meanMarker->SetMarkerStyle(k+20);
//meanMarker->DrawMarker(hMean, yMarker);
////if ( k < (nBins-1) ) {
////  markerBin = k + 1;
////} else {
////  markerBin = nBins;
////}
//  markerBin = nBins;
//  meanMarker->DrawMarker(h->GetBinCenter(markerBin), h->GetBinContent(markerBin));
  yMarker -= 0.02*(yup-ylow);
  k++;
}
can_hcp->RedrawAxis("y");

// SANTA indicator
Double_t santArrowX = h->GetBinCenter(maxSANTAbin);
if (kNormalized) {
  TLine *santaLine = new TLine(0.81, allMax, 0.81, 1.2*allMax);
//santaLine->SetLineStyle(kDashDotted);
  santaLine->SetLineStyle(kSolid);
  santaLine->SetLineColor(kRed);
  santaLine->SetLineWidth(3);
  santaLine->Draw();
  santaLine->DrawLine(1.01, allMax, 1.01, 1.2*allMax);
  TArrow * santArrow = new TArrow(santArrowX, 1.02*allMax, santArrowX, 1.10*allMax, 0.025);
  santArrow->SetLineColor(kRed);
  santArrow->SetLineWidth(3);
  santArrow->Draw();
  TString santArrowLabel;
  santArrowLabel.Form("to SANTA at %1.2f", maxSANTA);
  TText *santaLabel = new TText(0.23, 1.01*allMax, santArrowLabel.Data());
  santaLabel->SetTextColor(kRed);
  santaLabel->SetTextSize(.03);
  santaLabel->SetTextFont(52);
  santaLabel->Draw();
}

//// fin

// export and close
if (! kInteractive) {
  can_hcp->Print(savename);
  for ( iFile=fileList->begin(); iFile!=fileList->end(); ++iFile ) {
    f = (TFile*)*iFile;
    f->Close();
  }
}

// all pau!   )
return hList;
}
