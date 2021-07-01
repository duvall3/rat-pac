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
#include "TMap.h"
#include "TObjString.h"
#include "TObjArray.h"

// Call the ClassImp() macro to give the TDuvallAnalyze class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TDuvallAnalyze);
#endif

TString defaultName = "TDuvallAnalyze";
TString defaultTitle = "class for analyzing RAT-PAC IBD runs";

//______________________________________________________________________________
// default constructor
TDuvallAnalyze::TDuvallAnalyze()
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = 0;
  fExperiment = "";
  fExperimentPath = "";
}

////______________________________________________________________________________
//// primary constructor
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
// fileName-only constructor
TDuvallAnalyze::TDuvallAnalyze( const char* fileName )
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = TFile::Open(fileName);
  TMap* db = (TMap*)fFile->FindObjectAny("db");
  if ( db == 0x0 ) {
    Warning(ClassName, "RAT-PAC database not found in "+fFile->GetName()+".");
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

////______________________________________________________________________________
//// fileName-only constructor
//TDuvallAnalyze::TDuvallAnalyze( const char* fileName )
//{
//  TDuvallAnalyze d =  TDuvallAnalyze( defaultName, defaultTitle, fileName );
//  return d;
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
//fileName = GetFile();
  Name = GetName();
  Title = GetTitle();
  printf("%s\t%s\t%s\n", className.Data(), Name.Data(), Title.Data());
//printf("ROOT file:\t%s\n", fileName.Data());
}

////______________________________________________________________________________
//// apply cut
//TDuvallAnalyze::ApplyCut (
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
//TDuvallAnalyze::
//{
//}

//// Call the ClassImp() macro to give the TDuvallAnalyze class RTTI and full I/O capabilities.
//#if !defined(__CLING__)
//    ClassImp(TDuvallAnalyze);
//#endif

// all pau!   )
