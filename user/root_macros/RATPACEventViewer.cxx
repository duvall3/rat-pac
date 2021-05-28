// RATPACEventViewer -- for viewing RAT-PAC detector geometry and particle tracks in ROOT
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
// ~ RATPACEventviewer v1.7.0 ~ //


//Copyright (C) 2021 Mark J. Duvall
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.


#include <drawTracks.cxx>
#include <drawNextEvent.cxx>
#include <drawPrevEvent.cxx>
#include <highlightCells.cxx>


//void RATPACEventViewer( const char* FileName, TString tcs = ".*target_cell_[0-9].*" ) {
void RATPACEventViewer( const char* FileName, TString tcs = ".*" ) {



//// DETECTOR GEOMETRY


// init
TString filename = FileName;
TRegexp tcregex = tcs;
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
TString waterstr = "water";
TRegexp waterregex = waterstr;
// top volume //HC//
//TGeoVolume* world = geo->MakeBox("world", med, 1.e3, 1.e3, 1.e3); //cm
//geo->SetTopVolume(world);

// load *entire* detector from db into TGeoManager
//Int_t k_volume = 1; // volume counter //for drawing entire detector
//TGeoTranslation* trans = new TGeoTranslation; //for drawing entire detector
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

    // get cell name
    keystr.ReplaceAll("GEO[", "");
    keystr.Remove(keystr.Index("]"));

    // create volume
    TGeoVolume* volume = geo->MakeBox(keystr.Data(), med, volume_siz_x, volume_siz_y, volume_siz_z );
    if ( keystr == "world" ) { // top volume //HC//
      if ( ! volume->IsTopVolume() ) {
      geo->SetTopVolume(volume);
      }
    } else { // all other volumes
      if (keystr.Contains(waterregex)) {
        volume->SetLineColor(kBlue);
      } else {
	volume->SetLineColor(kBlack);
      }
      volume->SetLineWidth(1);
//    trans->SetTranslation(volume_pos_x, volume_pos_y, volume_pos_z); //for drawing entire detector
//    top->AddNode(volume, k_volume, trans); //for drawing entire detector
//    k_volume++; //for drawing entire detector
    } // endif -- world (top)

  } //endif -- isvolume

} //end db loop

// now incorporate mother(s) and create nodes
TObjArray* vols = geo->GetListOfVolumes();
TGeoVolume* world = (TGeoVolume*)vols->FindObject("world");
geo->SetTopVolume(world);
TGeoVolume* mother = new TGeoVolume; // mother volume
Int_t k_volume(0); // volume counter

//vols->Print(); //debug

// loop over creted TGeoVolumes
TIter iv = vols->begin();
for ( iv = vols->begin(); iv != vols->end(); ++iv ) {

  // get volume
  TGeoVolume* vol = (TGeoVolume*)*iv;
  TString volname = vol->GetName();
  keystr = volname;
  keystr.Prepend("GEO[");
  keystr.Append("].position");
  val = (TObjString*)db->GetValue(keystr);

  if (volname != "world") { // skip world (already positioned when made top volume)

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
      TGeoTranslation* trans = new TGeoTranslation(volume_pos_x, volume_pos_y, volume_pos_z); // position translation
//    //debug
//    cout << keystr << "\t" << valstr << "\t" << val->GetString() << endl;
//    cout << volume_pos_x << "\t" << volume_pos_y << "\t" << volume_pos_z << endl;
//    trans->Print();
      }// else {
        //trans = new TGeoTranslation(0.,0.,0.);
      //} //endif -- position given

    // find mother and add node
    TString vol_mother_entry(volname);
    vol_mother_entry.Prepend("GEO[");
    vol_mother_entry.Append("].mother");
    TObjString* volmother_tos = (TObjString*)db->GetValue(vol_mother_entry);
    TString volmother = volmother_tos->GetString();
    volmother.ReplaceAll("\"","");
    TGeoVolume* mother = (TGeoVolume*)vols->FindObject(volmother);
  //cout << volname.Data() << "\t" << vol_mother_entry.Data() << "\t" << volmother.Data() << "\t"<< mother << endl; //debug
  //trans->Print(); //debug
    if (volname.Contains(tcregex)) mother->AddNode(vol, k_volume, trans);
  //world->AddNode(vol, k_volume, trans); //debug
    k_volume++;

  } //endif -- skipping top volume

} // end mother/node db loop

cout << endl;

// finish and draw
geo->CloseGeometry();
world->SetLineColor(kGray);
world->SetLineWidth(1);
//geo->SetTopVisible(kFALSE);
geo->SetTopVisible(kTRUE);
TString can_name = detector_name+", \""+filename+"\"";
TCanvas* can = new TCanvas("can", can_name, 1000, 100, 850, 700);
world->Draw();
// draw desired volumes
for ( iv = vols->begin(); iv != vols->end(); ++iv ) {
  vol = (TGeoVolume*)*iv;
  volname = vol->GetName();
  if (volname.Contains(tcregex)) vol->Draw("SAME");
}

// annotations
TLegend *gleg = new TLegend(0.01, 0.01, 0.25, 0.15);
gleg->SetName("Geometry Legend");
gleg->AddEntry(volume, "Detector Volume(s)", "lf");
//gleg->AddEntry(target_cell, "Target Cells", "lf");
gleg->AddEntry(world, "Cave Walls", "lf");
gleg->Draw();

// all pau!   )
}
