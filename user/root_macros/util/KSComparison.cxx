// KSComparison -- small function to simplify use of TRefMatch class
//   (from github.com/duvall3/rat-pac/tree/collab/user/root_macros)
//   for a particular collection of datasets
//
// -- To use as simply as possible, run in a directory (e.g., "REF_DISTRIBS") containing:
//    * All the reference ROOT files, named as "%2dDEG_ref.root"|phiTrue
//    + A subdirectory named "TEST_SAMPLES", which contains:
//      * The desired test-sample ROOT file(s), named as "%2dDEG_testsample.root"|phiTrue
//
// -- Example:   REF_DISTRIBS	<-- run here
// 		 |
// 		 |-- *DEG_ref.root
// 		 |
// 		 |--+ TEST_SAMPLES
// 		    |
// 		    |-- *DEG_testsample.root
//
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

TRefMatch* KSComparison( Double_t phiTrue = TMath::QuietNaN(), const char* branchName = "phiSeg", Long64_t nTestSampleEvents = 0, Long64_t nReferenceEvents = 0 ) {

// dependency check
const char* refMatchClassName = "TRefMatch.cxx";
if (! gInterpreter->IsLoaded(refMatchClassName) ) gROOT->LoadMacro(refMatchClassName);

// usage info
TString MsgLoc("KSComparison");
TString UsageInfo;
UsageInfo.Form("\n\n\
\tKSComparison( phiTrue, nTestSampleEvents, nReferenceEvents )\n\
\t-- phiTrue (required): Source angle corresponding to the dataset to test\n\
\t-- nTestSampleEvents (optional): Number of events to use from the test dataset (default: all)\n\
\t-- nReferenceEvents (optional): Number of events to use from the reference datasets (default: all)\n\
\t-- Examples:\n\
\t   -- Run the test for the data taken at phiTrue = 12 degrees: \"KSComparison(12);\"\n\
\t   -- Same as above, but use only the first 100 events: \"KSComparison(12, 100);\"\n\
\t   -- Same as above, but also use only the first 10 000 events from each reference dataset: \"KSComparison(12, 100, 10000);\"\n");

// help check
if ( TMath::IsNaN(phiTrue) ) {
  gROOT->Info(MsgLoc.Data(), UsageInfo.Data());
  return;
}

// now, on to business:
// construct filename
Int_t phiInt = TMath::Nint(phiTrue);
TString testFileName;
testFileName.Form("TEST_SAMPLES/%02dDEG_testsample.root", phiInt);
// create TRefMatch object
TRefMatch *r = new TRefMatch( testFileName.Data(), "T_ts", branchName );
r->FillReferenceFileList();
r->SetnEvents( nTestSampleEvents, nReferenceEvents );
r->RefCompare();
r->DrawResults();
r->SaveResults();
r->Close();

// all pau!   )
return r;
}

// overload for Int_t phiTrue input
TRefMatch* KSComparison( Int_t phiTrue = TMath::QuietNaN(), const char* branchName = "phiSeg", Long64_t nTestSampleEvents = 0, Long64_t nReferenceEvents = 0 ) { return KSComparison( (Double_t)phiTrue, branchName, nTestSampleEvents, nReferenceEvents ); }
