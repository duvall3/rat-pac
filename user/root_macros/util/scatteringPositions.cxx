// scatteringPositions -- macro to extract sets of neutron positions after N scatters
// -- for now, hard-coded: N = {1, 5, 10, 20}
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

TTree* scatteringPositions( const char* filename = "") {

// file operations
// savename, etc...

// RAT init
RAT::DSReader r(filename);
/* RAT::DS::Root *ds = r.GetEvent(-1); */
RAT::DS::Root *ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(kFALSE);
RAT::TrackNode *n = c.Here();

// other init
TVectorF N(4);
/* N[0] = 1; N[1] = 5; N[2] = 10; N[3] = 20; */
N[0] = 2; N[1] = 5; N[2] = 10; N[3] = 20;
Long64_t k = 0, N_in = r.GetTotal();
TVector3 x1, x5, x10, x20;
TTree *T_sp = new TTree("T_sp", "Sets of post-scattering positions");
TBranch *br_x1 = T_sp->Branch("x1", &x1);
TBranch *br_x5 = T_sp->Branch("x5", &x5);
TBranch *br_x10 = T_sp->Branch("x10", &x10);
TBranch *br_x20 = T_sp->Branch("x20", &x20);
Bool_t kChosenScatter;
Int_t step, nScatters;
TString stepProc;

// MAIN
for ( k=0; k<N_in; k++ ) { // event loop

  // enter event
  nScatters = 0;
  kChosenScatter = kFALSE;
  nav.Clear();
  /* ds = r.NextEvent(); */
  ds = r.GetEvent(k);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(kFALSE);
  n = c.GoChild(0);

  // step loop
  nScatters = 0;
  for ( step = 0; step < c.StepCount(); step++ ) {
    n = c.GoStep(step);
    stepProc = n->GetProcess();
    if (stepProc.Contains("hadElastic")) nScatters++;
    kChosenScatter = ( (nScatters==N[0]) || (nScatters==N[1]) || (nScatters==N[2]) || (nScatters==N[3]) );
    if (kChosenScatter) {
      switch(nScatters) {
	case N[0]: x1 = n->GetEndpoint(); //br_x1->Fill();
	case N[1]: x5 = n->GetEndpoint(); //br_x5->Fill();
	case N[2]: x10 = n->GetEndpoint(); //br_x10->Fill();
	case N[3]: x20 = n->GetEndpoint(); //br_x20->Fill();
      }
    } // end if kChosenScatter
  } // end step loop

  T_sp->Fill();

} // end event loop

/* cout << endl << endl; //debug */

// all pau!   )
return T_sp;
}
