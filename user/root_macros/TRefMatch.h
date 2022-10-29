/// Implements KS/AD-test reference-matching algorithm.
/** TRefMatch -- class for implementing the reference-matching algorithm
 *   described in this repository at $RATROOT/user/ref_matching/README.{md,html}
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

#ifndef TRefMatch
#define TRefMatch

class TRefMatch : public TClass {

private:
  // members
  // NOTE: There is no individual datamember for the best-match angle; it is stored in fResults[0]
  const char*		fTestFileName;		///< Name of file containing data sample to be tested
  const char*		fTestTreeName;		///< Name of tree containing data sample to be tested
  const char*		fTestVarName;		///< Name of branch/variable containing data sample to be tested
  TFile*		fTestSampleFile;	///< Address of test-sample file 
  TTree*		fTestSampleTree;	///< Address of test-sample tree
  TBranch*		fTestSampleBranch;	///< Address of test-sample branch
  const char*		fReferenceTreeName;	///< Name of tree in reference files
  TList*		fReferenceFileList;	///< List of files containing reference distributions
  TFile*		fOutFile;		///< Output file
  TRegexp		fReferenceFilePattern;	///< Regex describing reference files
  TSystemDirectory*	fReferenceFileDir;	///< Directory containing reference files
  Long64_t		fnTestSampleEvents;	///< Number of events to use from test-sample tree (default value 0 will use all events)
  Long64_t		fnReferenceEvents;	///< Number of events to use from reference trees (default value 0 will use all events)
  Bool_t		fkAnderson;		///< If true, use Anderson-Darling rather than Kolmogorov-Smirnov
  Double_t		fTestSamplePhiTrue;	///< The true value of phi for the test sample
  Double_t		fProb;			///< Match probability (current entry)
  Double_t		fSig;			///< Match significance (current entry)
  TMatrixD		fResultsMatrix;		///< Matrix of comparison results
  TVectorD		fResults;		///< 3x1 vector containing best match value and corresponding probability and significance
  TFile*		fBestMatchFile;		///< Address of best-match reference file
  Bool_t		fkHasInit;		///< Status indicator for whether Init has been called yet
  Bool_t		fkHasRun;		///< Status indicator for whether RefComp has been called yet
  TCanvas*		fCanvas;		///< Canvas for drawing results
  TH1D*			fTestSampleHist;	///< TH1 for test-sample data
  TGraph*		fResultsGraph;		///< TGraph for algorithm results

private:
  // methods
  void			Init();
  void			SetTestSamplePhiTrue( Double_t phi ) { fTestSamplePhiTrue = phi; }
  void			SetProb( Double_t prob ) { fProb = prob; }
  void			SetSig( Double_t sig ) { fSig = sig; }
  void			SetResultsMatrix( TMatrixD resmat ) { fResultsMatrix = resmat; }
  void			SetResults( TVectorD res ) { fResults = res; }
  void			SetBestMatchFile( TFile* bestMatchFile ) { fBestMatchFile = bestMatchFile; }
  void			SetCanvas( TCanvas *c ) { fCanvas = c; }
  void			SetTestSampleHist( TH1D* h ) { fTestSampleHist = h; }
  void			SetResultsGraph( TGraph *g ) { fResultsGraph = g; }

public:
  // methods
  // ctors and inits
  TRefMatch();
  TRefMatch( const char* fileName, const char* treeName = "T", const char* branchVarName = "phi" );
  void			Init( const char* fileName, const char* treeName, const char* branchVarName );
  // getters:
  const char*		GetTestFileName() { return fTestFileName; }
  const char*		GetTestTreeName() { return fTestTreeName; }
  const char*		GetTestVarName() { return fTestVarName; }
  TFile*		GetFile() { return fTestSampleFile; }
  TTree*		GetTree() { return fTestSampleTree; }
  TBranch*		GetBranch() { return fTestSampleBranch; }
  const char*		GetReferenceTreeName() { return fReferenceTreeName; }
  TList*		GetReferenceFileList() { return fReferenceFileList; }
  TFile*		GetOutFile() { return fOutFile; }
  TRegexp		GetReferenceFilePattern() { return fReferenceFilePattern; }
  TSystemDirectory*	GetReferenceFileDir() { return fReferenceFileDir; }
  Long64_t		GetnTestSampleEvents() { return fnTestSampleEvents; }
  Long64_t		GetnReferenceEvents() { return fnReferenceEvents; }
  Bool_t		GetAnderson() { return fkAnderson; }
  Double_t		GetTestSamplePhiTrue() { return fTestSamplePhiTrue; }
  Double_t		GetProb() { return fProb; }
  Double_t		GetSig() { return fSig; }
  TMatrixD		GetResultsMatrix() { return fResultsMatrix; }
  TVectorD		GetResults() { return fResults; }
  TFile*		GetBestMatchFile() { return fBestMatchFile; }
  TCanvas*		GetCanvas() { return fCanvas; }
  TH1D*			GetTestSampleHist() { return fTestSampleHist; }
  TGraph*		GetResultsGraph() { return fResultsGraph; }
  // setters:
  void			SetReferenceFileDir(TSystemDirectory* refFileDir);
  void			SetReferenceFileDir(const char* refFileDirName);
  void			SetReferenceFilePattern(TRegexp patternRE);
  void			SetReferenceFilePattern(const char* pattern);
  void			SetReferenceFileList(TList *fileList) { fReferenceFileList = fileList; }
  void			SetAnderson(Bool_t bAnderson) { fkAnderson = bAnderson; }
  void			SetReferenceTreeName(const char* treeName) { fReferenceTreeName = treeName; }
  void			FillReferenceFileList();
  void			SetnEvents(Long64_t nTestSampleEvents=0, Long64_t nReferenceEvents=0) { fnTestSampleEvents=nTestSampleEvents; fnReferenceEvents=nReferenceEvents; }
  // utility:
  Double_t		Prob2Sig( Double_t prob );		///< Convert probability to significance
  Double_t		Sig2Prob( Double_t sig );		///< Convert significance to probability
  void			ExtractRef( const char* runName, const char* treeName = "T", const char* branchName = "phi" );	///< Extract distribution from reference run
  void			ExtractTest( const char* runName, const char* treeName = "T_ncap", const char* branchName = "phi" );	///< Extract distribution from experimental run
  // MAIN:
  Double_t		UnbinnedKSTest(TTree *T1, TTree *T2, const char* branchName1, const char* branchName2="", Long64_t nEvents1=0, Long64_t nEvents2=0 );	///< Apply unbinned Kolmogorov-Smirnov test
  Double_t		AndersonDarlingTest(TTree *T1, TTree *T2, const char* branchName1, const char* branchName2="", Long64_t nEvents1=0, Long64_t nEvents2=0 );	///< Apply (unbinned) Anderson-Darling test
  void			RefCompare();				///< Perform reference-comparison algorithm
  // plots:
  void			DrawResults(Bool_t kDrawFit=kFALSE);	///< Plot sample distribution and algorithm results
  // print info:
  void			PrintVerbose();				///< Mostly settings
  void			PrintResults();				///< Results summary
  // save and / or close
  void			SaveResults();				///< Print canvas and save object
  void			Close();				///< Close pads, files, etc.
  // do everything
  void			Run(Long64_t nTestSampleEvents=0);	///< Execute a typical analysis


//Integrating the TRefMatch class to ROOT.
ClassDef(TRefMatch,4)

}; //end class

// all pau!   )
#endif
