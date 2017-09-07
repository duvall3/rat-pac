// IBD_Test: extract information about products of RAT-PAC's IBD generator from tracks in ROOT file
//   -- NOTE: ONLY POSITRONS & NEUTRONS PRODUCED BY A GENERATOR WILL BE RECORDED (no muogenics, etc.)
//   -- recommended usage: root -q -l -b 'IBD.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.ibd.dat
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ //

void IBD(const char* inputfile, int number_of_events) {

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);

printf( "\n# # # # # #\n" );
printf( "position: mm\ntime: ns\nenergy: MeV\n" );
printf( "# # # # # #\n" );
printf( "\n\n\n" );

for (int event=1; event<=number_of_events; event++) { // event loop

  printf( "Event: %i\n#\n", event );

  RAT::DS::Root *ds = r.NextEvent(); // load event
  
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);  // create cursor


  // each IBD event has two children: an e+ (0) and a neutron(1);
  for (int positron_or_neutron=0; positron_or_neutron<=1; positron_or_neutron++) { // top track loop
    RAT::TrackNode *n = c.GoChild(positron_or_neutron);
    TString particle_name = n->GetParticleName();
  
    // get starting point
    RAT::TrackNode *n = c.Here(); // create node pointer
    cout << "Particle: " << particle_name << endl; // mostly for debugging
    if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
    printf( "Begin:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
    
    // prepare to loop through steps
    int scatter_count(0);
    
    // step loop
    while ( n->IsTrackEnd() == false ) {
      RAT::TrackNode *n = c.GoNext();
      // get location at first step --> initial direction:
      if ( n->GetStepID()==1 ) printf( "Step %i: \t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetStepID(), n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
      if ( n->GetProcess() == "hadElastic" ) scatter_count++;
    } // end step loop
    
    // should be at end of track now
    RAT::TrackNode *n = c.Here();
    if ( n->IsTrackEnd() == false ) {cout << "Error: not track end" << endl; cerr << "Error: not track end" << endl; } // sanity check
    // check volume at track termination -- mod for e+?
//  if ( n->GetVolume() != "target" ) cerr << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;
//  if ( n->GetVolume() != "target" ) cout << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;
    // get endpoint info
//  RAT::TrackNode *n = c.Here();
    printf( "End:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
    if ( particle_name == "neutron" ) printf( "Total Scatters: %i\n", scatter_count ); // already determined above, but looks nicer for output here
    printf( "Time: %f\n", n->GetGlobalTime() );
  
    // now get termination info
    if ( n->GetProcess()=="annihil" || n->GetProcess()=="nCapture" || n->GetProcess()=="neutronInelastic" ) {
  
      // capture-agent information for neutrons:
      int num_of_children = c.ChildCount();
      if ( particle_name == "neutron" ) {
        RAT::TrackNode *n_child = c.GoChild(num_of_children-1);
//      RAT::TrackNode *n_child = c.Here(); // node pointer for final child
        cout << "Capture: " << n_child->GetParticleName() << endl;
      } // end if -- isneutron
  
  
      // gamma & alpha information upon capture/annihil:
      int gammas(0);
      float gamma_KE_total(0);
      float alpha_KE(0);
      int final_child(0);
      for ( int child=0; child<num_of_children; child++ ) { // loop over children
        bool problem_child_tf = false;
        // for Gd capture, all children except last should be gammas
        RAT::TrackNode *n_child = c.GoChild(child); // node pointer for alpha|gamma
        TString child_name = n_child->GetParticleName();
        // make sure child is actually alpha|gamma, then add it & its energy to the totals for this capture/annihil
        if ( child_name == "gamma" ) {
          gammas++;
          gamma_KE_total = gamma_KE_total + n_child->GetKE();
        } else if ( child_name == "alpha" ) {
            alpha_KE = n_child->GetKE();
            printf( "Alpha: %5.6f\n", alpha_KE );
        } else if ( child_name.Contains("deuteron") || child_name.Contains("Li7") || child_name.Contains("Gd") ) {
            // do nothing -- these are normal (capture) products
        } else { // child not expected capture product -- NOTE: current version will only report name of first unexpected child particle
          problem_child_tf = true;
          TString problem_child_name = n_child->GetParticleName();
        } // end if
        c.GoParent();
        } // end for -- child loop
      printf( "Gammas: %i\nTotal Gamma Energy: % 5.6f\n", gammas, gamma_KE_total );
      if ( problem_child_tf == true ) {
        cerr << "Warning: Unexpected child particle type in event " << event << ": " << problem_child_name << endl;
        cout << "Warning: Unexpected child particle type in event " << event << ": " << problem_child_name << endl;
      } else { // no problem children
      } // end if -- problem children
  
      
  
    } else { // track terminated by some other process
      cerr << "Warning: particle track for event " << event << " terminated by unexpected process: " << n->GetProcess() << endl;
      cout << "Warning: particle track for event " << event << " terminated by unexpected process: " << n->GetProcess() << endl;
  //  printf( "Endpoint:\t%f %f %f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );


  
    } // end if -- track termination process
      
  printf("#\n");
  
  c.GoParent();
  
  } // end for -- main event loop

printf("\n\n");

} // end for -- event loop

// all pau!   )
return;

} // end macro
