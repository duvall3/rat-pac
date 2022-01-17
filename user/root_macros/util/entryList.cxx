// entryList -- shortcut for creating a TEntryList from a TTree and a selection string
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2022 ~ //

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

TEntryList* entryList(const char* selection, TTree *T = 0) {

// init
if (T == 0) T = (TTree*)gDirectory->FindObjectAny("T");
if (T == 0) T = (TTree*)gDirectory->FindObjectAny("T_scint");
if (T == 0) {
  gDirectory->Error("entryList", "No TTree* given or found.");
  return (TEntryList*)0;
}

// main
TEntryList *eList;
T->Draw(">>eList", selection, "entrylist");
eList = (TEntryList*)gDirectory->FindObjectAny("eList");

// all pau!   )
return eList;
}

