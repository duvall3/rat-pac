// TKSMultiRibbons
/// Class for combining reference-comparison results from multiple runs
// -- Note: For CINT, load using gROOT->LoadMacro("TKSMultiRibbons.cxx");
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

#ifndef TKSMultiRibbons
#define TKSMultiRibbons

class TKSMultiRibbons : public TClass {

private:
  // members
  TObjArray*		fFileList;							///< List of KSSummary files to analyze
  TString		fOutFileName;							///< Output filename
  TFile*		fOutFile;							///< Output TFile*
  TCanvas*		fRibbonCanvas;							///< Canvas for ribbon plots

private:
  // internal methods
  void			FillFileList();							///< Scan for KSSummary files and store in fFileList

public:
  // public methods
  TKSMultiRibbons();									///< Default ctor
  /* TKSMultiRibbons( const char* someArg1, Double_t someArg2 );				///< Normal ctor */
  // setters and getters
  void			SetFileList(TObjArray* newFileList) { fFileList=newFileList; }
  void			SetOutFileName(TString fileName) { fOutFileName=fileName; }
  void			SetOutFileName(const char* filename) { fOutFileName=TString(filename); }
  void			SetOutFile(TFile *fNew) { fOutFile=fNew; }
  TString		GetOutFileName() { return fOutFileName; }
  TFile*		GetOutFile() { return fOutFile; }
  TCanvas*		GetRibbonCanvas() { return fRibbonCanvas; }
  // general
  void			Init();								///< Initialize
  TH2D*			Ribbons();							///< Fit distributions for each angle and draw as ribbon plot
  void			Save();								///< Save results
  void			Run();								///< Perform and save all selected analyses

// Integrating the TKSMultiRibbons class into ROOT
ClassDef(TKSMultiRibbons,1) ///< with class version number

}; //end class

// all pau!   )
#endif

