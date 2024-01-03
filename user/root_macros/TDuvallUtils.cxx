// TDuvallUtils -- library of useful general-purpose functions
//   for working with ROOT / RAT-PAC
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

#include <TDuvallUtils.h>

//______________________________________________________________________________
// DumpHist
/**
 * Dump histogram data as (x,y) pairs to stdout, along with a rough ASCII representation of the graph.  
 *  -- Primarily for use in non-graphical sessions (over `ssh`, for example)  
 *  -- Note: Developed for use with *TH1D\** and *TH1F\** only  
 *  -- Example:  
 *  ```cpp
 *  	TH1D* h = new TH1D("h", "h", 24, -3.5, 3.5);  
 *  	h->FillRandom("gaus");  
 *  	TDuvallUtils::DumpHist(h);
 *  ```
 */
void TDuvallUtils::DumpHist( TH1* h )
{
  Int_t asciiGradations = 20;
  Int_t k = 0, j = 0, nBins = h->GetNbinsX();
  Double_t hMax = h->GetMaximum();
  Double_t binScale = hMax/asciiGradations;
  Double_t binCent;
  Long64_t binCont;
  TVectorD binConts(nBins);
  Int_t binGrads;
  for ( k=0; k<=(nBins+1); k++ ) {
    binCent = h->GetBinCenter(k);
    binCont = (Long64_t)h->GetBinContent(k);
    if (binCent>=0) cout << " ";
    printf("%1.3e\t%d\t|", binCent, binCont);
    binGrads = TMath::Nint(binCont/binScale);
    for ( j=0; j<binGrads; j++ ) cout << " ";
    cout << "|" << endl;
  }
}

//______________________________________________________________________________
// EntryList
/** 
 * Shortcut for creating a TEntryList from a TTree and a selection string.  
 * Example:
 * ```cpp
 * // for some TTree* T containing a TBranch named "x":
 * TEntryList *eL = TDuvallUtils::EntryList("x>10.5",T);
 * ```
 * \param selection -- same as for TTree:Draw()
 * \param T -- pointer to the desired *TTree*
 * \retval eList -- the resulting *TEntryList\**
 */
TEntryList* TDuvallUtils::EntryList( const char* selection, TTree *T )
{
  // init
  if (T == 0) T = (TTree*)gDirectory->FindObjectAny("T");
  if (T == 0) T = (TTree*)gDirectory->FindObjectAny("T_scint");
  if (T == 0) {
    gDirectory->Error("entryList", "No TTree* given or found.");
    return (TEntryList*)0;
  }
  // main
  TEntryList *eList;
  T->Draw(">>eList", selection, "entrylist");
  eList = (TEntryList*)gDirectory->FindObjectAny("eList");
  return eList;
}

//______________________________________________________________________________
// ExportPlots
/**
 * Extract all the TCanvas objects from a ROOT file and save them in the desired graphics format.  
 * \param filename -- desired ROOT file
 * \param kGraphicsSaveFormat -- .png, .eps, etc.
 */
void TDuvallUtils::ExportPlots( const char* filename, const TString kGraphicsSaveFormat )
{
  // for OpenGL:
  // switch default rendering engine
  const Bool_t origOGL = gStyle->GetCanvasPreferGL();
  if (! origOGL) gStyle->SetCanvasPreferGL(kTRUE);
  // set to batch mode if needed
  const Bool_t origBatch = gROOT->IsBatch();
  if (! origBatch) gROOT->SetBatch(kTRUE);
  // init
  if (filename == "") {
    if (gFile) {
      filename = gFile->GetName();
    } else {
      TString errLoc = "exportPlots.cxx";
      TString errMsg = "No filename given or fount. Exiting.";
      gROOT->Error( errLoc.Data(), errMsg.Data() );
      return;
    }
  }
  TRegexp canvasRE = "TCanvas";
  TString keyClass, keyName, savename;
  TCanvas *c;
  // get file contents
  TFile *f = TFile::Open(filename);
  TList *keys = f->GetListOfKeys(), *cans = new TList;
  TKey *key;
  TIter i(keys);
  // loop over keys
  for ( i=keys->begin(); i!=keys->end(); ++i ) {
    key = (TKey*)*i;
    keyClass.Clear();
    keyName.Clear();
    savename.Clear();
    keyClass = key->GetClassName();
    if (keyClass.Contains(canvasRE)) {
      keyName = key->GetName();
      savename = keyName+kGraphicsSaveFormat;
      c = (TCanvas*)key->ReadObj();
      cans->Add(c);
      c->Draw();
      c->SaveAs(savename.Data());
    }
  }
  // clean up
  for ( i=cans->begin(); i!=cans->end(); ++i ) {
    c = (TCanvas*)*i;
    c->Close();
  }
  // reset graphics settings if applicable
  if (! origOGL) gStyle->SetCanvasPreferGL(kFALSE);
  if (! origBatch) gROOT->SetBatch(kFALSE);
  f->Close();
}

