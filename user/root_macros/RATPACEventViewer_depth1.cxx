// RATPACEventViewer_depth1 -- for viewing RAT-PAC detector geometry and particle tracks in ROOT;
//   attempting to upgrade to incorporate (at least 1 level of) mother volumes
//
// -- Usage: 'RATPACEventViewer( <RAT-PAC rootfile> )' to draw detector;
//      then 'drawTracks( <event number>, [IBD_TF], [highlight_TF] )' to draw tracks for a given event
//
// -- Primarily written for IBD events, but should work just fine for anything
//      with either one particle per top-level MC event (use IBD_TF = kFALSE)
//      or two (use IBD_TF = kTRUE or simply omit IBD_TF argument)
//
// -- "target_cell_regex" determines which detector volumes will be drawn;
//      it defaults to ".*target_cell_[0-9].*", but any regex
//      matching (exclusively) your desired volumes should work
//      -- for more information on ROOT-compatible regexes, see:
//         https://root.cern.ch/doc/master/classTRegexp.html
//
// -- "IBD_TF" should be kTRUE for runs using the RAT-PAC IBD generator builtin
//      and kFALSE otherwise
//      -- note: in standard ROOT, kTRUE == true == 1 and kFALSE == false == 0
//
// -- "IBD_TF" is kTRUE by default; this default can be changed in the function
//      definition for "drawTracks()" if desired
//
// -- "highlight_TF" simply switches cell highlighting on or off (default is on)
//    -- default for IBD events:
//       green = generation cell
//       red = positron-annihilation cell
//       blue = neutron-capture cell
//
// -- Example ~ Scan through some events:
//      .L RATPACEventViewer.cxx
//      RATPACEventViewer( "some_data_run.root" );
//      drawTracks(0);
//      drawNextEvent();
//      drawNextEvent();
//      drawNextEvent();
//
// -- As of this version, the following items are still hard-coded
//    and are tagged with //HC// in the code below:
//    - name of top & world volumes
//    - shape of top & world volumes
//    - dimensions of top & world volumes
//    - shapes of target cells (currently "box")
//    - material of target cells (currently Eljen EJ-254 doped at 1.5%wt Li-6)
//
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ Written 10/2019 ~ Updated 5/2021 ~ //
// ~ RATPACEventviewer_depth1 v0.5.0 ~ //

#include <drawTracks.cxx>
#include <drawNextEvent.cxx>
#include <drawPrevEvent.cxx>
#include <highlightCells.cxx>


