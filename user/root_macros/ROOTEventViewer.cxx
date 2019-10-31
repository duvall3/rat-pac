// ROOTEventViewer -- for viewing RAT-PAC geometry + particle tracks
// -- usage: "ROOTEventViewer( <RAT-PAC rootfile> )" to draw detector;
//      "drawTracks( <event number>, [IBD_TF] )" to draw tracks for a given event
// -- "IBD_TF" should be kTRUE for runs using the RAT-PAC IBD generator builtin
//      and kFALSE otherwise
// -- "IBD_TF" is kTRUE by default; this can be changed in the function
//      definition for "drawTracks()"
// -- Example ~ Scan through IBD events:
//      root] .L ROOTEventViewer.cxx
//      root] ROOTEventViewer( "some_IBD_run.root" );
//      root] Int_t event = 0;
//      root] drawTracks(event); event++;
//      root] drawTracks(event); event++;
//      root] drawTracks(event); event++;
//    etc.
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

// target cell array
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
Double_t ca_siz_x = ca_siz_str_x.Atof()/10.; //cm
Double_t ca_siz_y = ca_siz_str_y.Atof()/10.; //cm
Double_t ca_siz_z = ca_siz_str_z.Atof()/10.; //cm
//cout << cellarray_siz.Data() << endl; //debug
//cout << ca_siz_x << "\t" << ca_siz_y << "\t" << ca_siz_z << endl;//debug

// finally create TGeoVolume cell_array
TGeoVolume* cell_array = geo->MakeBox("CellArray", med, ca_siz_x, ca_siz_y, ca_siz_z);

// load detector from db into TGeoManager
Int_t db_entry;
TString rcl_str, row_col_lyr;
TIter i = db->begin();
for ( i = db->begin(); i != db->end(); ++i ) {
//TIterator* i = db->MakeIterator();
//for ( db_entry = 0; db_entry < db->GetEntries(); db_entry++ ) {

  // declarations and first entry
  TPair* tp = *i;
//TPair* tp = (TPair*)i->Next();
  TObjString* key = (TObjString*)tp->Key();
  TObjString* val = (TObjString*)tp->Value();
  TString keystr = (TString)key->GetString();
  TString valstr = (TString)val->GetString();
  TString row_col_lyr = keystr.Copy();
  TString target_cell_pos_str_x = "";
  TString target_cell_pos_str_y = "";
  TString target_cell_pos_str_z = "";
  Double_t target_cell_pos_x, target_cell_pos_y, target_cell_pos_z;
//tp->Print(); //debug
//cout << keystr->Data() << "\t" << valstr->Data() << endl; //debug

  // get size values -- FOR NOW, ASSUME 0.5 x 0.5 x 40 cm^3
  Double_t target_cell_siz_x =  0.5; //cm
  Double_t target_cell_siz_y =  0.5; //cm
  Double_t target_cell_siz_z = 20.0; //cm

  // create model target cell
  TGeoVolume* target_cell = geo->MakeBox("target cell", med, target_cell_siz_x, target_cell_siz_y, target_cell_siz_z );

  // test for target cell
  TRegexp tc = "target_cell_[0-9].*position";
  if ( keystr.Contains(tc) ) {
    // get cell row, col, lyr
    row_col_lyr.ReplaceAll("GEO[target_cell_", "");
    row_col_lyr.Remove(row_col_lyr.Index(']'));
//  cout << row_col_lyr.Data() << "\t"; //debug
  } //end if -- rcl

    // test for position entry of target volume
    TRegexp tr = "target_cell_[0-9].*position";
    if ( keystr.Contains(tr) ) {

//  cout << row_col_lyr.Data() << "\t" << valstr.Data() << endl; //debug

    // get position values
    valstr.ReplaceAll("d", "");
    valstr.ReplaceAll("[", "");
    valstr.ReplaceAll(" ", "");
    valstr.Remove(valstr.Last(','));
//  cout << keystr.Data() << "\t" << valstr.Data() << endl; //debug
    TObjArray* target_cell_pos = valstr.Tokenize(',');
    TObjString* target_cell_pos_obj_x = target_cell_pos->At(0);
    TObjString* target_cell_pos_obj_y = target_cell_pos->At(1);
    TObjString* target_cell_pos_obj_z = target_cell_pos->At(2);
    target_cell_pos_str_x = target_cell_pos_obj_x->GetString();
    target_cell_pos_str_y = target_cell_pos_obj_y->GetString();
    target_cell_pos_str_z = target_cell_pos_obj_z->GetString();
    target_cell_pos_x = target_cell_pos_str_x.Atof()/10.; //cm
    target_cell_pos_y = target_cell_pos_str_y.Atof()/10.; //cm
    target_cell_pos_z = target_cell_pos_str_z.Atof()/10.; //cm
//  cout << target_cell_pos_x << "\t" << target_cell_pos_y << "\t" << target_cell_pos_z << endl; //debug

    // get size values -- FOR NOW, ASSUME 0.5 x 0.5 x 40 cm^3
    Double_t target_cell_siz_x =  0.5; //cm
    Double_t target_cell_siz_y =  0.5; //cm
    Double_t target_cell_siz_z = 20.0; //cm

////  // create target cell
////  TGeoVolume* target_cell;
////  target_cell = geo->MakeBox("target cell", med, target_cell_siz_x, target_cell_siz_y, target_cell_siz_z );

  // create target cell
  TGeoTranslation* trans = new TGeoTranslation(target_cell_pos_x, target_cell_pos_y, target_cell_pos_z);
  cell_array->AddNode(target_cell, 1, trans);
      
  } //end if -- target cell

} //end db loop

cout << endl;

// finish and draw
geo->CloseGeometry();
top->SetLineColor(kMagenta);
geo->SetTopVisible(kTRUE);
cell_array->SetLineColor(kGray);
cell_array->SetLineWidth(0.5);
target_cell->SetLineColor(kBlack);
target_cell->SetLineWidth(1.0);
TString can_name = detector_name+", \""+filename+"\"";
TCanvas* can = new TCanvas("can", can_name, 1000, 100, 850, 700);
top->Draw();
cell_array->Draw("SAME");
TView* view = can->GetView();
// annotations
TLegend *gleg = new TLegend(0.01, 0.01, 0.25, 0.15);
gleg->SetName("Geometry Legend");
gleg->AddEntry(target_cell, "Target Cells", "lf");
gleg->AddEntry(top, "Cave Walls", "lf");
gleg->Draw();



//// PARTICLE TRACKS


// ASSUME IBD -- i.e., 2 primary tracks per event (e+, n0)

// define function to draw e+ and n0 tracks for a given top-level MC event
int drawTracks( Int_t event, Bool_t ibd_tf = kTRUE ) {

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

  // positron if IBD (otherwise, single primary particle)
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
  } //end if -- IBD

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

  // return event number for later use (i.e., plotNextEvent or similar)
  return event;
  cout << endl;
  } // end function drawTracks()

//// all pau!   )
}
