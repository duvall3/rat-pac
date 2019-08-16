ds = r.NextEvent();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(false);
RAT::TrackNode *n = c.GoChild(0);



Int_t k(0);
n = c.GoTrackEnd();
Int_t N = n->GetStepID();
n = c.GoTrackStart();

for ( k=0; k<N; k++ ) {
  n = c.GoStep(k);
  cout << n->GetEndpoint().x() << "\t" << n->GetEndpoint().y() << "\t" << n->GetEndpoint().z() << endl;
}


