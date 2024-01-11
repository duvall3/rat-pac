// all_angresNew -- run angresNew on all SEDAQ or nCap
//   results files in the current directory
// NOTES:
// - set kSave to kTRUE to save plots
// - use OUTFILE to save textual output
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 01/2024 ~ //

//Copyright (C) 2023 Mark J. Duvall / T. Rocks Science
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

{

Bool_t kSAVE = kFALSE;
TList *l = TDuvallUtils::ListFiles("CO.*_results\.root");
TSystemFile *sf;
TIter i(l);
TString fileName;
Bool_t kMono;

for (i=l->begin(); i!=l->end(); ++i) {
  sf = (TSystemFile*)*i;
  fileName = sf->GetName();
  if fileName.Contains("chooz") {
    kMono = kTRUE;
  } else {
    kMono = kFALSE;
  }
  angresNew(sf->GetName(), kSave, kMono); // >> OUTFILE.txt
}

// all pau!   )
}
