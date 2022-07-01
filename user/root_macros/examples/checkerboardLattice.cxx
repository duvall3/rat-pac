// checkerboardLattice -- simple function to visualize an alternating-checkerboard lattice
// -- Usage: TH3I* checkerboardLattice( Int_t nRows = 8, Int_t nCols = 8, Int_t nLyrs = 2 )
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 07/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall
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

TH3I* checkerboardLattice( Int_t nRows = 8, Int_t nCols = 8, Int_t nLyrs = 2 ) {

// clear previous if found
TObject *h_chklat_find = gDirectory->Get("h_chklat");
if (h_chklat_find != 0x0) {
  if (h_chklat_find->IsA() == TH3I::Class()) delete h_chklat;
}

// init
TH3I *h_chklat = new TH3I("h_chklat", "Checkerboard Lattice", nRows+1, 0, nRows, nCols+1, 0, nCols, nLyrs+1, 0, nLyrs);
Int_t row, col, lyr;

// main -- generate array by filling histogram
for ( row=0; row<nRows; row++ ) {
  for ( col=0; col<nCols; col++ ) {
    for ( lyr=0; lyr<nLyrs; lyr+=2 ) {
      if ( row%2 == col%2 ) {
	h_chklat->Fill(row, col, lyr+1);
      } else {
	h_chklat->Fill(row, col, lyr);
      }
    }
  }
}

// draw
TCanvas *c_chklat = gROOT->GetListOfCanvases()->FindObject("c_chklat");
if ( c_chklat == 0x0 ) c_chklat = new TCanvas("c_chklat", "Checkerboard Lattice");
c_chklat->cd();
h_chklat->Draw("glboxFbBb");
h_chklat->SetAxisRange(0, nRows-1, "x");
h_chklat->SetAxisRange(0, nCols-1, "y");
h_chklat->SetAxisRange(0, nLyrs-1, "z");

// annotate
h_chklat->GetXaxis()->SetTitle("Row");
h_chklat->GetYaxis()->SetTitle("Col");
h_chklat->GetZaxis()->SetTitle("Lyr");
h_chklat->GetXaxis()->SetTitleOffset(1.5);
h_chklat->GetYaxis()->SetTitleOffset(1.5);
h_chklat->GetZaxis()->SetTitleOffset(1.5);

// all pau!   )
return h_chklat;
}
