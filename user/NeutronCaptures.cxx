// extract n0-capture information from ROOT file
// NOTE: ONLY NEUTRONS PRODUCED BY A GENERATOR WILL BE RECORDED (no muogenics, etc.)
// recommended usage: root -q -l -b 'NeutronCaptures.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.n0

void NeutronCaptures(const char* inputfile, int number_of_events) {

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);
printf( "\n# # # # # #\n" );
printf( "If program fails, try checking the c.GoChild() line in this macro, which should be located in $ROOTSYS/macros.\n" );
printf( "# # # # # #\n\n" );

for (int event=1; event<=number_of_events; event++) {

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
  RAT::TrackNode *n = c.Here();

  // check volume at track termination
  if ( n->GetVolume() != "target" ) cerr << "Warning: n0 track for event " << event << "terminates in volume '" << n->GetVolume() << "'" << endl;

  // now get capture information
  if ( n->GetProcess() == "nCapture" ) {
    c.GoChild(c.ChildCount()-1); // capturing entity should be the last child
    RAT::TrackNode *n = c.Here();
    printf( "End:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
    cout << "Capture: " << n->GetParticleName() << endl;
    
  }
  else { // track terminated by some other process
    cerr << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
    printf( "Endpoint:\t%f %f %f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  }
    

  cout << endl << endl;

}

return;

}
