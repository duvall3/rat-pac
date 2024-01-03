// TDuvallUtils
/// Library of useful general-purpose functions for working with ROOT / RAT-PAC. //DOC//
/** **Math:**
 *  - EntryList()
 *  - LogBins()
 *  - Prob2Sig()
 *  - Sig2Prob()
 *  - UnbinnedKSTest()
 *
 *  **Plotting:** 
 *  - DumpHist()
 *  - HistData()
 *  - RadarPlot()
 *  - ShiftStats()
 *  - Zoom()
 *
 *  **Finding Things:**
 *  - //IsGlobal()
 *  - FindMatchingObjects()
 *  - FindVarsOfType()
 *  - ListFiles()
 *  - PrintBranches()
 *  
 *  **File Operations**:
 *  - ExportPlots()
 *  - ListFiles()
 *  - LoadAllKeys()
 *  
 */
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

  void			DumpHist(TH1* h);						///< Dump histogram to terminal
  TEntryList*		EntryList(const char* selection, TTree* T=0);			///< Shortcut for creating TEntryLists
  void			ExportPlots(const char* filename, const TString kGraphicsSaveFormat=".png"); ///< Shortcut for printing all canvases in a file
  /* Bool_t		IsGlobal(const char* name);					///< Determine whether a global variable exists */
  /* TObject*		FindMatchingObject(TCollection* colxn, TRegexp patternRE);	///< Builtins can't search by PATTERN */
  /* TObject*		FindMatchingObject(TCollection* colxn, const char* pattern) { return FindMatchingObject(colxn, TRegexp(pattern)); } // overload FindMatchingObject for char* input */
  /* TList*		FindMatchingObjects(TCollection* colxn, TRegexp patternRE, Bool_t caseSensitive=kTRUE);	///< Scan a TCollection for an object whose name matches a regex */
  /* TList*		FindMatchingObjects(TCollection* colxn, const char* pattern, Bool_t caseSensitive=kTRUE) { return FindMatchingObjects(colxn, TRegexp(pattern), caseSensitive); } ///< Overload FindMatchingObjects for char* input */
  TList*		FindMatchingObjects(TCollection* colxn, TRegexp patternRE);	///< Scan a TCollection for an object whose name matches a regex
  TList*		FindMatchingObjects(TCollection* colxn, const char* pattern) { return FindMatchingObjects(colxn, TRegexp(pattern)); } ///< Overload FindMatchingObjects for char* input
  TList*		FindVarsOfType(const char* varType="", Bool_t kCaseSensitive=kFALSE);	///< List global variables matching a specified type
  void			HistData(TH1* h=0x0);						///< Print data needed to reconstruct a histogram (TH1)
  TList*		ListFiles(const char* pattern=".*\.root");			///< Return a list of files matching a pattern
  void			LoadAllKeys();							///< Shortcut to load all keys from the current file into memory *! USE WITH CAUTION !*
  Double_t*		LogBins(Double_t xmin=1.e-1, Double_t xmax=1.e2); 		///< Return an array of logarithmically-spaced values
  /* void		PrintArrayT(Int_t N, type T x);					///< Coming once I get the hang of templated functions */
  void			PrintBranches(TObject *obj);					///< Print nicely-formatted summary of *obj*'s TBranches
  Double_t		Prob2Sig(Double_t prob);					///< Convert probability to significance
  TCanvas*		RadarPlot(TH1D *h_in, Option_t *ho="cyllego", const Bool_t kClean=kFALSE, const Bool_t kNewCanvas=kTRUE);	///< Convert TH1D* to radar plot
  TCanvas*		RadarPlot(TH1F *h_in,Option_t *ho="cyllego", const Bool_t kClean=kFALSE, const Bool_t kNewCanvas=kTRUE ) { return radarPlot((TH1D*)h_in,ho,kClean,kNewCanvas); }	///< Overload RadarPlot for TH1F
  TCanvas*		RadarPlot(TH1I *h_in, Option_t *ho="cyllego", const Bool_t kClean=kFALSE, const Bool_t kNewCanvas=kTRUE) { return radarPlot((TH1D*)h_in,ho,kClean,kNewCanvas); }	///< Overload RadarPlot for TH1I
  void			ShiftStats(TVirtualPad* p=gPad, Double_t deltaX=-.1, Double_t deltaY=0.);	///< Move the &@#$ing stats box out of the way
  Double_t		Sig2Prob(Double_t sig);						///< Convert significance to probability
  Double_t		UnbinnedKSTest(TTree *T1, TTree *T2, const char* branchName1, const char* branchName2 = "");	///< Apply unbinned KS test to a pair of TBranches
  void			Zoom(Double_t zoomFactor=2.);					///< Shortcut to set relative zoom

} // end namespace
