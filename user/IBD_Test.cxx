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



  // each IBD event has two children: an e+ (0) and an n0 (1)



  // start with the e+
  c.GoChild(0);
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->GetParticleName() == "e+" ) printf("yes, e+!\n"); // for debugging
/*  if ( n->GetParticleName() != "e+" ) // make sure particle is e+
    cout << "ERROR: Particle mismatch in event " << event << " (not e+). Exiting..." << endl;
    cerr << "ERROR: Particle mismatch in event " << event << " (not e+). Exiting..." << endl;
    return;
*/

  // get e+ starting point & initial KE
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "e+_Begin:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  printf( "e+_KE: % 5.6f\n", n->GetKE() );

  // go to very next step in order to get position for determining initial direction
  c.GoNext();
  RAT::TrackNode *n = c.Here();
  printf( "e+_First_Position:\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // done with the e+
  c.GoParent();


  // now the n0
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->GetParticleName() != "neutron" ) // make sure particle is neutron
    cout << "ERROR: Particle mismatch in event " << event << " (not neutron). Exiting..." << endl;
    cerr << "ERROR: Particle mismatch in event " << event << " (not neutron). Exiting..." << endl;
    return;

  // get starting point
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "n0_Begin = \t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // go to very next step in order to get position for determining initial direction
  c.GoNext();
  RAT::TrackNode *n = c.Here();
  printf( "n0_First_Position = \t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // done with the n0



  cout << endl << endl;

} // end for

// all pau!   )
return;

} // end macro