////______________________________________________________________________________
//// IsGlobal
///**
// * Determine whether an identifier corresponds
// *   to an existing global variable.
// * Example: Check whether there is already a (global) variable named "pi":
// * ```cpp
// * TDuvallUtils::IsGlobal("pi")
// * ```
// * \param name -- variable name to check
// * \retval doesExist -- whether the variable exists
// */
//Bool_t TDuvallUtils::IsGlobal( const char* name )
//{
//  // init
//  Bool_t doesExist(kFALSE);
//  // MAIN
//  TList *list = gROOT->GetListOfGlobals();
//  if (list->FindObject(name) != 0x0) {
//    doesExist = kTRUE;
//    cerr << "Yes." << endl;
//  } else {
//    cerr << "No." << endl;
//  }
//  return doesExist;
//}

//______________________________________________________________________________
// FindMatchingObjects
/**
 *  Scan a TCollection (*TList, *TObjArray, etc.*) for an object whose name matches a regex.  
 *  ROOT's builtins can't search by PATTERN.  
 * *Note: It's hard to believe this isn't already a builtin function
 *      for all classes inheriting from TCollection;
 *      but if it exists, I haven't found it.*
 * ```cpp
 * TObject* FindMatchingObjects( TCollection *colxn, TRegexp regex, Bool_t caseSensitive=KFALSE )         // or
 * TObject* FindMatchingObjects( TCollection *colxn, const char* patter, Bool_t caseSensitive=KFALSEn )  
 * ```
 * \param colxn -- pointer to the desired *TCollection* object
 * \param patternRE -- *char\** or *TRegexp* describing search pattern 
 * \param caseSensitive -- *Bool_t* indicating whether the search should be case-sensitive
 * \retval matchingObjs -- *TList\** of matching objects 
 */
/* TObject* TDuvallUtils::FindMatchingObject( TCollection* colxn, TRegexp patternRE, Bool_t caseSensitive ) */
/* TList* TDuvallUtils::FindMatchingObjects( TCollection* colxn, TRegexp patternRE, Bool_t caseSensitive ) */
TList* TDuvallUtils::FindMatchingObjects( TCollection* colxn, TRegexp patternRE )
{
  // init
  /* if (caseSensitive) { */
  /*   enum TString::ECaseCompare exactCase = TString::kExact; */
  /* } else { */
  /*   enum TString::ECaseCompare exactCase = TString::kIgnoreCase; */
  /* } */
  TIter i(colxn);
  TObject *foundObj;
  TNamed *obj;
  TString objName;
  TList *matchingObjs = new TList;
  // main
  for ( i=colxn->begin(); i!=colxn->end(); ++i ) {
    obj = (TNamed*)*i;
    objName = obj->GetName();
    if (objName.Contains(patternRE)) matchingObjs->Add(obj);
  }
  /* // main */
  /* for ( i=colxn->begin(); i!=colxn->end(); ++i ) { */
  /*   obj = (TNamed*)*i; */
  /*   objName = obj->GetName(); */
  /*   if (objName.Contains(patternRE), exactCase) matchingObjs->Add(obj); */
  /* } */
  if ( matchingObjs->GetEntries() == 0 ) {
    printf("No matching objects found.\n");
    return 0x0;
  } else if ( matchingObjs->GetEntries() == 1 ) {
    printf("Single match found.\n");
  } else {
    printf("Multiple matches found.\n");
  }
  return matchingObjs;
}

