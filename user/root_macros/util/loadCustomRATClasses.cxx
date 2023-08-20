{
  // loadCustomRATClasses -- Load user classes that require RAT libraries.
  //   This will only succeed if it runs *after* the RAT libraries
  //   have been loaded by the binary generated from $RATROOT/root.cc
  //   (this binary is usually $RATROOT/bin/root), so it cannot be called
  //   from any of the ROOT startup files (e.g., .rootrc, rootinit.C,
  //   rootlogon.C) and must instead be called manually after ROOT
  //   has finished opening.
  // ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 08/2023 ~ //

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

  gROOT->LoadMacro("TRATTrackAnalyzer.cxx");

}
