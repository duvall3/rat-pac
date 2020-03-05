// RATPACEventViewer -- for viewing RAT-PAC detector geometry and particle tracks in ROOT
//
// -- Usage: "RATPACEventViewer( <RAT-PAC rootfile>, ["target_cell_regex"] )" to draw detector;
//      then "drawTracks( <event number>, [IBD_TF] )" to draw tracks for a given event
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
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //
// ~ RATPACEventviewer v1.2.0 ~ //

#include <drawTracks.cxx>
#include <drawNextEvent.cxx>
#include <drawPrevEvent.cxx>


void RATPACEventViewer( const char* FileName, TString tcs = ".*target_cell_[0-9].*" ) {



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

// load detector from db into TGeoManager
Int_t k_target_cell; // target cell counter
TIter i = db->begin();
for ( i = db->begin(); i != db->end(); ++i ) {

  // declarations and first entry
  TPair* tp = (TPair*)*i;
  TObjString* key = (TObjString*)tp->Key();
  TObjString* val = (TObjString*)tp->Value();
  TString keystr = (TString)key->GetString();
  TString valstr = (TString)val->GetString();
  TString target_cell_pos_str_x = "";
  TString target_cell_pos_str_y = "";
  TString target_cell_pos_str_z = "";
  Double_t target_cell_pos_x, target_cell_pos_y, target_cell_pos_z;
  TString target_cell_siz_str_x = "";
  TString target_cell_siz_str_y = "";
  TString target_cell_siz_str_z = "";
  Double_t target_cell_siz_x, target_cell_siz_y, target_cell_siz_z;


  // test for target cell
  TString tcsp = tcs+"position";
  TRegexp tc = tcsp;
  if ( keystr.Contains(tc) ) {
    // get position values
    valstr.ReplaceAll("d", "");
    valstr.ReplaceAll("[", "");
    valstr.ReplaceAll(" ", "");
    valstr.Remove(valstr.Last(','));
    TObjArray* target_cell_pos = valstr.Tokenize(',');
    TObjString* target_cell_pos_obj_x = (TObjString*)target_cell_pos->At(0);
    TObjString* target_cell_pos_obj_y = (TObjString*)target_cell_pos->At(1);
    TObjString* target_cell_pos_obj_z = (TObjString*)target_cell_pos->At(2);
    target_cell_pos_str_x = target_cell_pos_obj_x->GetString();
    target_cell_pos_str_y = target_cell_pos_obj_y->GetString();
    target_cell_pos_str_z = target_cell_pos_obj_z->GetString();
    target_cell_pos_x = target_cell_pos_str_x.Atof()/10.; //cm
    target_cell_pos_y = target_cell_pos_str_y.Atof()/10.; //cm
    target_cell_pos_z = target_cell_pos_str_z.Atof()/10.; //cm
    
    // clear value half of pair
    valstr.Clear();

    // get size values
    Double_t target_cell_siz_x, target_cell_siz_y, target_cell_siz_z;
    keystr.ReplaceAll("position", "size");
    val = (TObjString*)db->GetValue(keystr);
    valstr = val->GetString();
    valstr.ReplaceAll("d", "");
    valstr.ReplaceAll("[", "");
    valstr.ReplaceAll(" ", "");
    valstr.Remove(valstr.Last(','));
    TObjArray* target_cell_siz = valstr.Tokenize(',');
    TObjString* target_cell_siz_obj_x = (TObjString*)target_cell_siz->At(0);
    TObjString* target_cell_siz_obj_y = (TObjString*)target_cell_siz->At(1);
    TObjString* target_cell_siz_obj_z = (TObjString*)target_cell_siz->At(2);
    target_cell_siz_str_x = target_cell_siz_obj_x->GetString();
    target_cell_siz_str_y = target_cell_siz_obj_y->GetString();
    target_cell_siz_str_z = target_cell_siz_obj_z->GetString();
    target_cell_siz_x = target_cell_siz_str_x.Atof()/10.; //cm
    target_cell_siz_y = target_cell_siz_str_y.Atof()/10.; //cm
    target_cell_siz_z = target_cell_siz_str_z.Atof()/10.; //cm

    // get cell name
    keystr.ReplaceAll("GEO[", "");
    keystr.Remove(keystr.Index("]"));

    // create target cell
    TGeoVolume* target_cell = geo->MakeBox(keystr.Data(), med, target_cell_siz_x, target_cell_siz_y, target_cell_siz_z );
    target_cell->SetLineColor(kBlack);
    target_cell->SetLineWidth(1);
    TGeoTranslation* trans = new TGeoTranslation(target_cell_pos_x, target_cell_pos_y, target_cell_pos_z);
    top->AddNode(target_cell, k_target_cell, trans);
    k_target_cell++;
      
  } //end if -- target cell

} //end db loop

cout << endl;

// finish and draw
geo->CloseGeometry();
top->SetLineColor(kMagenta);
geo->SetTopVisible(kTRUE);
top->SetLineColor(kGray);
top->SetLineWidth(1);
TString can_name = detector_name+", \""+filename+"\"";
TCanvas* can = new TCanvas("can", can_name, 1000, 100, 850, 700);
top->Draw();
top->Draw("SAME");
// annotations
TLegend *gleg = new TLegend(0.01, 0.01, 0.25, 0.15);
gleg->SetName("Geometry Legend");
gleg->AddEntry(target_cell, "Target Cells", "lf");
gleg->AddEntry(top, "Cave Walls", "lf");
gleg->Draw();


// all pau!   )
}
