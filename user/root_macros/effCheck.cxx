// effCheck.cxx basic cross-check on IBD efficiency
void effCheck(const char* filename){

RAT::DSReader r(filename);
RAT::DS::Root* ds = r.NextEvent();
RAT::TrackNav nav(ds);
RAT::TrackCursor c = nav.Cursor(0);
RAT::TrackNode* n;
TString vol, proc;
Bool_t e_tf, n_tf;
Int_t ev, cap, anh, both;
Int_t N = T->GetEntries();

for ( ev=0; ev<N; ev++ ) {
  e_tf = kFALSE;
  n_tf = kFALSE;
  ds = r.GetEvent(ev);
  RAT::TrackNav nav(ds);
  c = nav.Cursor(0);
  c.GoChild(0);
  n = c.GoTrackEnd();
  vol = n->GetVolume();
  cout << vol.Data() << "\t\t"; //debug
  proc = n->GetProcess();
  cout << proc.Data() << "\t\t"; //debug
  if ( vol.Contains("target_cell") )  { e_tf=kTRUE; anh++; }
  c.GoParent();
  c.GoChild(1);
  n = c.GoTrackEnd();
  vol = n->GetVolume();
  cout << vol.Data() << "\t\t"; //debug
  proc = n->GetProcess();
  cout << proc.Data() << endl; //debug
  if ( vol.Contains("target_cell") )  { n_tf=kTRUE; cap++; }
  if ( e_tf & n_tf )  { both++; }
}

cout << endl;

printf( "e+ annihilating in target: %d\t\t%2.2f%%\n", anh, (100.0*anh)/N );
printf( "n0 capturing    in target: %d\t\t%2.2f%%\n", cap, (100.0*cap)/N );
printf( "events featuring both:     %d\t\t%2.2f%%\n\n", both, (100.0*both)/N );

// all pau!
}
