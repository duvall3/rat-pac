// findScintBursts.cxx -- macro to (hopefully) recreate Marc Bergevin's algorithm
//   for finding "bursts" of scintillation energy based on MC track steps in RAT-PAC
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2021 ~ //

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

void findScintBursts( const char* filename ) {

// init
RAT::DSReader r(filename);
RAT::DS::Root* ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(kFALSE);
RAT::TrackNode* n = c.Here();
Long64_t k, N(r.GetTotal());
Double_t en, en_q; // also TIMES

// event loop
for ( k=0; k<N; k++ ) {
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  n = c.Here();

  // particle/track loop
//for (...) {

    // step loop
//  for (...) {
//  } // end step loop

//} // end particle/track loop

  nav.Clear();
} // end event loop

// all pau!   )
}
