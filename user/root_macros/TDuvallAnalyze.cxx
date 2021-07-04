// TDuvallAnalyze -- master object for analyzing RAT-PAC IBD runs
//   using functionality from github.com > duvall3 > rat-pac > \
//     collab > user > root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/2021 ~ //
// -- partial motivation: flexibility for scint. bursts vs. raw MC

//Copyright (C) 2021 Mark J. Duvall
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

#include <TDuvallAnalyze.h>

// Call the ClassImp() macro to give the TDuvallAnalyze class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TDuvallAnalyze);
#endif

const TString defaultName = "DuvAn";
const TString defaultTitle = "class for analyzing RAT-PAC IBD runs";
const char* defaultTree = "T";  //TEMP
//const TCut defaultCut = "(deltaT>1.e-6)&&(deltaT<100.e-6)";
const TCut defaultCut = "";

//______________________________________________________________________________
// default ctor
TDuvallAnalyze::TDuvallAnalyze()
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = 0;
  fFileName = "";
  fExperiment = "";
  fExperimentPath = "";
  fTree = 0;
  fCut = "";
  fCutList = new TObjArray;
  fCanList = new TObjArray;
  fHistList = new TObjArray;
}

//______________________________________________________________________________
// fileName-only ctor
TDuvallAnalyze::TDuvallAnalyze( const char* fileName )
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  LoadFile(fileName);
}

//______________________________________________________________________________
// primary ctor
TDuvallAnalyze::TDuvallAnalyze( const char* name, const char* title, const char* fileName )
{
  SetName(name);
  SetTitle(title);
  LoadFile(fileName);
}

//______________________________________________________________________________
// LoadFile
TDuvallAnalyze::LoadFile( const char* fileName )
{
  fFile = TFile::Open(fileName);
  fFileName = fFile->GetName();
  FindExperiment();
  fTree = (TTree*)fFile->FindObjectAny(defaultTree);
  fCut = defaultCut;
  fCutList = new TObjArray;
  fCanList = new TObjArray;
  fHistList = new TObjArray;
}

//______________________________________________________________________________
// FindExperiment
TDuvallAnalyze::FindExperiment()
{
  TMap* db = (TMap*)fFile->FindObjectAny("db");
  if ( db == 0x0 ) {
    TString warnLoc = Class_Name();
    warnLoc.Append("::FindExperiment");
    TString warnMsg = "RAT-PAC database not found in ";
    warnMsg.Append(fFileName);
    warnMsg.Append("; experiment name and path unknown.");
    Warning(warnLoc.Data(), warnMsg.Data());
    fExperiment = "";
    fExperimentPath = "";
  } else {
    TPair* tp = db->FindObject("DETECTOR[].experiment");
    TObjString* tos = tp->Value();
    fExperimentPath = tos->GetString();
    fExperimentPath.ReplaceAll("\"", "");
    TString experimentPath = fExperimentPath;
    TObjArray* toa = experimentPath.Tokenize("/");
    tos = (TObjString*)toa->At(toa->GetEntries()-1);
    fExperiment = tos->GetString();
  }
}

////______________________________________________________________________________
//TDuvallAnalyze::
//{
//}

//______________________________________________________________________________
// ShowCuts
TDuvallAnalyze::ShowCuts()
{
  fCut.Print();
}

//______________________________________________________________________________
// CombineCuts
TDuvallAnalyze::CombineCuts()
{
  fCut.Clear();
  TCut* c;
  TCut C;
  TIter i(fCutList);
  while (( c = (TCut*)i.Next() )) {
    C = (*c);
    fCut = fCut && C;
  }
}

//______________________________________________________________________________
// AddCut
TDuvallAnalyze::AddCut( TCut* c )
{
  fCutList->Add(c);
  CombineCuts();
}

//______________________________________________________________________________
// overload AddCut
TDuvallAnalyze::AddCut( const char* cut )
{
  TCut* c = new TCut(cut);
  AddCut(c);
}

//______________________________________________________________________________
// ClearCuts
TDuvallAnalyze::ClearCuts()
{
  fCut.Clear();
  fCutList->Clear();
}

//______________________________________________________________________________
// ResetCuts
TDuvallAnalyze::ResetCuts()
{
  fCut = defaultCut;
  fCutList->Clear();
  TCut* c = &defaultCut;
  fCutList->Add(c);
}

