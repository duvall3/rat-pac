// IBD_Test: extract information about products of RAT-PAC's IBD generator from tracks in ROOT file
//   -- namely, get initial directions & energy of neutrons & positrons for testing purposes (4-momentum conservation, angular distributions, etc.)
//   -- NOTE: ONLY NEUTRONS PRODUCED BY THE GENERATOR WILL BE RECORDED (no muogenics, etc.)
//   -- recommended usage: root -q -l -b 'IBD_Test.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.ibd
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ //

void IBD_Test(const char* inputfile, int number_of_events) {

printf( "\n\n# # # IBD_Test # # #\n\n\n" );

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
    cout << "ERROR: Particle mismatch in event " << event << " (not e+). Skipping..." << endl;
    cerr << "ERROR: Particle mismatch in event " << event << " (not e+). Skipping..." << endl;
    c.GoParent(); }

  // get e+ starting point & initial T
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  TString pcl_name = n->GetParticleName();
  printf( "%s_KE0 (MeV): % 5.6f\n", pcl_name.Data(), n->GetKE() );
  printf( "%s_r0 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", pcl_name.Data(), n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // go to very next step in order to get position for determining initial direction
  c.GoNext();
  RAT::TrackNode *n = c.Here();
  TString pcl_name = n->GetParticleName(); // just to be safe; there should be no way it could have changed since the previous node
  printf( "%s_r1 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", pcl_name.Data(), n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  printf( "%s_t1 (ns): % 5.6f\n", pcl_name.Data(), n->GetGlobalTime() );

  // done with the e+
  c.GoParent();


  printf( "#\n" );


  // now the n0
  c.GoChild(1);
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->GetParticleName() != "neutron" ) { // make sure particle is neutron
    cout << "ERROR: Particle mismatch in event " << event << " (not neutron). Skipping..." << endl;
    cerr << "ERROR: Particle mismatch in event " << event << " (not neutron). Skipping..." << endl;
    c.GoParent(); }

  // get n0 starting point & initial T
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  TString pcl_name = n->GetParticleName();
  printf( "%s_KE0 (MeV): % 5.6f\n", pcl_name.Data(), n->GetKE() );
  printf( "%s_r0 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", pcl_name.Data(), n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );

  // go to very next step in order to get position for determining initial direction
  c.GoNext();
  RAT::TrackNode *n = c.Here();
  TString pcl_name = n->GetParticleName(); // just to be safe; there should be no way it could have changed since the previous node
  printf( "%s_r1 (mm):\t\t\t% 5.6f\t% 5.6f\t% 5.6f\n", pcl_name.Data(), n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  printf( "%s_t1 (ns): % 5.6f\n", pcl_name.Data(), n->GetGlobalTime() );

  // done with the n0

  
  printf( "\n\n" );


} // end for

// all pau!   )
return;

} // end macro
