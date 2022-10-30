// TClassTemplate
/// Basic template for writing ROOT classes
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

#ifndef TClassTemplate
#define TClassTemplate

class TClassTemplate : public TClass {

private:
  // members
  Double_t		fSomeData;							///< Data member

private:
  // internal methods
  void			SomePrivateMethod();						///< Private method

public:
  // public methods
  TClassTemplate();									///< Default ctor
  TClassTemplate( const char* someArg1, Double_t someArg2 );				///< Normal ctor
  // setters and getters
  void			SetData( Double_t someArg ) { fSomeData = someArg; }		///< Setter
  Double_t		GetData() { return fSomeData; }					///< Getter
  // general
  Double_t		SomeCalculation( Int_t someArg1 = 0 );				///< Regular function with default argument

// Integrating the TClassTemplate class into ROOT
ClassDef(TClassTemplate,1) ///< with class version number

}; //end class

// all pau!   )
#endif

