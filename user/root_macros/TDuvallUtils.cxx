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

#include <TDuvallUtils.h>

//______________________________________________________________________________
// DumpHist -- simple function to dump TH1 data as (x,y) pairs to stdout,
//   along with a rough ASCII representation of the graph
// -- Note: Developed for use with TH1D and TH1F only
// -- Example:
// 	TH1D* h = new TH1D("h", "h", 30, -3.5, 3.5);
// 	h->FillRandom("gaus");
// 	TDuvallUtils::DumpHist(h);
TDuvallUtils::DumpHist( TH1* h )
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
// EntryList -- shortcut for creating a TEntryList from a TTree and a selection string
TDuvallUtils::EntryList( const char* selection, TTree *T );
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
TDuvallUtils::ExportPlots( const char* filename, const TString kGraphicsSaveFormat )
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
//TDuvallUtils::
//{
//}

////______________________________________________________________________________
//TDuvallUtils::
//{
//}

////______________________________________________________________________________
//TDuvallUtils::
//{
//}

//______________________________________________________________________________
// PrintArrayD
TDuvallUtils::PrintArrayD( Int_t N, Double_t* x )
{
  for (Int_t k=0; k<N; k++) cout << x[k] << endl;
}

////______________________________________________________________________________
//TDuvallUtils::
//{
//}

////______________________________________________________________________________
//TDuvallUtils::
//{
//}


