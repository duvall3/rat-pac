// TRefMatch -- class for implementing the reference-matching algorithm
//   described in this repository at $RATROOT/user/ref_matching/README.{md,html}

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

#include <TRefMatch.h>
#include "TMath.h"
#include "TH1D.h"

// Call the ClassImp() macro to give the TRefMatch class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TRefMatch);
#endif

//______________________________________________________________________________
// default ctor
TRefMatch::TRefMatch()
{
  SetName("TRefMatch");
  SetTitle("class for implementing KS-test reference-matching algorithm");
  fTestFileName = "";
  fTestTreeName = "";
  fTestVarName = "";
  fTestSampleFile = 0x0;
  fTestSampleTree = 0x0;
  fTestSampleBranch = 0x0;
  fReferenceFileList = new TList;
  fOutFile = 0x0;
}

//______________________________________________________________________________
// regular ctor
TRefMatch::TRefMatch( const char* fileName, const char* treeName, const char* branchVarName )
{
  SetName("TRefMatch");
  SetTitle("class for implementing KS-test reference-matching algorithm");
  fTestFileName = fileName;
  fTestTreeName = treeName;
  fTestVarName = branchVarName;
  fTestSampleFile = TFile::Open( fTestFileName );
  fTestSampleTree = (TTree*)gDirectory->Get(fTestTreeName);
  if (fTestSampleTree) {
    fTestSampleBranch = fTestSampleTree->GetBranch(fTestVarName);
  } else {
    fTestSampleBranch = 0x0;
  }
  fReferenceFileList = new TList;
}

/* //______________________________________________________________________________ */
/* // initialize: validate and fill members */
/* TRefMatch::Init() */
/* { */
/*   // if all of the above succeed, create outfile (don't overwrite) */
/*   TSystemDirectory *wd = new TSystemDirectory; */
/*   wd->SetDirectory(gSystem->WorkingDirectory()); */
/*   TString outFileName(fTestSampleFile->GetName()); */
/*   outFileName.ReplaceAll("\.root$", "_RefMatch.root"); */
/*   Bool_t kOutFileExists = wd->GetListOfFiles()->FindObject(outFileName.Data()); */
/*   if kOutFileExists { */
/*     Int_t kFileCounter(1); */
/*     TString duplicateOutFileName = outFileName; */
/*     while (kOutFileExists) { */
/*       duplicateOutFileName.ReplaceAll("[0-9]+\.root", TString::Format("%d.root",kFileCounter)); */
/*       kOutFileExists = wd->GetListOfFiles()->FindObject(outFileName.Data()); */
/*     } */
/*     outFileName = duplicateOutFileName; */
/*   } */
/*   fOutFile = TFile::Open( outFileName.Data(), "create" ); */
/* } */

//______________________________________________________________________________
// initialize: validate and fill members
TRefMatch::Init()
{
  // if all of the above succeed, create outfile
  TSystemDirectory *wd = new TSystemDirectory;
  wd->SetDirectory(gSystem->WorkingDirectory());
  TString outFileName(fTestSampleFile->GetName());
  outFileName.ReplaceAll("\.root$", "_RefMatch.root");
  fOutFile = TFile::Open( outFileName.Data(), "recreate" );
  printf( "Init complete. Created output file %s at %#lx.\n", fOutFile->GetName(), fOutFile);
}

////______________________________________________________________________________
//TRefMatch::
//{
//}

////______________________________________________________________________________
//TRefMatch::
//{
//}

////______________________________________________________________________________
//TRefMatch::
//{
//}

//______________________________________________________________________________
// override ls
TRefMatch::ls()
{
  if (fTestSampleFile!=0x0) {
    cout << IsA()->GetName() << " " << GetName() << " for file " << fTestSampleFile->GetName();
  } else {
    cout << "Uninitialized " << IsA()->GetName();
  }
  cout << "\tat: " << this << endl;
}

//______________________________________________________________________________
// override print
TRefMatch::Print()
{
  printf("%s:\t%s:\t%s\n", IsA()->GetName(), GetName(), GetTitle());
  if (fTestSampleFile==0x0) {
    printf("Uninitialized.\n");
    return;
  }
  printf("Test File Name: %s\n", fTestFileName);
  printf("Test Tree Name: %s\n", fTestTreeName);
  printf("Test Branch/Var Name: %s\n", fTestVarName);
  printf("Reference File List: TList* at: %#lx\n", fReferenceFileList);
  if (fTestSampleFile!=0x0) printf("Test File: %s at: %#lx\n", fTestSampleFile->GetName(), fTestSampleFile);
  if (fTestSampleTree!=0x0) printf("Test Tree: %s at: %#lx\n", fTestSampleTree->GetName(), fTestSampleTree);
  if (fTestSampleBranch!=0x0) printf("Test Branch: %s at: %#lx\n", fTestSampleBranch->GetName(), fTestSampleBranch);
}


