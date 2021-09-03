// TTreeUserInfoExample -- reference macro demonstrating use of TList* TTree::GetUserInfo()
// -- General notes:
//    * Only objects that inherit from TObject can be added 
//        to a ROOT collection class like TList,
//        so basic types like strings, ints, doubles, arrays, etc.
//        must first be stored in a class that inherits from TObject
//    * Also as with all ROOT collection classes, TList does not store
//        the desired object itself, but rather a pointer to it
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

void TTreeUserInfoExample() {

// init
TFile *f = TFile::Open("TTreeUserInfoExample.root", "recreate");
TTree *T = new TTree("T", "T");
TList *ui = T->GetUserInfo();

// storing a string
TString s = "some text information";
TObjString *os = new TObjString(s);
ui->Add(os);

// storing a basic type -- e.g., a double
Double_t x = 2.56;
TVectorD *vx = new TVectorD(1);
vx(0) = x;
ui->Add(vx);

// above method only works for doubles (TVectorD)
//   and floats (TVectorF); for other types,
//   casting can be used
// storing an int
Int_t k = 12;
TVectorF *vk = new TVectorF(1);
vk(0) = (Float_t)k;
ui->Add(vk);

// checking contents
printf("\n\nChecking input contents:\n");
ui->ls(); // short listing
ui->Print(); // detailed listing

// saving
printf("Saving...\n");
T->Write();
f->Write();
f->Close();
printf("Done.\n\n");

// retrieving
printf("Opening...\n");
TFile *f2 = TFile::Open("TTreeUserInfoExample.root");
TTree* T2 = (TTree*)f2->FindObjectAny("T");
TList* ui2 = T2->GetUserInfo();
printf("Done.\n");

// use TList::ls() to find desired entry
printf("Contents:\n");
ui2->ls();

// accessing the string
TObjString *o2 = (TObjString*)ui2->At(0);
TString s2 = o2->GetString();
printf("s2: %s\n", s2.Data());

// accessing the double
TVectorD *vx2 = (TVectorD*)ui2->At(1);
vx2->Print();
Double_t x2 = vx2(0);
printf("x2: %f\n", x2);

// accessing the int
TVectorF *vk2 = (TVectorF*)ui2->At(2);
vk2->Print();
Int_t k2 = (Int_t)vk2(0);
printf("k2: %d\n", k2);

// all pau!   )
printf("Done.\n\n");
return;
}
