// extract n0-capture information from ROOT file
//   -- NOTE: ONLY NEUTRONS PRODUCED BY A GENERATOR WILL BE RECORDED (no muogenics, etc.)
//   -- recommended usage: root -q -l -b 'NeutronCaptures.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.n0.dat
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ //

void NeutronCaptures(const char* inputfile, int number_of_events) {

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);

printf( "\n# # # # # #\n" );
printf( "If program fails, try checking the c.GoChild() line in this macro, which should be located (or linked) in $ROOTSYS/macros.\n" );
printf( "position: mm\ntime: ns\nenergy: MeV\n" );
printf( "# # # # # #\n" );
printf( "\n\n\n" );

for (int event=1; event<=number_of_events; event++) { // event loop

  printf( "Event: %i\n", event );

  RAT::DS::Root *ds = r.NextEvent(); // load event
  
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);  // create cursor


  // to choose neutrons, edit the following line based on which generator was used:
  c.GoChild(0); // 0 for gun, 1 for IBD


  // get starting point
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "Begin:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  c.GoTrackEnd(); // move cursor to end of track
  RAT::TrackNode *n = c.Here(); // node pointer to last step of n0 track


  // check volume at track termination
  if ( n->GetVolume() != "target" ) cerr << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;
  if ( n->GetVolume() != "target" ) cout << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;


  // now get capture info
  if ( n->GetProcess() == "nCapture" ) {
    RAT::TrackNode *n = c.Here();
    printf( "End:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
    printf( "Time: %f\n", n->GetGlobalTime() );

    // capture-agent information:
    int num_of_children = c.ChildCount();
    c.GoChild(num_of_children-1);
    RAT::TrackNode *n = c.Here(); // node pointer for final child
    cout << "Capture: " << n->GetParticleName() << endl;
    c.GoParent();

    // gamma information:
    int gammas(0);
    float gamma_KE_total(0);
    for ( int child=0; child<(num_of_children-1); child++ ) { // loop over children
      bool problem_child_tf = false;
      // all children except last should be gammas
      c.GoChild(child);
      RAT::TrackNode *n = c.Here(); // node pointer for gamma
      // make sure child is actually gamma, then add it & its energy to the totals for this capture
      if ( n->GetParticleName()=="gamma" ) {
        gammas++;
        gamma_KE_total = gamma_KE_total + n->GetKE();
      } else { // child not gamma -- NOTE: current version will only report name of first unexpected child particle
        problem_child_tf = true;
        TString problem_child_name = n->GetParticleName();
      } // end if
      c.GoParent();
      } // end for -- child loop
    printf( "Gammas: %i\nTotal Gamma Energy: % 5.6f\n", gammas, gamma_KE_total );
    if ( problem_child_tf == true ) {
      cerr << "Warning: Unexpected child particle type in event " << event << ": " << problem_child_name << endl;
      cout << "Warning: Unexpected child particle type in event " << event << ": " << problem_child_name << endl;
    } else { // no problem children
    } // end if

    

  } else { // track terminated by some other process
    cerr << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
    cout << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
    printf( "Endpoint:\t%f %f %f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  } // end if
    

  cout << endl << endl;


} // end for -- track loop

// all pau!   )
return;

}
