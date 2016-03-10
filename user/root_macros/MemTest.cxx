// MemTest -- testing memory problem
// -- recommended usage:   time root -q -l -b 'MemTest.cxx("INPUT_FILENAME", NUM_OF_EVENTS)' > OUTPUT_FILENAME.test
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ March 2016 ~ //


void MemTest( const char *inputfile, int number_of_events ) {
  
  TFile *file0 = TFile::Open(inputfile);
  RAT::DSReader r(inputfile);
  
  for (int event=1; event<=number_of_events; event++) {
//for (int event=1; event<=number_of_events; event++) { // event loop
    
    RAT::DS::Root *ds = r.NextEvent();
    RAT::TrackNav nav(ds);
    RAT::TrackCursor c = nav.Cursor(false);
    int children = c.ChildCount();
    for ( int child(0); child<=(children-1); child++ ) {
      c.GoChild(child);
      RAT::TrackNode *n = c.GoTrackEnd();
      cout << event << endl;
      printf( "% 5.6f\t% 5.6f\t% 5.6f\n\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() ); // example task
//    n->Delete(); // clear node pointer
    } // end child loop
    c.GoParent();
//  children.Delete(); // clear children
//  c.Delete(); // clear TrackCursor
//  nav.Delete(); // clear TrackNav
//  ds->Delete(); // clear data structure
  } // end event loop
  
// all pau!   )
return;

} // end macro
