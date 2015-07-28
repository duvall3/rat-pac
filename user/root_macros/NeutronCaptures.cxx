// extract n0-capture information from ROOT file
//   -- NOTE: ONLY NEUTRONS PRODUCED BY A GENERATOR WILL BE RECORDED (no muogenics, etc.)
//   -- recommended usage: root -q -l -b 'NeutronCaptures.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.n0
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ //

void NeutronCaptures(const char* inputfile, int number_of_events) {

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);
printf( "\n# # # # # #\n" );
printf( "If program fails, try checking the c.GoChild() line in this macro, which should be located (or linked) in $ROOTSYS/macros.\n" );
printf( "# # # # # #\n\n\n" );

for (int event=1; event<=number_of_events; event++) {

  printf( "Event: %i\n", event );
//printf( "#\n" );

  RAT::DS::Root *ds = r.NextEvent(); // load event
  
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);  // create cursor


  // to choose neutrons, edit the following line based on which generator was used:
  c.GoChild(0); // 0 for gun, 1 for IBD


  // get starting point
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "Begin (mm):\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  c.GoTrackEnd(); // move cursor to end of track
  RAT::TrackNode *n = c.Here(); // node pointer to last step of n0 track


  // check volume at track termination
  if ( n->GetVolume() != "target" ) cerr << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;
  if ( n->GetVolume() != "target" ) cout << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;


  // now get capture info
  if ( n->GetProcess() == "nCapture" ) {
    RAT::TrackNode *n = c.Here();
    printf( "End (mm):\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
    printf( "Time (ns): %f\n", n->GetGlobalTime() );

    // gamma information:
    int gammas(0);
    float gamma_KE_total(0);
    int num_of_children = c.ChildCount();
    for ( int child=0; child<(num_of_children-1); child++ ) {
      // all children except last should be gammas
      c.GoChild(child);
      RAT::TrackNode *n = c.Here(); // node pointer for gamma
      // make sure child is actually gamma, then add it & its energy to the totals for this capture
      if ( n->GetParticleName()=="gamma" ) {
        gammas++;
        gamma_KE_total = gamma_KE_total + n->GetKE();
      } else { // child not gamma
        cerr << "Warning: Unexpected child particle type in event " << event << ": " << n->GetParticleName() << endl;
        cout << "Warning: Unexpected child particle type in event " << event << ": " << n->GetParticleName() << endl;
      } // end if
      c.GoParent();
      } // end for
    printf( "Gammas: %i\nTotal Gamma Energy (MeV): % 5.6f\n", gammas, gamma_KE_total );
    
    // capture-agent information:
    c.GoChild(num_of_children-1);
    RAT::TrackNode *n = c.Here(); // node pointer for final child
    cout << "Capture: " << n->GetParticleName() << endl;
    

  } else { // track terminated by some other process
    cerr << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
    cout << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
    printf( "Endpoint:\t%f %f %f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  }
    

  cout << endl << endl;


}

// all pau!   )
return;

}