//______________________________________________________________________________
// FindVarsOfType
/**
 * List global variables whose type matches a specified pattern.  
 * ROOT's builtins can't search by PATTERN.  
 * Examples:
 * ```cpp
 * TDuvallUtils::FindVarsOfType("canvas");           // or
 * TList *objarrList = TDuvallUtils::FindVarsOfType("TObjArray");
 * ```
 * \param varType -- search string  
 * \param kCaseSensitive -- whether search is case-sensitive
 * \retval oList -- list of matching objects  
 */
TList* TDuvallUtils::FindVarsOfType( const char* varType, Bool_t kCaseSensitive )
{
  // init
  // input
  TString varTypeStr(varType);
  Int_t varCount;
  TString gvarType;
  // gROOT list
  TCollection *gList = gROOT->GetListOfGlobals(kTRUE);
  TGlobal *gvar;
  TIter i(gList);
  // output list
  TList *oList = new TList;
  // check option and set regex
  if (! kCaseSensitive) {
    varTypeStr.ToLower();
  }
  TRegexp varRE(varTypeStr.Data());
  // loop over list
  for ( i=gList->begin(); i!=gList->end(); ++i ) {
    gvar = (TGlobal*)*i;
    gvarType.Form("%s", gvar->GetTypeName());
    if (! kCaseSensitive) {
      gvarType.ToLower();
    }
    if ( gvarType.Contains(varRE) ) {
      varCount++;
      oList->Add(gvar);
      printf("%s\t%s\n", gvar->GetTypeName(), gvar->GetName());
    }
  }
  if (varCount==0) {
    printf("No variables matching TypeName.Contains(\"%s\") found.\n", varType);
  } else if (varCount>5) {
    printf("Found %d global variables matching TypeName.Contains(\"%s\").\n", varCount, varType);
  }
  return oList;
}

//______________________________________________________________________________
// HistData
/**
 * Dump histogram data as [binLowEdge binWidth binContent] to stdout
 *  -- Primarily for use in exporting data for use in other programs
 *  -- Note: Developed for use with *TH1D\** and *TH1F\** only  
 *  -- Example:  
 *  ```cpp
 *  	TH1D* h = new TH1D("h", "h", 24, -3.5, 3.5);  
 *  	h->FillRandom("gaus");  
 *  	TDuvallUtils::HistData(h);
 *  ```
 */
void TDuvallUtils::HistData( TH1* h )
{
  Int_t k = 0, nBins = h->GetNbinsX();
  /* Double_t hMax = h->GetMaximum(); */
  Double_t binLow, binWidth;
  Long64_t binCont;
  /* printf("%16s%16s%16s\n", "binLowEdge", "binWidth", "binContent"); */
  printf("binLowEdge\tbinWidth\tbinContent\n");
  for ( k=0; k<nBins; k++ ) {
    binLow = h->GetBinLowEdge(k);
    binWidth = h->GetBinWidth(k);
    binCont = (Long64_t)h->GetBinContent(k);
    printf("%e\t%e\t%d\n", binLow, binWidth, binCont);
  }
}

//______________________________________________________________________________
// ListFiles
/**
 * Return a TList of TSystemFiles
 *   in the current (system) directory whose names
 *   match a pattern.  
 * Example:  Return a list of all files in `./Dataruns` named `Datarun0*.root`:
 * ```cpp
 * TList *fileList = TDuvallUtils::ListFiles("Dataruns/Datarun0.*\.root");
 * fileList->ls();
 * ```
 * \param pattern -- filename pattern to search, in *TRegexp* format
 * \retval fL -- TList* of matching *TSystemFile* objects
 */
TList* TDuvallUtils::ListFiles( const char* pattern )
{
  // init
  TRegexp patRE(pattern);
  TSystemDirectory *dir = new TSystemDirectory;
  TSystemFile *sf = new TSystemFile;
  TString  sfName;
  TList *fL = new TList;
  // MAIN
  dir->SetDirectory( gSystem->WorkingDirectory() );
  TList *dirFiles = dir->GetListOfFiles();
  TIter i(dirFiles);
  for ( i = dirFiles->begin(); i != dirFiles->end(); ++i ) {
    sf = (TSystemFile*)*i;
    sfName.Form( sf->GetName() );
    if ( sfName.Contains(patRE) ) fL->Add(sf);
  }
  return fL;
}