//______________________________________________________________________________
// DrawHist
TDuvallAnalyze::DrawHist( const char* varexp )
{
  // init
    TString vars(varexp);
    TString can_name(vars);
    TString h_name(vars);
    can_name.ReplaceAll(":","");
    h_name.ReplaceAll(":","");
    can_name.Prepend("c_");
    h_name.Prepend("h_");
    if ( fCanList->FindObject(can_name.Data()) == 0x0 ) {
      TCanvas* c = new TCanvas(can_name.Data(), can_name.Data(), 800, 100, 1000, 1000);
      fCanList->Add(c);
    } else {
      c = (TCanvas*)fCanList->FindObject(can_name.Data());
      c->cd();
    }
    // draw
    vars = vars + ">>" + h_name;
    fTree->Draw( vars.Data(), fCut );
    auto h = c->FindObject(h_name.Data());
    fHistList->Add(h);
//  if ( (inhTH2) && !(inhTH3) ) h->Draw("colz");
//  if ( h->InheritsFrom("TH2") ) h->Draw("colz");
//  h->Draw("colz");  // doesn't work for some reason
}

//______________________________________________________________________________
// RtToRoot
TDuvallAnalyze::RtToRoot( const char* rt_file )
{
  if ( ! gInterpreter->IsLoaded("rt_to_root.cxx") ) gROOT->LoadMacro("rt_to_root.cxx");
  rt_to_root(rt_file);
}

//______________________________________________________________________________
// SEDAQ
//TDuvallAnalyze::SEDAQ( const char* fileName, Bool_t kGraphics, Double_t promptLow, Double_t delayedLow, Double_t deltaTLow, Double_t deltaTHigh, Bool_t kNuLat )
TDuvallAnalyze::SEDAQ( const char* fileName )
{
  if ( ! gInterpreter->IsLoaded("SEDAQ.cxx") ) gROOT->LoadMacro("SEDAQ.cxx");
//SEDAQ( fileName, kGraphics, promptLow, delayedLow, deltaTLow, deltaTHigh, kNuLat );
  SEDAQ( fileName, kTRUE, 0., 0., 1.e-6, 100.e-6, kFALSE );
}

//______________________________________________________________________________
// AngularRecon
//TDuvallAnalyze::AngularRecon( const char* fileName, Bool_t kGraphics )
  TDuvallAnalyze::AngularRecon( const char* fileName )
{
  if ( ! gInterpreter->IsLoaded("angularRecon.cxx") ) gROOT->LoadMacro("angularRecon.cxx");
//angularRecon( fileName, kGraphics );
  angularRecon( fileName );
}

//______________________________________________________________________________
// RATPACEventViewer
//TDuvallAnalyze::RATPACEventViewer( const char* fileName, TString cellExpr )
TDuvallAnalyze::RATPACEventViewer()
{
  if ( ! gInterpreter->IsLoaded("RATPACEventViewer.cxx") ) gROOT->LoadMacro("RATPACEventViewer.cxx");
//RATPACEventViewer( fileName, cellExpr );
  RATPACEventViewer();
}

//______________________________________________________________________________
// Analyze
TDuvallAnalyze::Analyze()
{
  TString datarunName = fFileName;
  datarunName = datarunName(0, datarunName.Index(".root"));
  TString rtFileName = datarunName;
  rtFileName.Append(".rt");
  TString sedaqFileName = datarunName;
  sedaqFileName.Append("_T.root");
  TString arFileName = datarunName;
  arFileName.Append("_results.root");
  RtToRoot(rtFileName);
  SEDAQ(sedaqFileName);
  AngularRecon(arFileName);
  // TODO: send cuts to SEDAQ
  // TODO: send resutls to AngularRecon
}

////______________________________________________________________________________
//TDuvallAnalyze::
//{
//}

////______________________________________________________________________________
//TDuvallAnalyze::
//{
//}

////______________________________________________________________________________
//TDuvallAnalyze::
//{
//}

////______________________________________________________________________________
//// override ls
//TDuvallAnalyze::ls()
//{
//}

//______________________________________________________________________________
// override Print
TDuvallAnalyze::Print()
{
  TString treeName;
  if ( fTree != 0x0 ) {
    treeName = fTree->GetName();
  } else {
    treeName = "";
  }
  printf("\n");
  printf("%s\t%s\t%s\n", Class_Name(), GetName(), GetTitle());
  printf("Experiment:\t%s\n", fExperiment.Data());
  printf("ROOT File:\t%s\n", fFileName);
  printf("Current Tree:\t%s\n", treeName.Data());
  printf("Current Cuts:\t%s\n", fCut.GetTitle());
//fCutList->ls(); //temp
//fHistList->ls(); //temp
  printf("\n");
}

// all pau!   )
