// nextTrack -- spit out [x y z] for next particle track

void nextTrack( const char* filename ) {

//using namespace RAT { // RAT namespace

  cout << "\n" << endl; // separate from init ROOT output

  RAT::DSReader r(filename);

  Long64_t M = T->GetEntries();
  Long64_t m;

  for ( m=0; m<(M-1); m++ ) { // event loop 

    RAT::DS::Root *ds = r.NextEvent();
    RAT::TrackNav nav(ds);
    RAT::TrackCursor c = nav.Cursor(false);
    RAT::TrackNode *n = c.GoChild(0);
    n->GetParticleName();

    Int_t k(0);
    n = c.GoTrackEnd();
    Int_t N = n->GetStepID();
    n = c.GoTrackStart();

    for ( k=0; k<N; k++ ) { // step loop
      n = c.GoStep(k);
      cout << n->GetEndpoint().x() << "\t" << n->GetEndpoint().y() << "\t" << n->GetEndpoint().z() << endl;
    } // end for -- step loop

    cout << n->GetMomentum().x() << "\t" << n->GetMomentum().y() << "\t" << n->GetMomentum().z() << "\n" << endl;

  } // end for -- event loop

//} // end namespace RAT

} // end macro

// all pau!   )