//______________________________________________________________________________
// LoadAllKeys
/**
 * Load all keys in current directory into memory  
 * **!!! USE WITH CAUTION !!!**  
 * **Large files can overload memory and crash**
 */
void TDuvallUtils::LoadAllKeys()
{
  TKey *key;
  TList *keyList = gDirectory->GetListOfKeys();
  TIter i(keyList);
  // main
  for ( i=keyList->begin(); i!=keyList->end(); ++i ) {
    key = (TKey*)*i;
    key->ReadObj();
  }
  return;
}

//______________________________________________________________________________
// LogBins
/** 
 * Wonderful shortcut for setting up log-binned histograms.  
 * Lightly adapted from code graciously provided by Marc F. Bergevin.  
 * Example:
 * ```cpp
 * Double_t *xBins = TDuvallUtils::LogBins(1.e-1, 1.e5);
 * TH1D *h = new TH1D("h", "h", xBins);
 * h->FillRandom("landau");
 * h->Draw();
 * gPad->SetLogx(kTRUE);
 * ```
 */
Double_t* TDuvallUtils::LogBins( Double_t xmin, Double_t xmax )
{
  // array size is currently hard-coded at 100 //HC//
  const Int_t N = 100;
  static Double_t xBins[N];
  Double_t logxmin = TMath::Log10(xmin);
  Double_t logxmax = TMath::Log10(xmax);
  Double_t binwidth = (logxmax-logxmin)/N;
  Double_t xBins[N+1];
  xBins[0] = xmin;
  for (Int_t m=1;m<=N;m++) {
    xBins[m] = TMath::Power(10,logxmin+m*binwidth);
  }
  return xBins;
}

/* // for reference to recreate as templated function */
/* //______________________________________________________________________________ */
/* // PrintArrayD */
/* void TDuvallUtils::PrintArrayD( Int_t N, Double_t* x ) */
/* { */
/*   for (Int_t k=0; k<N; k++) cout << x[k] << endl; */
/* } */

//______________________________________________________________________________
// PrintBranches
/**
 * Print a TTree's branches in a format that is
 *   easier to scan visually than TTree::GetListOfBranches()->ls().  
 * For a full explanation of the data-type codes, see the main *TTree* documentation
 *   or the comments in `TTree.cxx` under your your $ROOTSYS directory.
 *   (On _*nix_ systems, try `find $ROOTSYS -name TTree.cxx` to locate the file).  
 * Common data types:  
 * - I : 32-bit signed integer (Int_t)
 * - L : 64-bit signed integer (Long64_t)
 * - F : 32-bit float (Float_t)  
 * - D : 64-bit float (Double_t)  
 * - C : null-terminated character string (char array, TString)  
 * - O : boolean (Bool_t)  
 * - -- : compound data type (e.g., *TVector3*, *TMatrixD*, etc.)  
 * \param obj -- *TTree\** or *TBranch\** 
 */
void TDuvallUtils::PrintBranches(TObject *obj)
{
  // arg check
  if ( obj->InheritsFrom("TTree") ) {
    TTree *Obj = (TTree*)obj;
  } else if ( obj->InheritsFrom("TBranch") ) {
    TBranch *Obj = (TBranch*)obj;
  } else {
    gROOT->Error("TDuvallUtils::PrintBranches", "Argument type must be either TTree* or TBranch*.");
    return;
  }
  // init
  TObjArray *branches = Obj->GetListOfBranches();
  TIter i(branches);
  TBranch *br;
  TString brTit, brType;
  TString header = TString::Format("%24s%4s%12s%4s%12s", "Name", " ", "Simple Type", " ", "Entries");
  TString separator('=',56);
  Ssiz_t delim;
  // main
  printf("%s\n%s\n", header.Data(), separator.Data());
  for ( i=branches->begin(); i!=branches->end(); ++i ) {
    br = (TBranch*)*i;
    brTit = br->GetTitle();
    delim = brTit.Index('/');
    if ( delim == -1 ) {
      brType = "--";
    } else {
      brType = brTit( delim+1, brTit.Length()-1 );
    }
    printf("%24s%4s%12s%4s%12d\n", br->GetName(), " ", brType.Data(), " ", br->GetEntries());
  }
  printf("\n");
}

