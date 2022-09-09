// TDuvallUtils -- library of most useful general-purpose functions
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

namespace TDuvallUtils {

  void			DumpHist(TH1* h);						// for non-graphical sessions
  TEntryList*		EntryList(const char* selection, TTree* T=0);			// shortcut for creating TEntryLists
  void			ExportPlots(const char* filename, const TString kGraphicsSaveFormat=".png"); // shortcut for printing all canvases in a file
  /* TObject*		FindMatchingObject(TCollection* colxn, TRegexp patternRE);	// builtins can't search by PATTERN */
  /* TObject*		FindMatchingObject(TCollection* colxn, const char* pattern) { return FindMatchingObject(colxn, TRegexp(pattern)); } // overload FindMatchingObject for char* input */
  TList*		FindMatchingObjects(TCollection* colxn, TRegexp patternRE);	// builtins can't search by PATTERN
  TList*		FindMatchingObjects(TCollection* colxn, const char* pattern) { return FindMatchingObjects(colxn, TRegexp(pattern)); } // overload FindMatchingObject for char* input
  TList*		FindVarsOfType(const char* varType="", Bool_t kCaseSensitive=kFALSE);	// builtins can't search by PATTERN
  TList*		ListFiles(const char* pattern=".*\.root");			// builtin returns void, this returns the list
  void			LoadAllKeys();							// shortcut to load all keys from the current file into memory -- *! USE WITH CAUTION !*
  Double_t*		LogBins(Double_t xmin=1.e-1, Double_t xmax=1.e2); 		// wonderful shortcut for setting up log-scaled histograms (courtesy Marc F. Bergevin)
  /* void		PrintArrayT(Int_t N, type T x);					// coming once I get the hang of templated functions */
  void			PrintBranches(TTree *T);					// print a TTree's branch list in a better format
  Double_t		Prob2Sig(Double_t prob);					// convert probability to significance
  TH2D*			RadarPlot(TH1D *h_in, Option_t *ho="cyllego", const Bool_t kNewCanvas=kTRUE);	// convert TH1D* to radar plot
  TH2D*			RadarPlot(TH1F *h_in,Option_t *ho="cyllego", const Bool_t kNewCanvas=kTRUE ) { return radarPlot((TH1D*)h_in,ho); }	// overload RadarPlot for TH1F
  TH2D*			RadarPlot(TH1I *h_in, Option_t *ho="cyllego", const Bool_t kNewCanvas=kTRUE) { return radarPlot((TH1D*)h_in,ho); }	// overload RadarPlot for TH1I
  void			ShiftStats(TVirtualPad* p, Double_t deltaX=-.1, Double_t deltaY=0.);	// move the &@#$ stats box out of the way
  Double_t		Sig2Prob(Double_t sig);						// convert significance to probability
  Double_t		UnbinnedKSTest(TTree *T1, TTree *T2, const char* branchName1, const char* branchName2 = "");	// apply unbinned KS test to a pair of TBranches
  void			Zoom(Double_t zoomFactor=2.);					// shortcut to set relative zoom

} // end namespace
