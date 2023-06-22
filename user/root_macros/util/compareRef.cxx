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

void compareRef(const char* inputname, Bool_t kAndersonDarling = kFALSE) {

  // init
  TSystemFile F(inputname, gSystem->WorkingDirectory());

  // MAIN
  if (! F.IsDirectory()) {	// for individual file
    TRefMatch *r = new TRefMatch(inputname);
    r->SetAnderson(kAndersonDarling);
    r->Run();
  } else {			// for run directory
    Int_t phi, phiMin = 0, phiMax = 30;		//HC// hard-coded for now: variable is phi and runs from 0 to 30
    /* Int_t phi, phiMin = 0, phiMax = 3; //debug */
    TString fullName, fileName, dirName(inputname);
    if ( dirName(dirName.Length()-1) != '/' ) dirName.Append('/');
    for ( phi = phiMin; phi <= phiMax; phi++ ) {
      fileName.Form("%02dDEG_phi.root", phi);
      fullName = dirName + fileName;
      TRefMatch *r = new TRefMatch(fullName.Data());
      r->SetAnderson(kAndersonDarling);
      r->Run();
      /* delete r; */
    }
  }

  // all pau!   )
  return;
}
