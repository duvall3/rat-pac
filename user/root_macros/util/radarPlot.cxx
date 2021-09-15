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

TH2D* radarPlot( TH1D *h_in, Option_t *ho = "cyllego" ) {

// init
Int_t k = 0, N = h_in->GetNbinsX();
Double_t xlow = h_in->GetBinLowEdge(0);
Double_t xup = h_in->GetBinLowEdge(N) + h_in->GetBinWidth(N);
TString newName(h_in->GetName()), newTitle(h_in->GetTitle()), newCanName, newCanTitle;
newName.Append("_radar");
newCanName.Form("can_%s", newName.Data());
//newCanTitle.Form("TCanvas for %s", newName.Data());
newCanTitle = newName;

// copy bin contents into new histogram
TH2D *h_out = new TH2D( newName.Data(), newTitle.Data(), N, xlow, xup, 1, 0., 1.01 );
for ( k=0; k<N; k++ ) {
  h_out->SetBinContent( k, 1, h_in->GetBinContent(k) );
}

// draw radar plot
TCanvas *can_out = new TCanvas(newCanName.Data(), newCanTitle.Data());
TView3D *view = new TView3D;
h_out->Draw(ho);
view->RotateView(90., 0.001); // tiny offset in theta to draw full circle at entries==0

// all pau!   )
return h_out;
}

// overload for other TH1 types
// TH2F* radarPlot( TH1F *h_in ) {
