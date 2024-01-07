// scatPos -- macro to extract sets of neutron positions after nScatterSelection scatters
// -- For now, nScatterSelection is hard-coded (see "general init" below)
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

TTree* scatPos( const char* filename = "") {


// INIT

// RAT init
RAT::DSReader r(filename);
RAT::DS::Root *ds = r.GetEvent(0);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(kFALSE);
RAT::TrackNode *n = c.Here();

// general init
Int_t* nScatterSelection[5] = {1, 2, 5, 10, 20};
Double_t NAN = TMath::QuietNaN();
Long64_t event(0), totalEvents = r.GetTotal();
TVector3 R, R_final;
Int_t currentStep, totalSteps, currentScatter, totalScatters;
Double_t cos_psi; 		// p_nu_hat = {-1,0,0}  -->  cos[psi] = -R.Unit().X()

// TTree init
TTree *T_sp = new TTree("T_sp", "Neutron data by number of scatters");
T_sp->Branch("event", &event);
T_sp->Branch("r", &r);
T_sp->Branch("cos_psi", &cos_psi);


// MAIN

// init for main
TString process;
TRegexp procES("hadElastic"), procIS("neutronInelastic"), procNC("nCapture"), procND("nDecay"); //TODO CHECKME
Int_t scatIndex, scatSelection;

// event loop
nav.Clear();
cerr << endl << "Beginning event loop..." << endl << endl; //debug
//for ( event = 0; event < totalEvents; event++ ) {
for ( event = 0; event < 5; event++ ) { //debug

  // event init
  ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(kFALSE);
  n = c.GoChild(0);			// assume neutron-only run
  if ( n->GetPDGCode() != 2112 ) {	// assume IBD run
    c.GoParent();
    n = c.GoChild(1);
  }
  // sanity check: trackStart
  if (! c.IsTrackStart()) {
    gROOT->Error("scatPos.cxx | trackStart", "Sanity check failed.");
    return 0x0;
  }

  // step loop
  //TODO (Re)set nScatterSelection-specific positions to TVector3(NAN, NAN, NAN)
  currentStep = 0;
  currentScatter = 0;
  totalScatters = 0;
  totalSteps = c.StepCount();
  for ( currentStep = 0; currentStep < totalSteps; currentStep++ ) {

    // check physics process
    process = n->GetProcess();
    if ( process.Contains(procES) ) {	// scatter occurred
      //cerr << "-- Scatter Detected --" << endl; //debug
      currentScatter++;
	for (scatIndex=0; scatIndex<5; scatIndex++) {
	  scatSelection = nScatterSelection[scatIndex];
	  if (currentScatter==scatSelection) {						// scatter count is one of desired selections
	    //cerr << "\t\t\t// detected scatter # " << scatSelection << endl; //debug
	    R = n->GetEndpoint();
	    cos_psi = -R.Unit().X();
	    printf("Event = %d\tN = %d\tx = %f\ty = %f\tz = %f\tcos_psi = %f\n", event, currentScatter, R.X(), R.Y(), R.Z(), cos_psi); //debug
	  }
	}
    } else if ( (process.Contains(procIS)) || (process.Contains(procNC)) ) { 		// capture occurred
      //cerr << "-- Capture Detected --" << endl; //debug
    } else if ( process.Contains(procND) ) {
      cerr << "-- Decay Detected --" << endl; //debug
    } // endif -- physics process
    n = c.GoNext();			// executes faster than c.GoStep(currentStep)
  } // step loop

  // sanity check: trackEnd
  if (c.IsTrackEnd()) {
    totalScatters = currentScatter;
    R_final = c.Here()->GetEndpoint();
  } else {
    gROOT->Error("scatPos.cxx | trackEnd", "Sanity check failed.");
    return 0x0;
  }

  // prevent memory leak
  nav.Clear();

  //debug
  printf("Event: %d\tSteps: %d\tScatters: %d\tFinal_cos_psi: %f\n\n", event, totalSteps, currentScatter, -R_final.Unit().X()); //debug

} // event loop

cerr << endl << "Finished." << endl << endl; //debug

// all pau!   )
return T_sp;
}
