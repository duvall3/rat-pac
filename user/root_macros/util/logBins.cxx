// logBins -- simple macro to get an array of logarithmically-spaced values,
//   e.g., for use in logarithmically-binned histograms
// -- adapted from code written by Marc F. Bergevin
// -- USAGE: Double_t *xBins = logBins(xmin,xmax);
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
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

Double_t* logBins( Double_t xmin = 1.e-1, Double_t xmax = 1.e2 ) {

// array size is currently hard-coded at 100 //HC//
const Int_t N = 100;
static Double_t xBins[N];

Double_t logxmin = TMath::Log10(xmin);
Double_t logxmax = TMath::Log10(xmax);
Double_t binwidth = (logxmax-logxmin)/N;
Double_t xBins[N+1];
xBins[0] = xmin;
for (Int_t m=1;m<=N;m++) {
  xBins[m] = TMath::Power(10,logxmin+m*binwidth);
}



// all pau!   )
return xBins;
}
