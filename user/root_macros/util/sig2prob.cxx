// sig2prob -- simple function to convert significance level to probability
// -- This probably already exists as a built-in function somewhere,
//      but I'm adding it here for convenience
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 07/2022 ~ //

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

Double_t sig2prob(Double_t sigma) {

// convert, accounting for special values
Double_t prob;
if (sigma == TMath::Infinity()) {
  prob = 1.;
} else if ( sigma == 0. ) {
  prob = 0.;
} else {
  prob = TMath::Erf( sigma / TMath::Sqrt2() );
}

// all pau!   )
return prob;
}
