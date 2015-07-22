// IBD_Test: extract information about products of RAT-PAC's IBD generator from tracks in ROOT file
//   -- namely, get initial directions & energy of neutrons & positrons for testing purposes (4-momentum conservation, angular distributions, etc.)
// NOTE: ONLY NEUTRONS PRODUCED BY A GENERATOR WILL BE RECORDED (no muogenics, etc.)
// recommended usage: root -q -l -b 'IBD_Test.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.ibd

void IBD_Test(const char* inputfile, int number_of_events) {

printf( "\n\n### IBD_Test ###\n\n\n" );

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);

for (int event=1; event<=number_of_events; event++) {

  printf( "Event: %i\n", event );

  RAT::DS::Root *ds = r.NextEvent(); // load event
  
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);  // create cursor


  printf( "#\n" );


  // each IBD event has two children: an e+ (0) and an n0 (1)



  // start with the e+
  c.GoChild(0);
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->GetParticleName() != "e+" ) { // make sure particle is e+
    cout << "ERROR: Particle mismatch in event " << event << " (not e+). Exiting..." << endl;
    cerr << "ERROR: Particle mismatch in event " << event << " (not e+). Exiting..." << endl;
    return; }

  // get e+ starting point & initial KE
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "e+_KE0 (MeV): % 5.6f\n", n->GetKE() );
  printf( "e+_r0 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // go to very next step in order to get position for determining initial direction
  c.GoNext();
  RAT::TrackNode *n = c.Here();
  printf( "e+_r1 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  printf( "e+_t1 (ns): % 5.6f\n", n->GetGlobalTime() );

  // done with the e+
  c.GoParent();


  printf( "#\n" );


  // now the n0
  c.GoChild(1);
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->GetParticleName() != "neutron" ) { // make sure particle is neutron
    cout << "ERROR: Particle mismatch in event " << event << " (not neutron). Exiting..." << endl;
    cerr << "ERROR: Particle mismatch in event " << event << " (not neutron). Exiting..." << endl;
    return; }

  // get n0 starting point & initial KE
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "n0_KE0 (MeV): % 5.6f\n", n->GetKE() );
  printf( "n0_r0 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // go to very next step in order to get position for determining initial direction
  c.GoNext();
  RAT::TrackNode *n = c.Here();
  printf( "n0_r1 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  printf( "n0_t1 (ns): % 5.6f\n", n->GetGlobalTime() );

  // done with the n0



  cout << endl << endl;

} // end for

// all pau!   )
return;

} // end macro
