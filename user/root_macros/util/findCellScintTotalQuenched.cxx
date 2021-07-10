// findCellScintTotalQuenched -- loop over child tracks and add up all scintillation energy
//   produced in the current volume
// -- helper macro for ibdTracksToScint.cxx
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/21 ~ //

//Copyright (C) 2021 Mark J. Duvall
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

Double_t findCellScintTotalQuenched( RAT::TrackCursor c ) {

// init
RAT::TrackNode* n = c.Here();
Int_t k, child, children = c.ChildCount();
TString vol = n->GetVolume();
TString currentVol;
Double_t cellScintTotalQuenched(0);

// MAIN
for ( child=0; child<children; child++ ) {
  c.GoChild(child);
  // start at step 1 to avoid double-counting initial eDep
  for ( k=1; k<c.StepCount(); k++ ) {
    n = c.GoStep(k);
    currentVol = n->GetVolume();
//  if ( currentVol == vol ) cellScintTotalQuenched += n->GetTotEDepScintQuenched();
  cellScintTotalQuenched += n->GetTotEDepScintQuenched();
  }
  c.GoParent();
}

// all pau!   )
return cellScintTotalQuenched;
}
