// TKSMultiRes
/// Class for combining reference-comparison results from multiple runs
// -- Note: For CINT, load using gROOT->LoadMacro("TKSMultiRes.cxx");
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2022 ~ //

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

#ifndef TKSMultiRes
#define TKSMultiRes

#include "TKSMultiRibbons.cxx"

class TKSMultiRes : public TClass {

private:
  // members
  TObjArray*		fFileList;							///< List of KSSummary files to analyze
  Bool_t		kRibbon;							///< Whether to generate ribbon plots
  TString		fOutFileName;							///< Output filename
  TFile*		fOutFile;							///< Output TFile*
  TH1D*			fHistoSum;							///< Summed histogram
  TF1*			fHistoSumFit;							///< Gaussian fitted to fHistoSum
  TFitResult*		fHistoSumFitResult;						///< Fit result for the summed histogram
  TCanvas*		fHistoCanvas;							///< Canvas for histo sum
  TCanvas*		fRibbonCanvas;							///< Canvas for ribbon plots
  TKSMultiRibbons*	fRibbons;							///< Class for separate-angle analysis

private:
  // internal methods
  void			FillFileList();							///< Scan for KSSummary files and store in fFileList

public:
  // public methods
  TKSMultiRes();									///< Default ctor
  /* TKSMultiRes( const char* someArg1, Double_t someArg2 );				///< Normal ctor */
  // setters and getters
  void			SetRibbon(Bool_t newRibbon) { kRibbon=newRibbon; }
  void			SetOutFileName(TString fileName) { fOutFileName=fileName; }
  void			SetOutFileName(const char* filename) { fOutFileName=TString(filename); }
  TObjArray*		GetFileList() { return fFileList; }
  Bool_t		IsRibbon() { return kRibbon; }
  TString		GetOutFileName() { return fOutFileName; }
  TFile*		GetOutFile() { return fOutFile; }
  TH1D*			GetHistoSum() { return fHistoSum; }
  TF1*			GetHistoSumFit() { return fHistoSumFit; }
  TFitResult*		GetHistoSumFitResult() { return fHistoSumFitResult; }
  TCanvas*		GetHistoCanvas() { return fHistoCanvas; }
  TCanvas*		GetRibbonCanvas() { return fRibbonCanvas; }
  TKSMultiRibbons*	GetRibbons() { return fRibbons; }
  // general
  void			Init();								///< Initialize
  TH1D*			Histos();							///< Add histograms and fit
  TH2D*			Ribbons();							///< Fit distributions for each angle and draw as ribbon plot
  void			Save();								///< Save results
  void			Run();								///< Perform and save all selected analyses

// Integrating the TKSMultiRes class into ROOT
ClassDef(TKSMultiRes,1) ///< with class version number

}; //end class

// all pau!   )
#endif

