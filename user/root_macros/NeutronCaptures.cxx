// extract n0-capture information from ROOT file
//   -- NOTE: ONLY NEUTRONS PRODUCED BY A GENERATOR WILL BE RECORDED (no muogenics, etc.)
//   -- recommended usage: root -q -l -b 'NeutronCaptures.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME.n0.dat
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ //

void NeutronCaptures(const char* inputfile, int number_of_events) {

TFile *file0 = TFile::Open(inputfile);
RAT::DSReader r(inputfile);

printf( "\n# # # # # #\n" );
printf( "position: mm\ntime: ns\nenergy: MeV\n" );
printf( "# # # # # #\n" );
printf( "\n\n\n" );

for (int event=1; event<=number_of_events; event++) { // event loop

  printf( "Event: %i\n", event );

  RAT::DS::Root *ds = r.NextEvent(); // load event
  
  // get event start time(s)
  RAT::DS::MC *mc = ds->GetMC(); // needed for event start time
  TTimeStamp utc = mc->GetUTC(); // event timestamp object
  const time_t t_sec = utc.GetSec(); // timestamp fSec
  const Int_t t_nanosec = utc.GetNanoSec(); // timestamp fNanoSec
  printf( "Start Time (sec): %i\n", t_sec );
  printf( "Start Time (nanosec): %i\n", t_nanosec );
  
  // create tracking objects
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);  // create cursor

  // enter neutron track
  c.GoChild(0);


  // get starting point
  RAT::TrackNode *n = c.Here(); // create node pointer
  if ( n->IsTrackStart() == false ) printf( "WARNING: Bad track start!" ); // sanity check
  printf( "Begin:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  
  int scatter_count(0);

//old version w/o scatter info
//c.GoTrackEnd(); // move cursor to end of track
//RAT::TrackNode *n = c.Here(); // node pointer to last step of n0 track
  
  while ( n->IsTrackEnd() == false ) { // loop over steps w/in track
    RAT::TrackNode *n = c.GoNext();
//  if ( scatter_count==1 || ((scatter_count > 0) && (scatter_count % 5) == 0)) {
    // get location at scatters 1,5,10,20 (sloppy, but arrays are a pain):
    if ( n->GetProcess() == "hadElastic" ) {
      if ( scatter_count == 1 || scatter_count==5 || scatter_count==10 || scatter_count==20 ) {
        printf( "%i Scatter(s):\t% 5.6f\t% 5.6f\t% 5.6f\n", scatter_count, n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
      } // end if (scatter count & position)
      scatter_count++;
    } // end if (for counting every 5 scatters)
  } // end step loop
  
  // should be at end of track now
  RAT::TrackNode *n = c.Here();
  if ( n->IsTrackEnd() == false ) {cout << "Error: not track end" << endl; cerr << "Error: not track end" << endl; } // sanity check
    
  // check volume at track termination
  TString term_vol = n->GetVolume();
//if ( !term_vol.Contains("target") && !term_vol.Contains("capture") && !term_vol.Contains("world") ) cerr << "Warning: n0 track for event " << event << " terminates in volume " << term_vol << endl;
//if ( !term_vol.Contains("target") && !term_vol.Contains("capture") ) cout << "Warning: n0 track for event " << event << " terminates in volume " << term_vol << endl;

  // get endpoint info
  RAT::TrackNode *n = c.Here();
  printf( "End:\t\t% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  printf( "Total Scatters: %i\n", scatter_count ); // already determined above, but looks nicer for output here
  printf( "Time: %f\n", n->GetGlobalTime() );
  printf( "Termination Volume: %s\n", term_vol.Data() );

  // now get capture info
  if ( n->GetProcess()=="nCapture" || n->GetProcess()=="neutronInelastic" ) {

    // capture-agent information:
    int num_of_children = c.ChildCount();
    c.GoChild(num_of_children-1);
    RAT::TrackNode *n = c.Here(); // node pointer for final child
    cout << "Capture: " << n->GetParticleName() << endl;
    c.GoParent();

    // gamma information:
    int gammas(0);
    float gamma_KE_total(0);
    float alpha_KE(0);
    for ( int child=0; child<(num_of_children-1); child++ ) { // loop over children
      bool problem_child_tf = false;
      // for Gd capture, all children except last should be gammas
      c.GoChild(child);
      RAT::TrackNode *n = c.Here(); // node pointer for gamma
      // make sure child is actually gamma, then add it & its energy to the totals for this capture
      if ( n->GetParticleName()=="gamma" ) {
        gammas++;
        gamma_KE_total = gamma_KE_total + n->GetKE();
      } else if( n->GetParticleName()=="alpha" ) {
          alpha_KE = n->GetKE();
          printf( "Alpha: %5.6f\n", alpha_KE );
      } else if( n->GetParticleName()=="triton" ) {
          // do nothing for now; might track these later
      } else { // child not gamma or alpha -- NOTE: current version will only report name of first unexpected child particle
        problem_child_tf = true;
        TString problem_child_name = n->GetParticleName();
      } // end if
      c.GoParent();
      } // end for -- child loop
    printf( "Gammas: %i\nTotal Gamma Energy: % 5.6f\n", gammas, gamma_KE_total );
    if ( problem_child_tf == true ) {
//    cerr << "Warning: Unexpected child particle type in event " << event << ": " << problem_child_name << endl;
//    cout << "Warning: Unexpected child particle type in event " << event << ": " << problem_child_name << endl;
    } else { // no problem children
    } // end if

  } else { // track terminated by some other process
      TString other_proc = n->GetProcess();
      if ( ! other_proc.contains("Transportation") ) {
	cerr << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
	cout << "Warning: n0 track for event " << event << " terminated by " << n->GetProcess() << " instead of nCapture." << endl;
    //  printf( "Endpoint:\t%f %f %f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
      }

  } // end if
    

  cout << endl << endl;
  
  // clear memory for next event
  mc->Clear();
  nav.Clear();

} // end event loop

// all pau!   )
return;

}
