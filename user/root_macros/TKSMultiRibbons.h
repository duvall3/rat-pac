// TKSMultiRibbons
/// Class for analyzing DeltaPhi for each individual angle alongside TKSMultiRes
//    See TKSMultiRes for more information
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

/** TKSMultiRibbons
 *
 * Class for making ribbon and heatmap plots, specifically from KSSummary data.
 *
 *   To use:
 *    - Call constructor
 *    - Use SetPlotTypes(0|1|2) to select desired plot(s) *[optional]*
 *    - Call Run()
 *    - Use SetOutFileName to change output filenames *[optional]*
 *    - Call Save() *[optional]*
 *    - *Note: You can ajust the camera in the ribbon plot before saving if desired*
 *
 *   Plot-type enum options are:
 *    - 0 = kRibbons: ribbon plot only
 *    - 1 = kHeatmap: heatmap plot only
 *    - 2 = kBoth: both plots *[default]*
 *
 * Example:
 * ```cpp
 *   TKSMultiRibbons R;
 *   R.SetPlotTypes(TKSMultiRibbons::kHeatmap);
 *   R.Run();
 *   R.SetOutFileName("MultiRibbons.root");
 *   R.Save();
 * ```
 */

#ifndef TKSMultiRibbons
#define TKSMultiRibbons

//#include "TKSMultiRes.cxx"

class TKSMultiRibbons : public TClass {

public:
  // graph-selection enum
  enum EPlotTypes									/// Which plots to make:
  {
    kRibbons,										///< Ribbon plot only
    kHeatmap,										///< Heatmap plot only
    kBoth										///< Both plots
  };

private:
  // members
  /* TKSMultiRes*		fkMultiRes;							///< Invoking TKSMultiRes object (if any) */
  Bool_t		fkInit;								///< Whether Init() has been run yet
  Int_t			fkNFiles;							///< Number of 'KSSummary.root' files found
  Int_t			fkNAngles;							///< Number of angles in each file
  EPlotTypes		fPlotTypes;							///< Which plots to make
  EPlotTypes		fCurrentPlotType;						///< Currently-active plot type
  TObjArray*		fFileList;							///< List of KSSummary files to analyze
  TString		fOutFileName;							///< Output filename
  TFile*		fOutFile;							///< Output TFile*
  TCanvas*		fHeatmapCanvas;							///< Canvas for heatmap plot
  TCanvas*		fRibbonCanvas;							///< Canvas for ribbon plots
  TList*		fRibbonList;							///< List of ribbon plots
  TList*		fCutList;							///< List of xy cuts for ribbon plots
  TMatrixD*		fDeltas;							///< Matrix containing (phi_recon-phi_true), dimensions <N_files>x<N_angles>

private:
  // internal methods
  /* void			SetMultiRes(TKSMultiRes* newMultiRes) { fkMultiRes=newMultiRes; } */
  void			SetInit(Bool_t newInit) { fkInit=newInit; }
  void			FillFileList();							///< Scan for KSSummary files and store in fFileList
  void			SetNFiles(Int_t newNFiles) { fkNFiles=newNFiles; }
  void			SetNAngles(Int_t newNAngles) { fkNAngles=newNAngles; }
  void			SetDeltas(TMatrixD *newDeltas);					///< Fill difference matrix
  TMatrixD		RetrieveData();							///< Fetch data from files
  void			FillData();							///< Fill difference data

public:
  // public methods
  TKSMultiRibbons();									///< Default ctor
  Bool_t		IsInit() { return fkInit; }					///< Whether Init() has been run yet
  // setters and getters
  void			SetPlotTypes(EPlotTypes plotSelection) { fPlotTypes=plotSelection; }
  void			SetCurrentPlotType(EPlotTypes plotSelection) { fCurrentPlotType=plotSelection; }
  void			SetFileList(TObjArray* newFileList) { fFileList=newFileList; }
  void			SetOutFileName(TString fileName) { fOutFileName=fileName; }
  void			SetOutFileName(const char* filename) { fOutFileName=TString(filename); }
  void			SetOutFile(TFile *fNew) { fOutFile=fNew; }
  /* TKSMultiRes*		GetMultiRes() { return fkMultiRes; } */
  Int_t			GetNFiles() { return fkNFiles; }
  Int_t			GetNAngles() { return fkNAngles; }
  EPlotTypes		GetPlotTypes() { return fPlotTypes; }
  EPlotTypes		GetCurrentPlotType() { return fCurrentPlotType; }
  TObjArray*		GetFileList() { return fFileList; }
  TString		GetOutFileName() { return fOutFileName; }
  TFile*		GetOutFile() { return fOutFile; }
  TCanvas*		GetHeatmapCanvas() { return fHeatmapCanvas; }
  TCanvas*		GetRibbonCanvas() { return fRibbonCanvas; }
  TList*		GetRibbonList() { return fRibbonList; }
  TList*		GetCutList() { return fCutList; }
  TMatrixD*		GetDeltas() { return fDeltas; }
  // general
  void			Init();								///< Initialize
  void			DrawPlots();							///< Draw specified plots
  void			Ribbons();							///< Fit distributions for each angle and draw as ribbon plot
  void			Heatmap();							///< Fit distributions for each angle and draw as heatmap
  void			Save();								///< Save results
  void			Run();								///< Perform all selected analyses
  void			PrintEnums();							///< Display this class' enums

// Integrating the TKSMultiRibbons class into ROOT
ClassDef(TKSMultiRibbons,2) ///< with class version number

}; //end class

// all pau!   )
#endif

