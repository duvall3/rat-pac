// compareRef -- utility function to simplify batch execution of reference-matching comparisons using TRefMatch (see doc/html/md_ReferenceMatching.html)
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 06/2023 ~ //

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

void compareRef(const char* filename, Bool_t kAndersonDarling = kFALSE) {

  TRefMatch *r = new TRefMatch(filename);
  r->SetAnderson(kAndersonDarling);
  r->Run();

  // all pau!   )
  return;
}
