// dumpHist -- simple macro to dump TH1 data as (x,y) pairs to stdout,
//   along with a rough ASCII representation of the graph
// -- Note: Developed for use with TH1D and TH1F only
// -- Example:
//    TH1D *h = new TH1D("h", "h", 12, -2.5, 2.5);
//    for (Int_t k=0; k<10000; k++ ) h->Fill( gRandom->Gaus() );
//    dumpHist(h);
//    -2.708e+00	56	| |
//    -2.292e+00	122	| |
//    -1.875e+00	285	|   |
//    -1.458e+00	587	|       |
//    -1.042e+00	937	|            |
//    -6.250e-01	1367	|                 |
//    -2.083e-01	1614	|                    |
//     2.083e-01	1629	|                    |
//     6.250e-01	1361	|                 |
//     1.042e+00	1016	|            |
//     1.458e+00	550	|       |
//     1.875e+00	276	|   |
//     2.292e+00	131	|  |
//     2.708e+00	69	| |
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ //
// ~ Updated 9/2021 ~ //

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

void dumpHist( TH1* h) {

Int_t asciiGradations = 20;
Int_t k = 0, j=0, nBins = h->GetNbinsX();
Double_t hMax = h->GetMaximum();
Double_t binScale = hMax/asciiGradations;
Double_t binCent;
Long64_t binCont;
TVectorD binConts(nBins);
Int_t binGrads;
for ( k=0; k<=(nBins+1); k++ ) {
  binCent = h->GetBinCenter(k);
  binCont = (Long64_t)h->GetBinContent(k);
  if (binCent>=0) cout << " ";
  printf("%1.3e\t%d\t|", binCent, binCont);
  binGrads = TMath::Nint(binCont/binScale);
  for ( j=0; j<binGrads; j++ ) cout << " ";
  cout << "|" << endl;
}

// all pau!   )
}

