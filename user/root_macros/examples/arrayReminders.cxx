// arrayReminders -- because I keep forgetting things about C++ arrays,
//   and ROOT naturally has its own flavor of them
// -- ditto vectors
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

{


//// First, some basics:

// Creation from scratch:
Double_t x[10];
//Double_t *y(10); -- NOT EQUIVALENT

// Creation from histogram:
TH1D *h = new TH1D("h", "h", 100, -2.5, 2.5);
h->FillRandom("gausn");
h->Draw();
Double_t *y = (Double_t*)h->GetArray(); // TH1::GetArray returns Float_t*

// Explicit assignment at creation:
Int_t phi[4] = {0, 15, 30, 45};
TString phiNames[4] = {"phi_{0}", "phi{1}", "phi_{2}", "phi_{3}"};


//// Basic operations:

// Access individual elements:
cout << 1.5 * phi[1] << endl;
printf( "Final Name: %s\n", phiNames[3].Data() );

// Determine length:
// arrays like x
int nx = sizeof(x) / sizeof(x[0]);
// arrays like y
/* int ny = ?? */

// Frigging PRINT:



//// all pau!   )
}
