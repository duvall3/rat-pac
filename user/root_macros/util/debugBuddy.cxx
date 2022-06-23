// debugBuddy -- simple macro for general debugging
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

void debugBuddy( const char* testFilename, Bool_t kPrint = kFALSE, Double_t testDouble = 0.) {

// print macro name
printf("\n/// Executing debugBuddy.cxx...\n");

// print inputs
if (kPrint) {
  TString kPrintStr = "kTRUE";
} else {
  TString kPrintStr = "kFALSE";
}
printf("Inputs:\ttestfileName = %s\tkPrint = %d = %s\ttestDouble = %f\n", testFilename, kPrint, kPrintStr.Data(), testDouble);

// open file and print contents
TFile *f = TFile::Open(testFilename);
if (f==0x0) {
  gROOT->Error("debugBuddy.cxx", "Could not open file. Exiting.");
  return;
}
printf("Successfully opened %s.", f->GetName());
if (kPrint) {
  printf(" Printing contents:\n");
  gDirectory->ls();
} else {
  printf("\n");
}
printf("\n");

// all pau!   )
f->Close();
printf("/// debugBuddy finished!\n\n");
}
