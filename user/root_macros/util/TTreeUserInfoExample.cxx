// TTreeUserInfoExample -- reference macro demonstrating use of TList* TTree::GetUserInfo()
// USAGE: .x /path/to/TTreeUserInfoExample.cxx
// -- General notes:
//    * This macro demonstrates how to attach and store non-branch information in a TTree
//    * This is especially useful for keeping things like experiment configuration
//        or summary information attached to the original data
//    * Most ROOT classes can be added to a TTree's UserInfo, but some items
//        (most notably, TStrings and fundamental data types) must first be transferred
//        to a relevant "collectible" ROOT class, which is then the object
//        that gets added to UserInfo
//    * When retrieving the objects from a saved ROOT file, each one must be accessed
//        (1) as a pointer, with (2) the result of TList->At being cast back
//        to the pointer type corresponding to the object in question
// -- Details:
//    * Only objects that inherit from TObject can be added 
//        to a ROOT collection class like TList;
//        so basic types like strings, ints, doubles, arrays, etc.
//        must first be stored in a class that inherits from TObject
//    * Also, as with all ROOT collection classes, TList does not store
//        the desired object itself, but rather a pointer to it
//    * These pointers must be cast back to the relevant type when
//        accessing the objects from the UserInfo TList*
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

printf("\n\n/// Beginning TTreeUserInfoExample.cxx ... ///\n\n");

// init:
TFile *f = TFile::Open("TTreeUserInfoExample.root", "recreate");	// create ROOT file
TTree *T = new TTree("T", "T");						// create TTree
TList *ui = T->GetUserInfo();						// get the UserInfo TList

// many ROOT classes can be stored as they are
// for example, storing a 3-D physics vector:
TVector3 w(1.1, 2.2, 3.3);						// create a TVector3 "w"
ui->Add(&w);								// add the address of "w" to UserInfo

// storing a string:
TString s = "some text information";					// create a TString "s"
TObjString *os = new TObjString(s);					// put it into a TObjString "os" so it can be stored
ui->Add(os);								// add pointer for "os" to UserInfo

// storing a basic type -- e.g., a double:
Double_t x = 2.56;							// create a double "x"
TVectorD *vx = new TVectorD(1);						// create a Double_t TVector "vx" of length 1
vx(0) = x;								// set the first element of "vx" to "x"
ui->Add(vx);								// add pointer for "vx" to UserInfo

// above method only works for doubles (TVectorD)
//   and floats (TVectorF); for other types,
//   casting can be used
// for example, storing an int:
Int_t k = 12;								// create an int "k"
TVectorF *vk = new TVectorF(1);						// create a Float_t TVector "vk" of length 1
vk(0) = (Float_t)k;							// set the first element of "vk" not simply to "k", but to "k" cast as a float
ui->Add(vk);								// add pointer for "vk" to UserInfo

// checking contents:
printf("\n\nChecking input contents (brief listing):\n");
ui->ls(); // short listing
printf("\nChecking input contents (verbose listing):\n");
ui->Print(); // detailed listing

// saving:
printf("Saving...\n");
T->Write();
f->Write();
f->Close();
printf("Done.\n\n");

// retrieving:
printf("Opening...\n");
TFile *f2 = TFile::Open("TTreeUserInfoExample.root");			// open ROOT file
TTree* T2 = gDirectory->Get("T");					// get TTree
TList* ui2 = T2->GetUserInfo();						// get UserInfo
printf("Done.\n\n");

// use TDirectory::ls() (i.e., '.ls') to view what is stored in the file:
printf("File contents:\n");
gDirectory->ls();
printf("\n");

// use TList::ls() to view what is stored in UserInfo:
printf("TTree's UserInfo Contents:\n");
ui2->ls();
printf("\n");

// accessing the 3-D physics vector:
TVector3 *w2 = (TVector3*)ui2->At(0);					// cast the first entry in "ui2" back to a TVector3 pointer
printf("\nThe TVector3: w2 = \n");
w2->Print();

// accessing the string:
TObjString *o2 = (TObjString*)ui2->At(1);				// cast the second entry back to a TObjString pointer
TString s2 = o2->GetString();						// get the TString from the TObjString
printf("\nThe string: s2 = %s\n", s2.Data());

// accessing the double:
TVectorD *vx2 = (TVectorD*)ui2->At(2);					// cast the third entry back to a TVectorD pointer
printf("\nThe double, inside its vector:\n");
vx2->Print();								// just use the vector, or:
Double_t x2 = vx2(0);							// create a double that is equal to the first element in "vx2"
printf("The double, as its own variable: x2 = %f\n", x2);

// accessing the int:
TVectorF *vk2 = (TVectorF*)ui2->At(3);					// cast the fourth entry back to a TVectorF pointer
printf("\nThe int, still inside the Float_t vector:\n");
vk2->Print();
Int_t k2 = (Int_t)vk2(0);						// create an int that is equal to the first element in "vk2"
printf("The int, as its own variable: k2 = %d\n", k2);

// all pau!   )
printf("\n\n/// TTreeUserInfoExample.cxx Done! ///\n\n\n");
return;
}
