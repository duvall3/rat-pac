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

  	void			DumpHist(TH1* h);				// for non-graphical sessions
  	TEntryList*		EntryList(const char* selection, TTree* T=0);	// shortcut
  	void			ExportPlots(const char* filename, const TString kGraphicsSaveFormat=".png"); // shortcut
  TObject*		FindMatchingObject(const char* pattern);	// builtins can't search by PATTERN
  TList*		FindVarsOfType(const char* pattern);		// same as above
  TList*		ListFiles(const char* pattern);			// more useful than ROOT's void builtins
  void			LoadAllKeys();					// shortcut
  Double_t*		LogBins(Double_t xmin=1.e-1, Double_t xmax=1.e2); // shortcut
  	/* void			PrintArrayD(Int_t N, Double_t* x);		// because I'm tired of typing it */
  	Double_t		Prob2Sig(Double_t prob);			// convert probability to significance
  TH2D*			RadarPlot(TH1D *h_in, Option_t *ho="cyllego", const Bool_t kNewCanvas=kTRUE); // convert TH1D* to radar plot
  void			ShiftStats(TVirtualPad* p, Double_t deltaX=-.1, Double_t deltaY=0.); // move the &@#$ stats box out of the way
  	Double_t		Sig2Prob(Double_t sig);				// convert significance to probability
  Double_t		UnbinnedKSTest(TTree *T1, TTree *T2, const char* branchName); // apply unbinned KS test to a pair of TBranches
  void			Zoom(Double_t zoomFactor);			// more convenient than builtin

} // end namespace
