// drawTracks.cxx -- macro for replacing first function in RATPACEventViewer.cxx
//
// -- USAGE: drawTracks( <Int_t EVENT>, [Bool_t ibd_TF], [Bool_t highlight_TF] );


// PARTICLE TRACKS


// ASSUME IBD -- i.e., 2 primary tracks per event (e+, n0)
// default highlight ON

// define function to draw e+ and n0 tracks for a given top-level MC event
int drawTracks( Int_t event = 0, Bool_t ibd_TF = kTRUE, Bool_t highlight_TF = kTRUE ) {

// init
TTree* tree = (TTree*)gDirectory->FindObjectAny("T");
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
TObjArray* track_list = geo->GetListOfTracks();
Int_t track_no;

// positron (if IBD; otherwise, single primary particle)
n = c.GoChild(0);
parname = n->GetParticleName();
stepcount = c.StepCount();
track_no++;
geo->AddTrack( track_no, n->GetPDGCode() );
TGeoTrack* e_track = track_list->At(track_no-1);
for ( step = 0; step < stepcount; step++ ) {
  n = c.GoStep(step);
//e_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
  e_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
}
e_track->SetName(parname);
e_track->SetLineColor(kRed);
e_track->SetLineWidth(3);
e_track->SetLineStyle(0);

// for IBD, now process neutron

if ( ibd_TF == kTRUE ) {

  // back to top-level MC event
  c.GoParent();

  // neutron
  n = c.GoChild(1);
  parname = n->GetParticleName();
  stepcount = c.StepCount();
  track_no++;
  geo->AddTrack( track_no, n->GetPDGCode() );
  TGeoTrack* n_track = track_list->At(track_no-1);
  for ( step = 0; step < stepcount; step++ ) {
    n = c.GoStep(step);
//  n_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
    n_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
  }
  n_track->SetName(parname);
  n_track->SetLineColor(kBlue);
  n_track->SetLineWidth(3);
  n_track->SetLineStyle(0);

  // capture products
  Int_t cap_prod_count = c.ChildCount();
  Int_t cap_prod_no;
  for ( cap_prod_no=0; cap_prod_no<cap_prod_count; cap_prod_no++ ) {
    n = c.GoChild(cap_prod_no);
    parname = n->GetParticleName();
    stepcount = c.StepCount();
    track_no++;
    geo->AddTrack( track_no, n->GetPDGCode() );
    TGeoTrack* cap_prod_track = track_list->At(track_no-1);
    for ( step = 0; step < stepcount; step++ ) {
      n = c.GoStep(step);
     //ap_prod_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
      cap_prod_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
    }
    cap_prod_track->SetName(parname);
    cap_prod_track->SetLineColor(5+cap_prod_no);
    cap_prod_track->SetLineWidth(3);
    cap_prod_track->SetLineStyle(0);
    c.GoParent();
  } //end for

} //end if -- ibd_TF

// draw tracks and print summary
geo->DrawTracks();
Printf( "\nTrack Summary for Event %i:\n", event);
track_list->Print();

// create legend if needed 
Int_t k;
TList* can_list = can->GetListOfPrimitives();
TLegend* tleg = can_list->FindObject("Track Legend");
if ( tleg != 0x0 )  { tleg->Delete(); }
TLegend* tleg = new TLegend(0.85, 0.01, 0.99, 0.30);
tleg->SetName("Track Legend");
tleg->AddEntry(e_track, e_track->GetName());
if ( ibd_TF == kTRUE )  { tleg->AddEntry(n_track, n_track->GetName()); }
Int_t total_tracks = track_list->GetEntries();
if ( total_tracks > 2 ) {
  for ( k=2; k<total_tracks; k++ ) {
    TGeoTrack* cap_track = (TGeoTrack*)track_list->At(k);
    tleg->AddEntry(cap_track, cap_track->GetName());
  }
}
tleg->Draw();

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

// highlight cells if desired
if ( highlight_TF == kTRUE ) { highlightCells(); }

// return event number for possible additional use
return event;
cout << endl;
} // end function drawTracks()

// all pau!   )
