// drawTracks.cxx -- macro for replacing first function in RATPACEventViewer.cxx
//
// -- USAGE: drawTracks( <Int_t EVENT>, [Bool_t IBD_TF] );


// PARTICLE TRACKS


// ASSUME IBD -- i.e., 2 primary tracks per event (e+, n0)

// define function to draw e+ and n0 tracks for a given top-level MC event
int drawTracks( Int_t event = 0, Bool_t ibd_tf = kTRUE ) {

  // init
  TKey* key_T = gDirectory->FindKey("T");
  TTree* tree = new TTree;
  key_T->Read(tree);
  Int_t last_event = tree->GetEntries()-1;
  if ( event < 0 || event > last_event ) {
    cerr << "Error: No such event (requested event: " << event << "). Final event: " << last_event << "." << endl;
    return -1;
  }
  Int_t step, stepcount;
  TString filename = gDirectory->GetFile()->GetName();
  TString parname;
  RAT::DSReader r(filename);
  RAT::DS::Root *ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(kFALSE);
  RAT::TrackNode *n;
  TGeoManager* geo = gGeoManager;
  geo->ClearTracks();

  // positron (if IBD; otherwise, single primary particle)
  n = c.GoChild(0);
  parname = n->GetParticleName();
  stepcount = c.StepCount();
  geo->AddTrack( 1, n->GetPDGCode() );
  TGeoTrack* e_track = geo->GetListOfTracks()->At(0);
  for ( step = 0; step < stepcount; step++ ) {
    n = c.GoStep(step);
    e_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
  }
  e_track->SetName(parname);
  e_track->SetLineColor(kRed);
  e_track->SetLineWidth(2.0);

  // for IBD, now process neutron

  if ( ibd_tf == kTRUE ) {

    // back to top-level MC event
    c.GoParent();

    // neutron
    n = c.GoChild(1);
    parname = n->GetParticleName();
    stepcount = c.StepCount();
    geo->AddTrack( 2, n->GetPDGCode() );
    TGeoTrack* n_track = geo->GetListOfTracks()->At(1);
    for ( step = 0; step < stepcount; step++ ) {
      n = c.GoStep(step);
      n_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
    }
    n_track->SetName(parname);
    n_track->SetLineColor(kBlue);
    n_track->SetLineWidth(2.0);
  } //end if -- IBD_TF

  // draw tracks and print summary
  geo->DrawTracks();
  Printf( "\nTrack Summary for Event %i:\n", event);
  geo->GetListOfTracks()->Print();

  // create legend if needed 
  TList* can_list = can->GetListOfPrimitives();
  TLegend* tleg = can_list->FindObject("Track Legend");
  if ( tleg == 0x0 ) {
    TLegend* tleg = new TLegend(0.75, 0.01, 0.99, 0.15);
    tleg->SetName("Track Legend");
    tleg->AddEntry(e_track, e_track->GetName());
    if ( ibd_tf == kTRUE ) tleg->AddEntry(n_track, n_track->GetName());
    tleg->Draw();
  }

  // update event label
  TPaveText* label = can_list->FindObject("Event Label");
  if ( label == 0x0 ) {
    TPaveText* label = new TPaveText(-0.2, 0.8, 0.2, 0.9);
    label->SetName("Event Label");
  } else {
    label->Clear();
  }
  TString evname = "Event: ";
  evname += event;
  label->AddText(evname);
  label->Draw();

  // return event number for possible additional use
  return event;
  cout << endl;
} // end function drawTracks()
