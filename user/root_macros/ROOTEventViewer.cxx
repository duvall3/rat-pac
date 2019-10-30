// ROOTEventViewer -- for viewing RAT-PAC geometry + particle tracks
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //



void ROOTEventViewer( const char* FileName ) {



//// DETECTOR GEOMETRY


// init
TString filename = FileName;
TFile* f = TFile::Open(filename);
RAT::DSReader r(filename);
gSystem->Load("libGeom");
TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
// placeholder material / medium
TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
// top volume
//TGeoVolume* top = geo->MakeBox("Top", med, 2.1e3, 2.1e3, 2.1e3); //cm
TGeoVolume* top = geo->MakeBox("Top", med, 1.e3, 1.e3, 1.e3); //cm
geo->SetTopVolume(top);


// load detector from db into TGeoManager
/*
 * PENDING
 */ 

// placeholder box (e.g., cell array)
TGeoVolume* cell_array = geo->MakeBox("CellArray", med, 22.4, 22.4, 40.2); //cm

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


// ASSUME IBD -- i.e., 2 primary tracks per event (e+, n0)

// define function to draw e+ and n0 tracks for a given top-level MC event
int drawTracks( Int_t event ) {

  // init
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

  // positron
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

  // back to top-level event
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

  // draw tracks and print summary
  geo->DrawTracks("");
  Printf( "\nIBD Track Summary for Event %i:\n", event);
  geo->GetListOfTracks()->Print();
  
  // return event number for later use (i.e., plotNextEvent or similar)
  return event;
  } // end function drawTracks()

//// all pau!   )
}
