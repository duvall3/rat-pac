// gt.cxx -- sectional macro to test gamma code for Cherenkov energy deposition in target volume


void gt(const char* inputfile, int number_of_events) {

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);

printf("\n\n\n\n");

for (int event=1; event<=number_of_events; event++) { // event loop

  printf( "Event: %i\n#\n", event );

  RAT::DS::Root *ds = r.NextEvent(); // load event
  
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);  // create cursor

  RAT::TrackNode *n = c.GoChild(1); // go to neutron track
  TString particle_name = n->GetParticleName();
  printf("Particle: %s\n", particle_name.Data()); // should be 'neutron' (sanity check)

  RAT::TrackNode *n = c.GoTrackEnd();
//cout << n->IsTrackEnd() << endl;//debug
  TString term_vol = n->GetVolume();
  cout << term_vol.Data() << endl; //debug
  if ( term_vol.Contains("target") ) {

    int child_count = c.ChildCount();
    cout << child_count << endl; //debug
  
    // gamma stuff
    for (int child=0; child<=(child_count-1); child++) {
      RAT::TrackNode *n = c.GoChild(child);
//    RAT::TrackNode *n = c.GoChild(0);
      TString child_name = n->GetParticleName();
      cout << child_name.Data() << endl;//debug
      if ( child_name.Contains("gamma") ) {
        printf( "Yes.\n" );//debug
        float gamma_KE_init(0);
        float gamma_KE_dep(0);
        gamma_KE_init = n->GetKE();
        printf( "Initial Gamma KE: % 5.6f\n", gamma_KE_init );
     
        // find Compton scatters while gamma is over Cherenkov threshold (~0.186 MeV for electrons in the Double CHOOZ scintillator)
        float gamma_KE_current = gamma_KE_init;
        while ( gamma_KE_current >= 0.186 ) {
          RAT::TrackNode *n = c.GoNext();
          gamma_KE_current = n->GetKE();
          TString gamma_vol_current = n->GetVolume();
          TString gamma_process = n->GetProcess();
          if ( gamma_vol_current.Contains("target") & gamma_process=="compt" ) {
            RAT::TrackNode *n = c.GoChild(0);
	    float electron_KE = n->GetKE();
	    if ( electron_KE > 0.186 ) {
              float electron_KE_dep = electron_KE - 0.186;
              gamma_KE_dep = gamma_KE_dep + electron_KE_dep;
              printf( "Electron energy over threshold: % 5.6f\n", electron_KE_dep );
	    }
            c.GoParent();
          } // end if -- multi-check
        } // end if -- track step over thershold
     
          printf( "Total Gamma KE deposited: % 5.6f\n", gamma_KE_dep );

        c.GoParent();

      } // end if -- gamma name

    } // end for -- gamma stuff

  } // end if -- term in target
  
  printf("###\n\n\n");

c.GoParent();

nav.Clear();

} // end event loop

printf("\n\n\n\n\n");

} // end macro
