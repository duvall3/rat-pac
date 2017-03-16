// TestFindNextTrack -- simple macro to output all TrackID's in a run
// -- hoping to ensure that RAT::TrackCursor::FindNextTrack does indeed visit each track exactly once


void TestFindNextTrack( const char* filename ) {


// load file
TFile *f = TFile::Open(filename);
RAT::DSReader r(filename);

printf( "\n\n### Track IDs in %s from RAT::TrackCursor::FindNextTrack ###\n", filename );

//// loop over tracks
//Int_t num_of_events = T->GetEntries();
//Int_t event(0);
//for ( Int_t k=0; k<num_of_events; k++) {
//  printf( "%i\n", n->Get
//}

// loop over events
Int_t num_of_events = T->GetEntries();
Int_t event;
for ( event=0; event<num_of_events; event++ ) {
RAT::DS::Root *ds = r.GetEvent(event);
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(false);
RAT::TrackNode *n = c.GoChild(0);
  // loop over tracks
  while ( n != 0 ) {
    printf( "%i\n", n->GetTrackID() );
    n = c.FindNextTrack();
  }
}


// all pau!   )
}
