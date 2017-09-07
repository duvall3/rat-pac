// EndingPoints.cxx -- very simple macro to loop over *single-particle* events and get final positions
// -- recommended usage: root -q -l -b 'EndingPoints.cxx("INPUT_FILENAME",NUMBER_OF_EVENTS)' > OUTPUT_FILENAME
// ~ by Mark J. Duvall ~ mjduvall@hawaii.edu ~ March 2016 ~


void EndingPoints(const char* input_file, int number_of_events) {
  
  TFile *file0 = TFile::Open(input_file);
  RAT::DSReader r(input_file);
  
  for (int event=0; event<=(number_of_events-1); event++) {
    
    RAT::DS::Root *ds = r.NextEvent();
    RAT::TrackNav nav(ds);
    
    RAT::TrackCursor c = nav.Cursor(false);
    c.GoChild(0);
    RAT::TrackNode *n = c.GoTrackEnd();
    printf( "% 5.6f\t% 5.6f\t% 5.6f\n", n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z() );
  
  } // end for loop

//all pau!   )
return;

} // end macro