//______________________________________________________________________________
// Prob2Sig
/**
 * Simple function to convert a probability to a corresponding
 *   Gaussian significance level.  
 * This probably already exists as a built-in function somewhere,
 *      but I'm adding it here for convenience.
 * \param prob -- decimal probability on [0,1]
 * \retval sigma -- significance
 */
Double_t TDuvallUtils::Prob2Sig( Double_t prob )
{
  // convert, accounting for special values
  Double_t sigma;
  if ( prob == 1. ) {
    sigma = TMath::Infinity();
  } else if ( prob == 0. ) {
    sigma = 0.;
  } else {
    sigma = TMath::Sqrt2() * TMath::ErfInverse(prob);
  }
  return sigma;
}

//______________________________________________________________________________
// RadarPlot
/**
 * Simple macro to redraw any 1-D histogram as a radar plot.  
 * \param h_in -- input histogram (*TH1D\**)
 * \param ho -- drawing option(s)
 * \param kClean -- when *kTRUE*, disables all annotations
 * \param kNewCanvas -- when *kTRUE*, creates a new *TCanvas* rather than
 *   drawing over the current graphics pad
 * \retval can_r -- canvas containing radar plot
 */
TCanvas* TDuvallUtils::RadarPlot( TH1D *h_in, Option_t *ho, const Bool_t kClean, const Bool_t kNewCanvas )
{
  // force proportional scaling
  gStyle->SetHistMinimumZero(kTRUE);
  // init
  TString hoptString = TString::Format("same%s", ho);
  Option_t *hopt(hoptString);
  Int_t k = 0, N = h_in->GetNbinsX();
  Double_t xlow = h_in->GetBinLowEdge(0);
  Double_t xup = h_in->GetBinLowEdge(N) + h_in->GetBinWidth(N);
  TString newName(h_in->GetName()), newTitle(h_in->GetTitle()), newCanName, newCanTitle;
  newName.Append("_radar");
  newCanName.Form("can_%s", newName.Data());
  newCanTitle = newName;
  // copy bin contents into new histogram
  TH2D *h_out = new TH2D( newName.Data(), newTitle.Data(), N, xlow, xup, 1, 0., 1. );
  h_out->SetLineColor(h_in->GetLineColor());
  h_out->SetLineWidth(5.);
  h_out->SetStats(0);
  for ( k=0; k<=N; k++ ) {
    h_out->SetBinContent( k, 1, h_in->GetBinContent(k) ); //KEEPME
  }
  // set up scale
  Double_t hinMax = h_in->GetMaximum();
  Int_t pow10 = TMath::Nint(TMath::Ceil(TMath::Log10(hinMax)));
  Int_t scaleMax = TMath::Nint(hinMax);
  Int_t j = 0, nScaleRings = 5, scaleStep = TMath::Nint(1.*hinMax/nScaleRings);
  TH2D *h_scale = new TH2D( "h_scale", "scale for radar plot", N, xlow, xup, nScaleRings, 0., scaleMax );
  h_scale->SetLineColor(16);
  h_scale->SetLineWidth(2.);
  h_scale->SetStats(0);
  for ( k=0; k<=N; k++ ) {
    for ( j=0; j<=nScaleRings; j++ ) h_scale->SetBinContent( k, j, (nScaleRings-j)*scaleStep );
  }
  // scale "axis indicators"
  Double_t markerR = 1.;
  TPolyMarker3D *p0 = new TPolyMarker3D(1);
  p0->SetMarkerColor(kBlack);
  p0->SetMarkerSize(2.5);
  TPolyMarker3D *p90 = p0->Clone("p90");
  TPolyMarker3D *p180 = p0->Clone("p180");
  TPolyMarker3D *p270 = p0->Clone("p270");
  p0->SetMarkerStyle(8);
  p90->SetMarkerStyle(22);
  p180->SetMarkerStyle(21);
  p270->SetMarkerStyle(23);
  p0->SetPoint(0, -markerR, 0., 0.);
  p90->SetPoint(0, 0., -markerR, 0.);
  p180->SetPoint(0, markerR, 0., 0.);
  p270->SetPoint(0, 0., markerR, 0.);
  // draw radar plot
  if (kNewCanvas) TCanvas *can_out = new TCanvas(newCanName.Data(), newCanTitle.Data());
  gPad->SetLogx(kFALSE);
  gPad->SetLogy(kFALSE);
  h_in->Draw("A");
  if (kClean) {
    h_in->SetTitle("");
    h_in->SetStats(0);
    gPad->SetFrameLineColor(gPad->GetFillColor());
  }
  TView3D *view = new TView3D;
  view->RotateView(.001, .001);
  h_scale->Draw("samecyllego");
  h_out->Draw(hopt);
  // annotations
  if (!kClean) {
    // radial legend
    TLegend *l_radial = new TLegend(.05, .01, .65, .1);
    l_radial->SetName("leg_radial");
    l_radial->SetNColumns(2);
    l_radial->SetTextSize(.024);
    TString gridRings, gridMax;
    gridRings.Form( "Grid Scale = %d entries / ring     Grid Maximum = %d entries", scaleStep, scaleMax );
    l_radial->AddEntry( h_scale, gridRings.Data() );
    l_radial->Draw();
    // angular legend
    TLegend *l_angular = new TLegend(.65, .01, .95, .1);
    l_angular->SetName("leg_angular");
    l_angular->SetNColumns(2);
    TString angMark0("0^{o}"), angMark90("+90^{o}"), angMark180("#pm180^{o}"), angMark270("-90^{o}");
    l_angular->AddEntry(p0, angMark0.Data(), "P");
    l_angular->AddEntry(p90, angMark90.Data(), "P");
    l_angular->AddEntry(p180, angMark180.Data(), "P");
    l_angular->AddEntry(p270, angMark270.Data(), "P");
    l_angular->Draw();
    // draw angular markers
    p0->Draw();
    p90->Draw();
    p180->Draw();
    p270->Draw();
  }
  // paint over the weird extra lines ROOT keeps wanting to draw
  TPave *boxL = new TPave(0., 0.49, 0.099, 0.51, 0., "blNDC");
  TPave *boxR = new TPave(0.901, 0.49, 1., 0.51, 0., "blNDC");
  boxL->SetFillColor(0);
  boxR->SetFillColor(0);
  boxL->Draw();
  boxR->Draw();
  // all pau!   )
  TCanvas *can_r = gPad->GetCanvas();
  return can_r;
}

