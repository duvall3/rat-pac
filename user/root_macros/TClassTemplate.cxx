// TClassTemplate -- basic template for writing ROOT classes
// -- Note: For CINT, load using gROOT->LoadMacro("TClassTemplate.cxx");
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

// #include <TClassTemplate.h>
#include "TClassTemplate.h"

// Call the ClassImp() macro to give the TClassTemplate class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TClassTemplate);
#endif

//______________________________________________________________________________
// default ctor
TClassTemplate::TClassTemplate()
{
  // define here
  fSomeData = 0.;
}

//______________________________________________________________________________
// normal ctor
TClassTemplate::TClassTemplate( const char* someArg1, Double_t someArg2 )
{
  // define here
  fSomeData = 0.;
}

//______________________________________________________________________________
// SomePrivateMethod
void TClassTemplate::SomePrivateMethod()
{
  // define here
  return;
}

//______________________________________________________________________________
// SomeCalculation
Double_t TClassTemplate::SomeCalculation( Int_t someArg1 )
{
  // define here
  return retVal;
}

////______________________________________________________________________________
//TClassTemplate::
//{
//}

////______________________________________________________________________________
//TClassTemplate::
//{
//}


