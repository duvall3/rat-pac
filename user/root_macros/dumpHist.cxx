// dumpHist -- simple macro to print TH1 data to stdout
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ //

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


void dumpHist( TH1* histo ) {
  Int_t nbins, k;
  nbins = histo->GetNbinsX();
  for ( k=0; k<nbins; k++ ) cout << histo->GetBinCenter(k) << "\t" << histo->GetBinContent(k) << endl;
// all pau!   )
}
