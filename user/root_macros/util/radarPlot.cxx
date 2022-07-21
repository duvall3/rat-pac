// radarPlot -- simple macro to redraw any 1-D histogram as a radar plot
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

#include "TMath.h"

TH2D* radarPlot( TH1D *h_in, Option_t *ho = "cyllego", const Bool_t kNewCanvas = kTRUE ) {

// force proportional scaling
gStyle->SetHistMinimumZero(kTRUE);

// init
TString hoptString = TString::Format("same%s", ho);
Option_t *hopt(hoptString);
Int_t k = 0, N = h_in->GetNbinsX();
Double_t xlow = h_in->GetBinLowEdge(0);
Double_t xup = h_in->GetBinLowEdge(N) + h_in->GetBinWidth(N);
TString newName(h_in->GetName()), newTitle(h_in->GetTitle()), newCanName, newCanTitle;
newName.Append("_radar");
newCanName.Form("can_%s", newName.Data());
newCanTitle = newName;

// copy bin contents into new histogram
TH2D *h_out = new TH2D( newName.Data(), newTitle.Data(), N, xlow, xup, 1, 0., 1. );
h_out->SetLineColor(h_in->GetLineColor());
h_out->SetLineWidth(5.);
h_out->SetStats(0);
for ( k=0; k<=N; k++ ) {
  h_out->SetBinContent( k, 1, h_in->GetBinContent(k) ); //KEEPME
}

// set up scale
Double_t hinMax = h_in->GetMaximum();
Int_t pow10 = TMath::Nint(TMath::Ceil(TMath::Log10(hinMax)));
Int_t scaleMax = TMath::Nint(hinMax);
Int_t j = 0, nScaleRings = 5, scaleStep = TMath::Nint(1.*hinMax/nScaleRings);
//Int_t scaleMax = 10**(pow10);
//Int_t j = 0, nScaleRings = 5, scaleStep = TMath::Nint(TMath::Ceil(scaleMax/nScaleRings));
TH2D *h_scale = new TH2D( "h_scale", "scale for radar plot", N, xlow, xup, nScaleRings, 0., scaleMax );
h_scale->SetLineColor(16);
h_scale->SetLineWidth(2.);
h_scale->SetStats(0);
for ( k=0; k<=N; k++ ) {
  for ( j=0; j<=nScaleRings; j++ ) h_scale->SetBinContent( k, j, (nScaleRings-j)*scaleStep );
}

// scale "axis indicators"
Double_t markerR = 1.;
TPolyMarker3D *p0 = new TPolyMarker3D(1);
p0->SetMarkerColor(kBlack);
p0->SetMarkerSize(2.5);
TPolyMarker3D *p90 = p0->Clone("p90");
TPolyMarker3D *p180 = p0->Clone("p180");
TPolyMarker3D *p270 = p0->Clone("p270");
p0->SetMarkerStyle(8);
p90->SetMarkerStyle(22);
p180->SetMarkerStyle(21);
p270->SetMarkerStyle(23);
p0->SetPoint(0, -markerR, 0., 0.);
p90->SetPoint(0, 0., -markerR, 0.);
p180->SetPoint(0, markerR, 0., 0.);
p270->SetPoint(0, 0., markerR, 0.);

// draw radar plot
if (kNewCanvas) TCanvas *can_out = new TCanvas(newCanName.Data(), newCanTitle.Data());
gPad->SetLogx(kFALSE);
gPad->SetLogy(kFALSE);
h_in->Draw("A");
TView3D *view = new TView3D;
view->RotateView(.001, .001);
h_scale->Draw("samecyllego");
h_out->Draw(hopt);

// annotations

// radial legend
//TLegend *l_radial = new TLegend(.01, .01, .3, .1);
TLegend *l_radial = new TLegend(.05, .01, .65, .1);
l_radial->SetName("leg_radial");
l_radial->SetNColumns(2);
l_radial->SetTextSize(.024);
TString gridRings, gridMax;
//gridRings.Form("Grid Scale: %d entries / ring", scaleStep);
//gridMax.Form("Grid Maximum = %d entries", scaleMax);
gridRings.Form( "Grid Scale = %d entries / ring     Grid Maximum = %d entries", scaleStep, scaleMax );
l_radial->AddEntry( h_scale, gridRings.Data() );
//TLegendEntry *le = l_radial->GetEntry();
//le->SetLineColor(TColor::GetColorDark(kGray));
//l_radial->AddEntry( h_scale, gridMax.Data() );
l_radial->Draw();

// angular legend
TLegend *l_angular = new TLegend(.65, .01, .95, .1);
l_angular->SetName("leg_angular");
l_angular->SetNColumns(2);
//Double_t xdelta = xup - xlow;
//TString angMark0, angMark90, angMark180, angMark270;
//angMark0.Form(" = %.f", xlow);
//angMark90.Form(" = %.f", xlow + xdelta/4);
//angMark180.Form(" = %.f", xlow + 2*xdelta/4);
//angMark270.Form(" = %.f", xlow + 3*xdelta/4);
TString angMark0("0^{o}"), angMark90("+90^{o}"), angMark180("#pm180^{o}"), angMark270("-90^{o}");
l_angular->AddEntry(p0, angMark0.Data(), "P");
l_angular->AddEntry(p90, angMark90.Data(), "P");
l_angular->AddEntry(p180, angMark180.Data(), "P");
l_angular->AddEntry(p270, angMark270.Data(), "P");
l_angular->Draw();

// paint over the weird extra lines ROOT keeps wanting to draw
TPave *boxL = new TPave(0., 0.49, 0.099, 0.51, 0., "blNDC");
TPave *boxR = new TPave(0.901, 0.49, 1., 0.51, 0., "blNDC");
boxL->SetFillColor(0);
boxR->SetFillColor(0);
boxL->Draw();
boxR->Draw();

// draw angular markers
p0->Draw();
p90->Draw();
p180->Draw();
p270->Draw();

// all pau!   )
return h_out;
}

// overload for other TH1 types
TH2D* radarPlot( TH1F *h_in, Option_t *ho = "cyllego", const Bool_t kNewCanvas = kTRUE  ) { return radarPlot( (TH1D*)h_in, ho ); }
TH2D* radarPlot( TH1I *h_in, Option_t *ho = "cyllego", const Bool_t kNewCanvas = kTRUE  ) { return radarPlot( (TH1D*)h_in, ho ); }