//void RATPACEventViewer( const char* FileName, TString tcs = ".*target_cell_[0-9].*" ) {
void RATPACEventViewer_depth1( const char* FileName ) {



//// DETECTOR GEOMETRY


// init
TString filename = FileName;
TFile* f = TFile::Open(filename);
TKey* db_key = f->FindKey("db");
TMap* db = new TMap;
db_key->Read(db);
TObjString* dtr_path_tos = (TObjString*)db->GetValue("DETECTOR[].experiment");
TString dtr_path = dtr_path_tos->GetString();
TString detector_name = dtr_path( dtr_path.Last('/')+1, dtr_path.Length() );
detector_name.ReplaceAll("\"", "");
RAT::DSReader r(filename);
gSystem->Load("libGeom");
TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
// placeholder material / medium -- meaningless if only used for drawing events
TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
// top volume //HC//
TGeoVolume* top = geo->MakeBox("Top", med, 1.e3, 1.e3, 1.e3); //cm
geo->SetTopVolume(top);

// load *entire* detector from db into TGeoManager
Int_t k_volume; // target cell counter
TIter i = db->begin();
for ( i = db->begin(); i != db->end(); ++i ) {

  // declarations and first entry
  TPair* tp = (TPair*)*i;
  TObjString* key = (TObjString*)tp->Key();
  TObjString* val = (TObjString*)tp->Value();
  TString keystr = (TString)key->GetString();
  TString valstr = (TString)val->GetString();
  TString volume_pos_str_x = "";
  TString volume_pos_str_y = "";
  TString volume_pos_str_z = "";
  Double_t volume_pos_x, volume_pos_y, volume_pos_z;
  TString volume_siz_str_x = "";
  TString volume_siz_str_y = "";
  TString volume_siz_str_z = "";
  Double_t volume_siz_x, volume_siz_y, volume_siz_z;
//  TString target_cell_pos_str_x = "";
//  TString target_cell_pos_str_y = "";
//  TString target_cell_pos_str_z = "";
//  Double_t target_cell_pos_x, target_cell_pos_y, target_cell_pos_z;
//  TString target_cell_siz_str_x = "";
//  TString target_cell_siz_str_y = "";
//  TString target_cell_siz_str_z = "";
//  Double_t target_cell_siz_x, target_cell_siz_y, target_cell_siz_z;

  cout << keystr.Data() << "\t" << valstr.Data() << endl;//debug

  // test for volume
  TString volszstr = "size";
  TRegexp volre = volszstr;
  if ( keystr.Contains(volre) ) {
    // get size values
    valstr.ReplaceAll("d", "");
    valstr.ReplaceAll("[", "");
    valstr.ReplaceAll(" ", "");
    valstr.Remove(valstr.Last(','));
    TObjArray* volume_siz = valstr.Tokenize(',');
    TObjString* volume_siz_obj_x = (TObjString*)volume_siz->At(0);
    TObjString* volume_siz_obj_y = (TObjString*)volume_siz->At(1);
    TObjString* volume_siz_obj_z = (TObjString*)volume_siz->At(2);
    volume_siz_str_x = volume_siz_obj_x->GetString();
    volume_siz_str_y = volume_siz_obj_y->GetString();
    volume_siz_str_z = volume_siz_obj_z->GetString();
    volume_siz_x = volume_siz_str_x.Atof()/10.; //cm
    volume_siz_y = volume_siz_str_y.Atof()/10.; //cm
    volume_siz_z = volume_siz_str_z.Atof()/10.; //cm

    // clear value half of pair
    valstr.Clear();

    // get position values
    keystr.ReplaceAll("size", "position");
    val = (TObjString*)db->GetValue(keystr);
    if (val != 0x0) { // if position is specified, replace default zero values
      valstr = val->GetString();
      valstr.ReplaceAll("d", "");
      valstr.ReplaceAll("[", "");
      valstr.ReplaceAll(" ", "");
      valstr.Remove(valstr.Last(','));
      TObjArray* volume_pos = valstr.Tokenize(',');
      TObjString* volume_pos_obj_x = (TObjString*)volume_pos->At(0);
      TObjString* volume_pos_obj_y = (TObjString*)volume_pos->At(1);
      TObjString* volume_pos_obj_z = (TObjString*)volume_pos->At(2);
      volume_pos_str_x = volume_pos_obj_x->GetString();
      volume_pos_str_y = volume_pos_obj_y->GetString();
      volume_pos_str_z = volume_pos_obj_z->GetString();
      volume_pos_x = volume_pos_str_x.Atof()/10.; //cm
      volume_pos_y = volume_pos_str_y.Atof()/10.; //cm
      volume_pos_z = volume_pos_str_z.Atof()/10.; //cm
    } //endif -- position given

//    // get mother volume
//    TString tcm = tcs+"mother";
////  cout << endl << tcm.Data() << endl; //debug
//    TRegexp tm = tcm;
//    TGeoVolume* mother;
////  if ( keystr.Contains(tm) ) {
////    valstr.ReplaceAll("\\","");
////    valstr.ReplaceAll("\"","");
//    mother = (TGeoVolume*)geo->GetListOfVolumes()->FindObject(valstr);
////  }
////  cout << 
//    // get mother volume's location

    // get cell name
    keystr.ReplaceAll("GEO[", "");
    keystr.Remove(keystr.Index("]"));

    // create volume
    TGeoVolume* volume = geo->MakeBox(keystr.Data(), med, volume_siz_x, volume_siz_y, volume_siz_z );
    volume->SetLineColor(kBlack);
    volume->SetLineWidth(1);
    TGeoTranslation* trans = new TGeoTranslation(volume_pos_x, volume_pos_y, volume_pos_z);
    top->AddNode(volume, k_volume, trans);
  //mother->AddNode(volume, k_volume, trans);
    k_volume++;

  } //endif -- isvolume

} //end db loop

cout << endl;

//// test for target cell
//TString tcsp = tcs+"size";
//TRegexp tc = tcsp;
//if ( keystr.Contains(tc) ) {
//Int_t k_target_cell; // target cell counter
//    // get size values
//    valstr.ReplaceAll("d", "");
//    valstr.ReplaceAll("[", "");
//    valstr.ReplaceAll(" ", "");
//    valstr.Remove(valstr.Last(','));
//    TObjArray* target_cell_siz = valstr.Tokenize(',');
//    TObjString* target_cell_siz_obj_x = (TObjString*)target_cell_siz->At(0);
//    TObjString* target_cell_siz_obj_y = (TObjString*)target_cell_siz->At(1);
//    TObjString* target_cell_siz_obj_z = (TObjString*)target_cell_siz->At(2);
//    target_cell_siz_str_x = target_cell_siz_obj_x->GetString();
//    target_cell_siz_str_y = target_cell_siz_obj_y->GetString();
//    target_cell_siz_str_z = target_cell_siz_obj_z->GetString();
//    target_cell_siz_x = target_cell_siz_str_x.Atof()/10.; //cm
//    target_cell_siz_y = target_cell_siz_str_y.Atof()/10.; //cm
//    target_cell_siz_z = target_cell_siz_str_z.Atof()/10.; //cm
//
//    // clear value half of pair
//    valstr.Clear();
//
//    // get position values
//    keystr.ReplaceAll("size", "position");
//    val = (TObjString*)db->GetValue(keystr);
//    if (val != 0x0) { // if position is specified, replace default zero values
//      valstr = val->GetString();
//      valstr.ReplaceAll("d", "");
//      valstr.ReplaceAll("[", "");
//      valstr.ReplaceAll(" ", "");
//      valstr.Remove(valstr.Last(','));
//      TObjArray* target_cell_pos = valstr.Tokenize(',');
//      TObjString* target_cell_pos_obj_x = (TObjString*)target_cell_pos->At(0);
//      TObjString* target_cell_pos_obj_y = (TObjString*)target_cell_pos->At(1);
//      TObjString* target_cell_pos_obj_z = (TObjString*)target_cell_pos->At(2);
//      target_cell_pos_str_x = target_cell_pos_obj_x->GetString();
//      target_cell_pos_str_y = target_cell_pos_obj_y->GetString();
//      target_cell_pos_str_z = target_cell_pos_obj_z->GetString();
//      target_cell_pos_x = target_cell_pos_str_x.Atof()/10.; //cm
//      target_cell_pos_y = target_cell_pos_str_y.Atof()/10.; //cm
//      target_cell_pos_z = target_cell_pos_str_z.Atof()/10.; //cm
//    }
//
//  } //end if -- target cell
//volume->SetLineColor(kCyan);

// finish and draw
geo->CloseGeometry();
top->SetLineColor(kMagenta);
geo->SetTopVisible(kFALSE);
top->SetLineColor(kGray);
top->SetLineWidth(1);
TString can_name = detector_name+", \""+filename+"\"";
TCanvas* can = new TCanvas("can", can_name, 1000, 100, 850, 700);
top->Draw();
top->Draw("SAME");
// annotations
TLegend *gleg = new TLegend(0.01, 0.01, 0.25, 0.15);
gleg->SetName("Geometry Legend");
gleg->AddEntry(volume, "Detector Volume(s)", "lf");
//gleg->AddEntry(target_cell, "Target Cells", "lf");
gleg->AddEntry(top, "Cave Walls", "lf");
gleg->Draw();

// all pau!   )
}
