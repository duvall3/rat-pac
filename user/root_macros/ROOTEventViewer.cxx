// ROOTEventViewer -- for viewing RAT-PAC geometry + particle tracks
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //



void ROOTEventViewer( const char* FileName ) {



//// DETECTOR GEOMETRY


// init
TString filename = FileName;
TFile* f = TFile::Open(filename);
TObjString* dtr_path_tos = db->GetValue("DETECTOR[].experiment");
TString dtr_path = dtr_path_tos->GetString();
TString detector_name = dtr_path( dtr_path.Last('/')+1, dtr_path.Length() );
detector_name.ReplaceAll("\"", "");
RAT::DSReader r(filename);
gSystem->Load("libGeom");
TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
// placeholder material / medium
TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
// top volume
TGeoVolume* top = geo->MakeBox("Top", med, 1.e3, 1.e3, 1.e3); //cm
geo->SetTopVolume(top);

//// placeholder box (e.g., cell array)
//TGeoVolume* cell_array = geo->MakeBox("CellArray", med, 22.4, 22.4, 40.2); //cm

// target cell array
TRegexp reg_cellarray = "target_cell_array";
// obnoxious string manipulations to extract the database entries:
// position
TObjString* cellarray_pos_tos = db->GetValue("GEO[target_cell_array].position");
TString cellarray_pos = cellarray_pos_tos->GetString();
cellarray_pos.ReplaceAll("d", "");
cellarray_pos.ReplaceAll("[", "");
cellarray_pos.ReplaceAll(" ", "");
cellarray_pos.Remove(cellarray_pos.Last(','));
TObjArray* ca_pos_arr = cellarray_pos.Tokenize(',');
TObjString* ca_pos_obj_x = ca_pos_arr->At(0);
TObjString* ca_pos_obj_y = ca_pos_arr->At(1);
TObjString* ca_pos_obj_z = ca_pos_arr->At(2);
TString ca_pos_str_x = ca_pos_obj_x->GetString();
TString ca_pos_str_y = ca_pos_obj_y->GetString();
TString ca_pos_str_z = ca_pos_obj_z->GetString();
Double_t ca_pos_x = ca_pos_str_x.Atof();
Double_t ca_pos_y = ca_pos_str_y.Atof();
Double_t ca_pos_z = ca_pos_str_z.Atof();
//cout << cellarray_pos.Data() << endl; //debug
//cout << ca_pos_x << "\t" << ca_pos_y << "\t" << ca_pos_z << endl;//debug
// size
TObjString* cellarray_siz_tos = db->GetValue("GEO[target_cell_array].size");
TString cellarray_siz = cellarray_siz_tos->GetString();
cellarray_siz.ReplaceAll("d", "");
cellarray_siz.ReplaceAll("[", "");
cellarray_siz.ReplaceAll(" ", "");
cellarray_siz.Remove(cellarray_siz.Last(','));
TObjArray* ca_siz_arr = cellarray_siz.Tokenize(',');
TObjString* ca_siz_obj_x = ca_siz_arr->At(0);
TObjString* ca_siz_obj_y = ca_siz_arr->At(1);
TObjString* ca_siz_obj_z = ca_siz_arr->At(2);
TString ca_siz_str_x = ca_siz_obj_x->GetString();
TString ca_siz_str_y = ca_siz_obj_y->GetString();
TString ca_siz_str_z = ca_siz_obj_z->GetString();
Double_t ca_siz_x = ca_siz_str_x.Atof();
Double_t ca_siz_y = ca_siz_str_y.Atof();
Double_t ca_siz_z = ca_siz_str_z.Atof();
//cout << cellarray_siz.Data() << endl; //debug
//cout << ca_siz_x << "\t" << ca_siz_y << "\t" << ca_siz_z << endl;//debug

// finally create cell_array TGeoVolume
TGeoVolume* cell_array = geo->MakeBox("CellArray", med, ca_siz_x, ca_siz_y, ca_siz_z);

//// load detector from db into TGeoManager
//TIter i = db->begin();
//for ( i = db->begin(); i != db->end(); ++i ) {
//
//  // declarations and first entry
//  TPair* tp = *i;
//  TObjString* key = tp->Key();
//  TObjString* val = tp->Value();
//  TString keystr = key->GetString(), valstr = val->GetString();
//
//  // get size values -- FOR NOW, ASSUME 0.5 x 0.5 x 40 cm^3
//  Double_t target_cell_siz_x =  0.5; //cm
//  Double_t target_cell_siz_y =  0.5; //cm
//  Double_t target_cell_siz_z = 20.0; //cm
//
//  // create target cell
//  TGeoVolume* target_celll = geo->MakeBox("target cell", med, target_cell_siz_x, target_cell_siz_y, target_cell_siz_z );
//
////  // test for target cell
////  TRegexp tr = "target_cell_[0-9].*";
////  if ( keystr.Contains(tr) ) {
////    // get cell row, col, lyr
////    keystr.ReplaceAll("GEO[target_cell_", "");
////    TString row_col_lyr = keystr.Remove(keystr.Index(']'));
////  }
//  
//  // test for position entry of target volume
//  TRegexp tr = "target_cell_[0-9].*position";
//  if ( keystr.Contains(tr) ) {
//    
//    // get position values
//    valstr.ReplaceAll("d", "");
//    valstr.ReplaceAll("[", "");
//    valstr.ReplaceAll(" ", "");
//    valstr.Remove(valstr.Last(','));
//    TObjArray* target_cell_pos = valstr.Tokenize(',');
//    TObjString* target_cell_pos_obj_x = target_cell_pos->At(0);
//    TObjString* target_cell_pos_obj_y = target_cell_pos->At(1);
//    TObjString* target_cell_pos_obj_z = target_cell_pos->At(2);
//    TString target_cell_pos_str_x = target_cell_pos_obj_x->GetString();
//    TString target_cell_pos_str_y = target_cell_pos_obj_y->GetString();
//    TString target_cell_pos_str_z = target_cell_pos_obj_z->GetString();
//    Double_t target_cell_pos_x = target_cell_pos_str_x.Atof();
//    Double_t target_cell_pos_y = target_cell_pos_str_y.Atof();
//    Double_t target_cell_pos_z = target_cell_pos_str_z.Atof();
//
////    // get size values -- FOR NOW, ASSUME 0.5 x 0.5 x 40 cm^3
////    Double_t target_cell_siz_x =  0.5; //cm
////    Double_t target_cell_siz_y =  0.5; //cm
////    Double_t target_cell_siz_z = 20.0; //cm
//
////    // create target cell
////    TGeoVolume* target_cell;
////    target_cell = geo->MakeBox("target cell", med, target_cell_siz_x, target_cell_siz_y, target_cell_siz_z );
//
//    // create target cell
//    TGeoTranslation* trans = new TGeoTranslation(target_cell_pos_x, target_cell_pos_y, target_cell_pos_z);
//    target_cell->AddNode(cell_array, 1, trans);
//      
//    } //end if -- target cell
//
//  } //end db loop

// finish and draw
geo->CloseGeometry();
top->SetLineColor(kMagenta);
geo->SetTopVisible(kTRUE);
cell_array->SetLineColor(kBlack);
cell_array->SetLineWidth(0.5);
TString can_name = detector_name+", \""+filename+"\"";
TCanvas* can = new TCanvas("can", can_name, 1000, 100, 850, 700);
top->Draw();
cell_array->Draw("SAME");
TView* view = can->GetView();
// annotations
TLegend *gleg = new TLegend(0.01, 0.01, 0.3, 0.15);
gleg->SetName("Geometry Legend");
gleg->AddEntry(cell_array, "Target Cell Array", "lf");
gleg->AddEntry(top, "Cave Walls", "lf");
gleg->Draw();



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

  // create legend if needed 
  TList* can_list = can->GetListOfPrimitives();
  TLegend* tleg = can_list->FindObject("Track Legend");
  if ( tleg == 0x0 ) {
    TLegend* tleg = new TLegend(0.80, 0.01, 0.99, 0.15);
    tleg->SetName("Track Legend");
    tleg->AddEntry(e_track, e_track->GetName());
    tleg->AddEntry(n_track, n_track->GetName());
    tleg->Draw();
  } else {
    // nothing needed
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

  // return event number for later use (i.e., plotNextEvent or similar)
  return event;
  cout << endl;
  } // end function drawTracks()

//// all pau!   )
}
