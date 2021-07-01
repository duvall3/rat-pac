// TDuvallAnalyze -- master object for analyzing RAT-PAC IBD runs
//   using functionality from github.com > duvall3 > rat-pac > \
//     collab > user > root_macros
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/2021 ~ //
// -- partial motivation: flexibility for bursts vs. raw MC

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

TString defaultName = "D";
TString defaultTitle = "class for analyzing RAT-PAC IBD runs";
TCut defaultCut = "";

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
  fCutList = 0;
}

////______________________________________________________________________________
//// primary ctor
//TDuvallAnalyze::TDuvallAnalyze( const char* name, const char* title, const char* fileName )
//{
//  SetName(name);
//  SetTitle(title);
//  fFile = TFile::Open(fileName);
//  TMap* db = (TMap*)fFile->FindObjectAny("db");
//  if ( db == 0x0 ) {
//    Warning(ClassName, "RAT-PAC database not found in "+fFile->GetName()+".");
//  } else {
//    TPair* tp = db->FindObject("DETECTOR[].experiment");
//    TObjString* tos = tp->Value();
//    fExperimentPath = tos->GetString();
//    fExperimentPath.ReplaceAll("\"", "");
//    TString experimentPath = fExperimentPath;
//    TObjArray* toa = experimentPath.Tokenize("/");
//    tos = (TObjString*)toa->At(toa->GetEntries()-1);
//    fExperiment = tos->GetString();
//  } //endif
//}

//______________________________________________________________________________
// fileName-only ctor
TDuvallAnalyze::TDuvallAnalyze( const char* fileName )
{
  // init
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = TFile::Open(fileName);
  fFileName = fFile->GetName();
  fCut = defaultCut;
  fCutList = new TList;
//AddCut(defaultCut);
  fCutList->Add(&defaultCut);
  // get experiment
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
  } //endif
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
  for ( TIter i=fCutList->begin(); i!=fCutList->end(); ++i ) {
    c = (TCut*)*i;
    fCut = fCut && (*c);
  }
}

//______________________________________________________________________________
// AddCut
TDuvallAnalyze::AddCut( TCut newCut )
{
  TCut* newCutptr = &newCut;
  fCutList->Add(newCutptr);
  CombineCuts();
//fCut = fCut+newCut;
//return fCut;
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
//  TString name(this->GetName()), title(this->GetTitle()), classname(this->Class_Name());
//  if (fName.IsNull()) name = defaultName;
//  if (fTitle.IsNull()) title = defaultTitle;
//  cout << classname << "\t\t" << name << ":\t\t" << title << endl;
//}

//______________________________________________________________________________
//override print
TDuvallAnalyze::Print()
{
  TString className, fileName, Name, Title;
  className = Class_Name();
  fileName = GetFileName();
  Name = GetName();
  Title = GetTitle();
  TCut Cuts = GetCuts();
  printf("%s\t%s\t%s\n", className.Data(), Name.Data(), Title.Data());
  printf("ROOT file:\t%s\n", fileName.Data());
  printf("Current cuts:\t%s\n", fCut.GetTitle());
}

// all pau!   )
