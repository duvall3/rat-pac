// TRATGeoConverter -- basic template for writing ROOT classes
// -- Note: For CINT, load using gROOT->LoadMacro("TRATGeoConverter.cxx");
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

#ifndef TRATGeoConverter
#define TRATGeoConverter

#include <TRATGeo.cxx>

class TRATGeoConverter : public TClass {

private:
  // members
  const char*		fInFileName;							// input filename
  const char*		fOutFileName;							// output filename
  Bool_t		fkOverwrite;							// overwrite y/n
  TFile*		fInFile;							// input file
  FILE*			fOutFile;							// output file
  TRATGeo*		fRATGeo;							// geometry manager

private:
  // internal methods
  void			SetInFile();							// set input file
  void			SetOutFile();							// set output file
  void			SetFiles();							// set both
  void			BuildGeometry();						// set up TRATGeo // TEMP PUBLIC

public:
  // public methods
  /* TRATGeoConverter();									// default ctor */
  /* TRATGeoConverter( const char* inFileName, const char* outFileName = "" );		// normal ctor */
  TRATGeoConverter( const char* inFileName );						// normal ctor
  // setters
  /* void			SetInFileName( const char* inFileName ) { fInFileName = inFileName; } */
  void			SetOutFileName( const char* outFileName ) { fOutFileName = outFileName; }
  void			SetOverwrite( Bool_t overWrite ) { fkOverwrite = overWrite; }
  // getters
  const char*		GetInFileName() { return fInFileName; }
  const char*		GetOutFileName() { return fOutFileName; }
  Bool_t		GetOverwrite() { return fkOverwrite; }
  TFile*		GetInFile() { return fInFile; }
  FILE*			GetOutFile() { return fOutFile; }
  TRATGeo*		GetGeo() { return fRATGeo; }
  // util
  void			CloseOutFile() { fclose(fOutFile); }
  // main
  void			Convert();							// MAIN

// Integrating the TRATGeoConverter class into ROOT
ClassDef(TRATGeoConverter,1) // with class version number

}; //end class

// all pau!   )
#endif

