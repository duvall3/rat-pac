// ROOTEventViewer -- for viewing RAT-PAC geometry + particle tracks
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //



void ROOTEventViewer( const char* FileName ) {



//// DETECTOR GEOMETRY


// init

TString filename = FileName;
gSystem->Load("libGeom");
TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
// placeholder material / medium
TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
// top volume
TGeoVolume* top = geo->MakeBox("Top", med, 1.2e5, 1.2e5, 1.2e5); //cm
geo->SetTopVolume(top);


// load detector into TGeoManager
/*
 * PENDING
 */ 

// placeholder box (e.g., cell array)
//TGeoVolume* cell_array = geo->MakeBox("CellArray", med, 22.4, 22.4, 40.2); //cm
TGeoVolume* cell_array = geo->MakeBox("CellArray", med, 2240, 2240, 4020); //cm -- scaled up temporarily

// finish and draw
geo->CloseGeometry();
top->SetLineColor(kMagenta);
geo->SetTopVisible(kTRUE); //debug
cell_array->SetLineColor(kBlack);
cell_array->SetLineWidth(2.0);
TCanvas* can = new TCanvas("can", filename, 1000, 100, 850, 700);
top->Draw();
cell_array->Draw("SAME");
TView* view = can->GetView();



//// PARTICLE TRACKS

// init using event 0, particle/track 0
Int_t primary_tracks_this_event(0), primary_id(0), track_id(0), step, stepcount;
Int_t track_id(0); //POSSIBLE ISSUE: Should these track ID's be forced to match RAT-PAC's?
RAT::DSReader r(filename);
RAT::DS::Root *ds = r.GetEvent(0);
RAT::DS::MC *mc = ds->GetMC();
//RAT::TrackNav nav(ds);
//RAT::TrackCursor c = nav.Cursor(kFALSE);
//RAT::TrackNode *n = c.GoChild(0);
RAT::DS::MCParticle* par;
RAT::DS::MCTrack* mct;
RAT::DS::MCTrackStep* mcts;

//// GENERAL VERSION:
//// generate list of primary tracks 
//primary_tracks_this_event = mc->GetMCParticleCount();
//for ( primary_id = 0; primary_id < primary_tracks_this_event; primary_id++ ) {
//  par = mc->GetMCParticle(primary_id);
//  mct = mc->GetMCTrack(primary_id);
////track_id = geo->AddTrack( mct->GetID(), par->GetPDGCode(), par );
//  geo->AddTrack( primary_id, par->GetPDGCode(), par );
//}
//// fill tracks
//TObjArray* track_list = geo->GetListOfTracks();
//TIter i = track_list->begin();
//// per track:
//Int_t track_num;
//for ( track_num = 0; track_num < primary_tracks_this_event; track_num++ ) {
//  stepcount = mct->GetMCTrackStepCount();
//  TGeoTrack* track = *i;
//  for ( step = 0; step < stepcount; step++ ) {
//    mcts = mct->GetMCTrackStep(step);
//    track->AddPoint( mcts->GetEndpoint().x(), mcts->GetEndpoint().y(), mcts->GetEndpoint().z(), mcts->GetGlobalTime() );
//  }
//}


// ASSUME IBD -- i.e., 2 primary tracks per event (e+, n0)

// positron
par = mc->GetMCParticle(0);
mct = mc->GetMCTrack(0);
stepcount = mct->GetMCTrackStepCount();
geo->AddTrack( 0, par->GetPDGCode(), par );
//TIter i = geo->GetListOfTracks()->begin();
//TGeoTrack* track = *i;
TGeoTrack* e_track = geo->GetListOfTracks()->At(0);
for ( step = 0; step < stepcount; step++ ) {
  mcts = mct->GetMCTrackStep(step);
  e_track->AddPoint( mcts->GetEndpoint().x(), mcts->GetEndpoint().y(), mcts->GetEndpoint().z(), mcts->GetGlobalTime() );
}
e_track->SetLineColor(kRed);
e_track->SetLineWidth(2.0);

// neutron
par = mc->GetMCParticle(1);
mct = mc->GetMCTrack(1);
stepcount = mct->GetMCTrackStepCount();
geo->AddTrack( 1, par->GetPDGCode(), par );
//TIter i = geo->GetListOfTracks()->end();
//TGeoTrack* track = *i;
TGeoTrack* n_track = geo->GetListOfTracks()->At(1);
for ( step = 0; step < stepcount; step++ ) {
  mcts = mct->GetMCTrackStep(step);
  n_track->AddPoint( mcts->GetEndpoint().x(), mcts->GetEndpoint().y(), mcts->GetEndpoint().z(), mcts->GetGlobalTime() );
}
n_track->SetLineColor(kBlue);
n_track->SetLineWidth(2.0);

// draw tracks
//geo->DrawTracks("");
//geo->DrawTracks("SAME");
e_track->Draw();
//n_track->Draw();

cout << endl << geo->GetListOfTracks()->GetEntries() << endl; //debug
geo->GetListOfTracks()->Print(); //debug


//// all pau!   )
}