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
const TCut defaultCut = "";
const char* defaultTree = "T_xyz";  //TEMP

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
  fCut = "";
  fCutList = new TObjArray;
  fCanList = new TObjArray;
}

//______________________________________________________________________________
// fileName-only ctor
TDuvallAnalyze::TDuvallAnalyze( const char* fileName )
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = TFile::Open(fileName);
  Init();
}

//______________________________________________________________________________
// primary ctor
TDuvallAnalyze::TDuvallAnalyze( const char* name, const char* title, const char* fileName )
{
  SetName(name);
  SetTitle(title);
  fFile = TFile::Open(fileName);
  Init();
}

//______________________________________________________________________________
// Init
TDuvallAnalyze::Init()
{
  fFileName = fFile->GetName();
  FindExperiment();
  fTree = (TTree*)fFile->FindObjectAny(defaultTree);
  fCut = defaultCut;
  fCutList = new TObjArray;
  fCanList = new TObjArray;
}

//______________________________________________________________________________
// FindExperiment
TDuvallAnalyze::FindExperiment()
{
  TMap* db = (TMap*)fFile->FindObjectAny("db");
  if ( db == 0x0 ) {
    Warning(ClassName, "RAT-PAC database not found in "+fFile->GetName()+". Experiment name and path unknown.");
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
//  if ( (inhTH2) && !(inhTH3) ) h->Draw("colz");
//  if ( h->InheritsFrom("TH2") ) h->Draw("colz");
    h->Draw("colz");  // doesn't work for some reason
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
  printf("\n");
  printf("%s\t%s\t%s\n", Class_Name(), GetName(), GetTitle());
  printf("ROOT file:\t%s\n", GetFileName());
  printf("Tree:\t\t%s\n", fTree->GetName());
  printf("Current cuts:\t%s\n", fCut.GetTitle());
//fCutList->ls();
  printf("\n");
}

// all pau!   )
