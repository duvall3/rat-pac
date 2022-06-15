// fileList -- function to return a TList of TSystemFiles
//   in the current (system) directory whose names
//   match a pattern
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2022 ~ //

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

TList* fileList( const char* pattern = ".*\.root" ) {

// init
TRegexp patRE(pattern);
TSystemDirectory *dir = new TSystemDirectory;
TSystemFile *sf = new TSystemFile;
TString  sfName;
TList *fL = new TList;

// MAIN
dir->SetDirectory( gSystem->WorkingDirectory() );
TList *dirFiles = dir->GetListOfFiles();
TIter i(dirFiles);
for ( i = dirFiles->begin(); i != dirFiles->end(); ++i ) {
  sf = (TSystemFile*)*i;
  sfName.Form( sf->GetName() );
  if ( sfName.Contains(patRE) ) fL->Add(sf);
}

// all pau!   )
return fL;
}
