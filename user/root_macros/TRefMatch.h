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

#ifndef TRefMatch
#define TRefMatch

#include "TFile.h"
#include "TClass.h"
#include "TList.h"

class TRefMatch : public TClass {

private:
  // members
  const char*		fTestFileName;		// name of file containing data sample to be tested
  const char*		fTestTreeName;		// name of tree containing data sample to be tested
  const char*		fTestVarName;		// name of branch/variable containing data sample to be tested
  TFile*		fTestSampleFile;	// address of test-sample file 
  TTree*		fTestSampleTree;	// address of test-sample tree
  TBranch*		fTestSampleBranch;	// address of test-sample branch
  TList*		fReferenceFileList;	// list of files containing reference distributions
  TFile*		fOutFile;		// output file

private:
  // methods
  /* void			Init();			// initialize: validate and fill members */
  // setters:

public:
  // methods
  // ctors and inits
  TRefMatch();
  TRefMatch( const char* fileName, const char* treeName = "T", const char* branchVarName = "phi" );
  void			Init();			// initialize: validate and fill members // TEMP PUBLIC
  void			Init( const char* fileName, const char* treeName, const char* branchVarName );
  // getters:
  const char* GetFileName() { return fTestFileName; }
  const char* GetTreeName() { return fTestTreeName; }
  const char* GetVarName() { return fTestVarName; }
  TFile* GetFile() { return fTestSampleFile; }
  TTree* GetTree() { return fTestSampleTree; }
  TBranch* GetBranch() { return fTestSampleBranch; }
  TList* GetReferenceFileList() { return fReferenceFileList; }
  const char* GetOutFile() { return fOutFile; }



//Integrating the TRefMatch class to ROOT.
ClassDef(TRefMatch,1)

}; //end class

// all pau!   )
#endif
