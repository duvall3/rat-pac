// MemTest -- macro for testing memory-leak problem
// -- recommended usage:   time root -q -l -b 'MemTest.cxx("INPUT_FILENAME", NUM_OF_EVENTS)' > OUTPUT_FILENAME.test
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ March 2016 ~ //

// current functionality: print simple list of event numbers & endpoints

void MemTest( const char *inputfile, int number_of_events ) {
  
  TFile *file0 = TFile::Open(inputfile);
  RAT::DSReader r(inputfile);
  
//double nCapX=0.0;
//double nCapY=0.0;
//double nCapZ=0.0;
  
  for (int event=1; event<=number_of_events; event++) { // event loop
    
    RAT::DS::Root *ds = r.NextEvent();
    RAT::TrackNav nav(ds);
    RAT::TrackCursor c = nav.Cursor(false);
    int children = c.ChildCount();
    for ( int child(0); child<=(children-1); child++ ) { // loop to each child track
      c.GoChild(child);
      RAT::TrackNode *n = c.GoTrackEnd(); // jump to end of track & create TrackNode
      cout << event << endl; // print event number
//    nCapX = n->GetEndpoint().x();
//    nCapY = n->GetEndpoint().y();
//    nCapZ = n->GetEndpoint().z();
//    cout << nCapX << nCapY << nCapZ << endl;
      printf( "% 5.6f\t% 5.6f\t% 5.6f\n\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() ); // print position
//    n->Delete(); // clear node pointer
    } // end child loop
    c.GoParent(); // probably not actually needed
//  somehow delete or clear c? // clear TrackCursor
    nav.Clear(); // clear TrackNav
//  ds->Delete(); // clear data structure
  } // end event loop
  
// all pau!   )
return;

} // end macro