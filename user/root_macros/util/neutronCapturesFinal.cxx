// void neutronCapturesFinal( <nCap_filename> )
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

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

void neutronCapturesFinal( const char* filename ) {

TFile *fnc = TFile::Open(filename, "update");
TTree *T_ncap = (TTree*)gDirectory->Get("T_ncap");
TCanvas *c_zeta = new TCanvas("c_zeta", "c_zeta");
T_ncap->Draw("zeta>>h_zeta", "volCheck==1");
c_zeta->Write("c_zeta");
fnc->Write();
fnc->Close();

// all pau!   )
}
