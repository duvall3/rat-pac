// scatteringPlots -- macro to create plots from results of scatteringPositions.cxx
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2022 ~ //

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

TObjArray* scatteringPlots( TTree* T_sp = 0 ) {

// input check
if (T_sp == 0) T_sp = (TTree*)gDirectory->FindObjectAny("T_sp");
if (T_sp == 0) {
  gROOT->Error("scatteringPlots", "No input TTree* T_sp given or found.");
  return 0;
}

// init
TVector3 *x1, *x5, *x10, *x20;
T_sp->SetBranchAddress("x1", &x1);
T_sp->SetBranchAddress("x5", &x5);
T_sp->SetBranchAddress("x10", &x10);
T_sp->SetBranchAddress("x20", &x20);
Int_t kCan;
TCanvas *can;

// hist init
Double_t xlim(150.), ylim(150.), zlim(150.);
Int_t xNumBins(100), yNumBins(100), zNumBins(100);
/* Int_t xNumBins(30), yNumBins(30), zNumBins(30); */
/* TH3D *hx1 = new TH3D("hx1", "R at 1 Scatter", xNumBins, -xlim, xlim, yNumBins, -ylim, ylim, zNumBins, -zlim, zlim); */
TH3D *hx1 = new TH3D("hx1", "R at 2nd Scatter", xNumBins, -xlim, xlim, yNumBins, -ylim, ylim, zNumBins, -zlim, zlim);
TH3D *hx5 = new TH3D("hx5", "R at 5th Scatter", xNumBins, -xlim, xlim, yNumBins, -ylim, ylim, zNumBins, -zlim, zlim);
TH3D *hx10 = new TH3D("hx10", "R at 10th Scatter", xNumBins, -xlim, xlim, yNumBins, -ylim, ylim, zNumBins, -zlim, zlim);
TH3D *hx20 = new TH3D("hx20", "R at 20th Scatter", xNumBins, -xlim, xlim, yNumBins, -ylim, ylim, zNumBins, -zlim, zlim);
/* TH1D *hcp1 = new TH1D("hcp1", "Cos[#psi] at 1 Scatter", 10, -1.01, 1.01); */
TH1D *hcp1 = new TH1D("hcp1", "Cos[#psi] at 2nd Scatter", 10, -1.01, 1.01);
TH1D *hcp5 = new TH1D("hcp5", "Cos[#psi] at 5th Scatter", 10, -1.01, 1.01);
TH1D *hcp10 = new TH1D("hcp10", "Cos[#psi] at 10th Scatter", 10, -1.01, 1.01);
TH1D *hcp20 = new TH1D("hcp20", "Cos[#psi] at 20th Scatter", 10, -1.01, 1.01);

// lists
TList *hxL = new TList, *hcpL = new TList;
TList *hL = new TList, *canL = new TList;
hxL->Add(hx1);
hxL->Add(hx5);
hxL->Add(hx10);
hxL->Add(hx20);
hcpL->Add(hcp1);
hcpL->Add(hcp5);
hcpL->Add(hcp10);
hcpL->Add(hcp20);
hL->Add(hxL);
hL->Add(hcpL);

// graphical settings
Double_t cpLineWidth = 5.;
/* const enum EColor posBGColor = kGray; */
/* const enum EColor posBGColor = kAzure; */
/* const enum EColor posBGColor = TColor::GetColorDark(kGray); */
/* const enum EColor posBGColor = TColor::GetColorDark(kBlue); */
/* const enum EColor posBGColor = TColor::GetColorDark(kAzure); */
const enum EColor posBGColor = kBlue + 4;
/* const enum EColor cpBGColor = kGray; */
/* const enum EColor cpBGColor = kWhite; */
const enum EColor cpBGColor = posBGColor;
/* for ( Int_t j=0; j<4; j++ ) ((TH3D*)hxL->At(j))->SetMarkerStyle(6); */
/* const enum EColor cpBGColor = TColor::GetColorDark(kGray); */
((TH3D*)hxL->At(0))->SetFillColorAlpha(kGreen, 0.5);
((TH3D*)hxL->At(1))->SetFillColorAlpha(kYellow, 0.5);
((TH3D*)hxL->At(2))->SetFillColorAlpha(kOrange, 0.5);
((TH3D*)hxL->At(3))->SetFillColorAlpha(kRed, 0.5);
((TH3D*)hxL->At(0))->SetMarkerColor(kGreen);
((TH3D*)hxL->At(1))->SetMarkerColor(kYellow);
((TH3D*)hxL->At(2))->SetMarkerColor(kOrange);
((TH3D*)hxL->At(3))->SetMarkerColor(TColor::GetColorBright(kRed));
((TH1D*)hcpL->At(0))->SetLineColor(kGreen);
((TH1D*)hcpL->At(1))->SetLineColor(kYellow);
((TH1D*)hcpL->At(2))->SetLineColor(kOrange);
((TH1D*)hcpL->At(3))->SetLineColor(kRed);

// event loop
Long64_t k(0), N = T_sp->GetEntries();
for ( k=0; k<N; k++ ) {
  T_sp->GetEntry(k);
  hx1->Fill(x1->X(), x1->Y(), x1->Z());
  hx5->Fill(x5->X(), x5->Y(), x5->Z());
  hx10->Fill(x10->X(), x10->Y(), x10->Z());
  hx20->Fill(x20->X(), x20->Y(), x20->Z());
  hcp1->Fill(-x1->Unit().X());
  hcp5->Fill(-x5->Unit().X());
  hcp10->Fill(-x10->Unit().X());
  hcp20->Fill(-x20->Unit().X());
}

// origin marker
TH3D *hOrigin = new TH3D("hOrigin", "Origin Marker", xNumBins, -xlim, xlim, yNumBins, -ylim, ylim, zNumBins, -zlim, zlim);
hOrigin->SetMarkerColor(kMagenta);
hOrigin->SetMarkerStyle(8);
/* hOrigin->SetMarkerSize(2.); */
hOrigin->Fill(0., 0., 0.);
TH2D *hOrigin_xy = hOrigin->Project3D("xy");
hOrigin_xy->SetMarkerSize(1.5);

// draw R plots
TCanvas *cR = new TCanvas("cR", "Position Plots");
canL->Add(cR);
cR->SetFillColor(posBGColor);
cR->Divide(2,2);
for ( kCan=1; kCan<5; kCan++ ) {
  cR->GetPad(kCan)->cd();
  gPad->SetFillColor(posBGColor);
  gPad->SetFrameFillColor(posBGColor);
  gPad->SetFrameLineColor(kWhite);
  /* hxL->At(kCan-1)->Draw(); */
  /* hxL->At(kCan-1)->Draw("glisoFbBb"); */
  /* hxL->At(kCan-1)->Draw("glbox1FbBb"); */
  ((TH3D*)hxL->At(kCan-1))->Project3D("xy")->Draw();
  hOrigin_xy->Draw("same");
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->SetTitle(((TH3D*)hxL->At(kCan-1))->GetTitle());
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->SetXTitle("y (mm)");
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->SetYTitle("x (mm)");
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->SetAxisColor(kWhite, "xy");
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->GetXaxis()->SetTitleColor(kWhite);
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->GetYaxis()->SetTitleColor(kWhite);
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->GetXaxis()->SetLabelColor(kWhite);
  ((TH2D*)gPad->GetListOfPrimitives()->At(0))->GetYaxis()->SetLabelColor(kWhite);
}
cR->SetWindowPosition(150, 100);

// draw cp plots
Double_t hcpMax = ((TH1D*)hcpL->At(0))->GetMaximum();
TCanvas *cC = new TCanvas("cC", "Cos[#psi] Plots");
canL->Add(cC);
cC->Divide(2,2);
cC->SetFillColor(cpBGColor);
for ( kCan=1; kCan<5; kCan++ ) {
  cC->GetPad(kCan)->cd();
  gPad->SetFillColor(cpBGColor);
  gPad->SetFrameFillColor(cpBGColor);
  gPad->SetFrameLineColor(kWhite);
  ((TH1D*)hcpL->At(kCan-1))->SetLineWidth(cpLineWidth);
  hcpL->At(kCan-1)->Draw();
  ((TH1D*)hcpL->At(kCan-1))->SetAxisRange(0., 1.2*hcpMax, "Y");
  ((TH1D*)gPad->GetListOfPrimitives()->At(0))->SetAxisColor(kWhite, "xy");
  ((TH1D*)gPad->GetListOfPrimitives()->At(0))->GetXaxis()->SetTitleColor(kWhite);
  ((TH1D*)gPad->GetListOfPrimitives()->At(0))->GetYaxis()->SetTitleColor(kWhite);
  ((TH1D*)gPad->GetListOfPrimitives()->At(0))->GetXaxis()->SetLabelColor(kWhite);
  ((TH1D*)gPad->GetListOfPrimitives()->At(0))->GetYaxis()->SetLabelColor(kWhite);
}

// results
TObjArray *resultHandles = new TObjArray;
resultHandles->Add(hL);
resultHandles->Add(canL);

// all pau!   )
return resultHandles;
}
