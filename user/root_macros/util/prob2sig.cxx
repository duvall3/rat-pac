// prob2sig -- simple function to convert a probability to a significance level
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

Double_t prob2sig(Double_t prob) {

// convert, accounting for special values
if ( prob == 1. ) {
  sigma = TMath::Infinity();
} else if ( prob == 0. ) {
  sigma = 0.;
} else {
  sigma = TMath::Sqrt2() * TMath::ErfInverse(prob);
}

// all pau!   )
return sigma;
}
