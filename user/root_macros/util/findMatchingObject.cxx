// findMatchingObject -- scan a TCollection for an object whose name matches a regex
// -- Usage: TObject* findMatchingObject( TRegexp regex )
//           TObject* findMatchingObject( const char* pattern )
// -- Note: It's hard to believe this isn't already a builtin function
//      for all classes inheriting from TCollection;
//      but if it exists, I haven't found it.
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

TObject* findMatchingObject( TCollection* colxn, TRegexp patternRE ) {

// init
TIter i(colxn);
TObject *foundObj;
TNamed *obj;
TString objName;
TList *matchingObjs = new TList;

// main
for ( i=colxn->begin(); i!=colxn->end(); ++i ) {
  obj = (TNamed*)*i;
  objName = obj->GetName();
  if (objName.Contains(patternRE)) matchingObjs->Add(obj);
}

// check match count and return results
Int_t nMatches = matchingObjs->GetEntries();
if ( nMatches == 0 ) {
  printf("No matching objects found.\n");
  return 0x0;
} else if ( nMatches == 1 ) {
  foundObj = (TObject*)matchingObjs->At(0);
  return foundObj;
} else {
  printf("Multiple matching objects found:\n");
  matchingObjs->ls();
  return matchingObjs;
}

// all pau!   )
}

// overload for char* input
TObject* findMatchingObject( TCollection* colxn, const char* pattern ) { return findMatchingObject(colxn, TRegexp(pattern)); }