//______________________________________________________________________________
// ShiftStats
/**
 * Convenience function to translate the stats box.  
 * Primarily intended for keeping the stats box from blocking
 *    the top of the color scale when histograms are drawn
 *    with "colz" and similar options.
 */
void TDuvallUtils::ShiftStats( TVirtualPad* p, Double_t deltaX, Double_t deltaY )
{
  // init
  TPaveStats* s = p->GetPrimitive("stats");
  if (s == 0x0) return;
  Double_t x1, x2, y1, y2;
  // get current position
  x1 = s->GetX1NDC();
  x2 = s->GetX2NDC();
  y1 = s->GetY1NDC();
  y2 = s->GetY2NDC();
  // set new position
  s->SetX1NDC(x1 + deltaX);
  s->SetX2NDC(x2 + deltaX);
  s->SetY1NDC(y1 + deltaY);
  s->SetY2NDC(y2 + deltaY);
  // draw
  s->Draw();
  return;
}

//______________________________________________________________________________
// Sig2Prob
/** Simple function to a Gaussian convert significance level
 *    to its corresponding probability.  
 * This probably already exists as a built-in function somewhere,
 *      but I'm adding it here for convenience.
 * \param sig -- significance
 * \retval prob -- decimal probability on [0,1]
 */
Double_t TDuvallUtils::Sig2Prob( Double_t sig )
{
// convert, accounting for special values
  Double_t prob;
  if (sigma == TMath::Infinity()) {
    prob = 1.;
  } else if ( sigma == 0. ) {
    prob = 0.;
  } else {
    prob = TMath::Erf( sigma / TMath::Sqrt2() );
  }
  return prob;
}

