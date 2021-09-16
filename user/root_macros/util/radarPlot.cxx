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
h_out->SetLineWidth(3.);
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
h_scale->SetLineColor(kGray);
h_scale->SetLineWidth(1.);
for ( k=0; k<=N; k++ ) {
  for ( j=0; j<=nScaleRings; j++ ) h_scale->SetBinContent( k, j, j*scaleStep );
}

// draw radar plot
if (kNewCanvas) TCanvas *can_out = new TCanvas(newCanName.Data(), newCanTitle.Data());
h_out->Draw("cyllego");
TView3D *view = new TView3D;
view->RotateView(180.001, 180.001);
h_scale->Draw("samecyllego");
h_out->Draw(hopt);

// annotations
TLegend *l_radar = new TLegend(.01, .01, .3, .1);
TString gridRings, gridMax;
gridRings.Form("Grid Scale: %d entries / ring", scaleStep);
gridMax.Form("Grid Maximum = %d entries", scaleMax);
l_radar->AddEntry( h_scale, gridRings.Data() );
l_radar->AddEntry( h_scale, gridMax.Data() );
l_radar->Draw();

// all pau!   )
return h_out;
}

// overload for other TH1 types
TH2D* radarPlot( TH1F *h_in, Option_t *ho = "cyllego", const Bool_t kNewCanvas = kTRUE  ) { radarPlot( (TH1D*)h_in, ho ); }
TH2D* radarPlot( TH1I *h_in, Option_t *ho = "cyllego", const Bool_t kNewCanvas = kTRUE  ) { radarPlot( (TH1D*)h_in, ho ); }
