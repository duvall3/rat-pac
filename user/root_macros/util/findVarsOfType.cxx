// findVarsOfType -- list global variables of a specified type
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
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

void findVarsOfType( const char* varType = "", Bool_t kCaseSensitive = kFALSE ) {

// init
TString varTypeStr(varType);
Int_t varCount;
TString gvarType;
TCollection *glist = gROOT->GetListOfGlobals(kTRUE);
TGlobal *gvar;
TIter i(glist);

// check option and set regex
if (! kCaseSensitive) {
  varTypeStr.ToLower();
}
TRegexp varRE(varTypeStr.Data());

// loop over list
for ( i=glist->begin(); i!=glist->end(); ++i ) {
  gvar = (TGlobal*)*i;
  gvarType.Form("%s", gvar->GetTypeName());
  if (! kCaseSensitive) {
    gvarType.ToLower();
  }
  if ( gvarType.Contains(varRE) ) {
    varCount++;
    printf("%s\t%s\n", gvar->GetTypeName(), gvar->GetName());
  }
}
if (varCount>5) printf("Found %d global variables matching TypeName.Contains(\"%s\").\n", varCount, varType);

// all pau!   )
return;
}