//______________________________________________________________________________
// UnbinnedKSTest
/**
 * Function to execute *unbinned* Kolmogorov-Smirnov Test on a pair of TTrees.  
 * *Note: Branches must be of type Double_t.*  
 * See the notes in TMath::KolmogorovTest() and TH1::KolmogorovTest() for further details.  
 * \param T1, T2 -- input trees
 * \param branchName1 -- name of variable in *T1*
 * \param branchName2 -- name of variable in *T2* (if different from *branchName1*)
 * \retval P -- probability that the distributions were drawn from the same parent distribution,
 *   according to the K-S Test
 */
Double_t TDuvallUtils::UnbinnedKSTest( TTree *T1, TTree *T2, const char* branchName1, const char* branchName2)
{
  // Note: Arrays must be sorted before they can be
  //   fed to TMath::KolmogorovTest!
  // init
  // basics
  if (branchName2 = "") branchName2 = branchName1;
  Double_t P;
  Double_t q1, q2; // quantity1, quantity2
  Int_t k;
  Int_t N1 = (Int_t)T1->GetEntries();
  Int_t N2 = (Int_t)T2->GetEntries();
  // TBranches
  TBranch *br1 = T1->GetBranch(branchName1);
  TBranch *br2 = T2->GetBranch(branchName2);
  if ( (br1==0x0) | (br2==0x0) ) {
    gFile->Error("unbinnedKSTest", "Specified branch missing from one or both TTrees.");
    return TMath::QuietNaN();
  }
  T1->SetBranchAddress(branchName1, &q1);
  T2->SetBranchAddress(branchName2, &q2);
  // raw arrays
  Double_t *arr1 = new Double_t[N1];
  Double_t *arr2 = new Double_t[N2];
  // index arrays
  Int_t *ind1 = new Int_t[N1];
  Int_t *ind2 = new Int_t[N2];
  // sorted arrays
  Double_t *arr1S = new Double_t[N1];
  Double_t *arr2S = new Double_t[N2];
  // fill, sort, re-fill (use kFALSE to sort ascending)
  // Note on N1,N2 loops: Yes, there is a more-efficient (single-loop) way to do this;
  // but the switching is non-trivial and code running today is better than code in debug tomorrow, right? (Right?)
  // first fill
  for ( k=0; k<N1; k++ ) {
    T1->GetEntry(k);
    arr1[k] = q1;
  }
  for ( k=0; k<N2; k++ ) {
    T2->GetEntry(k);
    arr2[k] = q2;
  }
  // sort
  TMath::Sort(N1, arr1, ind1, kFALSE);
  TMath::Sort(N2, arr2, ind2, kFALSE);
  // second fill
  for ( k=0; k<N1; k++ ) {
    arr1S[k] = arr1[ind1[k]];
  }
  for ( k=0; k<N2; k++ ) {
    arr2S[k] = arr2[ind2[k]];
  }
  // MAIN: Finally ready to calculate the K-S probability
  // NOTE: THE "OPTION" ARGUMENT IS (ironically) NOT OPTIONAL, EVEN IF EMPTY!
  P = TMath::KolmogorovTest( N1, arr1S, N2, arr2S, "" );
  // all pau!   )
  return P;
}

//______________________________________________________________________________
// Zoom
/**
 * Simple shortcut for adjusting zoom when running interactively.
 */
void TDuvallUtils::Zoom( Double_t zoomFactor )
{
  if (gPad==0x0) {
    gROOT->Error("TDuvallUtils::Zoom", "gPad not found.");
    return;
  }
  TView3D *view = gPad->GetView();
  if (view==0x0) {
    gPad->Error("TDuvallUtils::Zoom", "TView not found; this function is for zooming 3D views only.");
    return;
  }
  view->ZoomView(gPad, zoomFactor);
  return;
}

////______________________________________________________________________________
//TDuvallUtils::
//{
//}

////______________________________________________________________________________
//TDuvallUtils::
//{
//}


