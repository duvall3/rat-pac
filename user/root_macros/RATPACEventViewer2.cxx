// RATPACEventViewer2 -- for viewing RAT-PAC detector geometry and particle tracks in ROOT
//
// -- Usage: 'RATPACEventViewer2( <RAT-PAC rootfile> )' to draw detector;
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
//      .L RATPACEventViewer2.cxx
//      RATPACEventViewer2( "some_data_run.root" );
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
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ Written 9/2021 ~ Updated 9/2021 ~ //
// ~ RATPACEventViewer2 v0.5.0 ~ //


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


#include <TRATGeo.cxx>
#include <rpevFunctions.cxx>


//void RATPACEventViewer2( const char* FileName, TString tcs = ".*target_cell_[0-9].*" ) {
//void RATPACEventViewer2( const char* FileName, TString tcs = ".*" ) {
TRATGeo* RATPACEventViewer2( const char* FileName, TString tcs = ".*" ) {

// switch default rendering engine to OpenGL
gStyle->SetCanvasPreferGL(kTRUE);


//// DETECTOR GEOMETRY


// init
TString filename = FileName;
TRegexp tcregex = tcs;
TFile* f = TFile::Open(filename);
TRATGeo* g = new TRATGeo;
g->Build();
TRATGeo *G = &g;
TMap* db = g->GetDB();
TString experiment = g->GetExperiment();
TString experiment_path = g->GetExperimentPath();
RAT::DSReader r(filename);
gSystem->Load("libGeom");
TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
// placeholder material / medium -- meaningless if only used for drawing events
TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
TGeoMedium *ej254_005li6 = new TGeoMedium("vacuum", 1, mat);
TGeoMedium *glass = new TGeoMedium("vacuum", 1, mat);
TString waterstr = "water";
TRegexp waterregex = waterstr;
// top volume //HC//
//TGeoVolume* world = geo->MakeBox("world", med, 1.e3, 1.e3, 1.e3); //cm
//geo->SetTopVolume(world);
enum EColor color;

//// check if scintillator
//TString keystr_scint = material;
//keystr_scint.Prepend("OPTICS[");
//keystr_scint.Append("].SCINTILLATION_option");
//if (db->FindObject(keystr_scint)) {
//  color = kCyan;
//} else if (material.Contains("glass")) {
//  color = kBlack;
//} else if (material.Contains("water")) {
//  color = kBlue;
//} else {
//  color = kGray;
//}

// create TGeoVolumes from TRATVolumes
TList *rvols = g->GetListOfVolumes();
//rvols->ls(); //debug
//cout << "rvols Entries: " << rvols->GetEntries() << endl; //debug
TIter i(rvols);
TRATVolume *rvol;
TString volumeName, volumeMother; //, volumeType;
TVector3 *volumeSize, *volumePosition;
for ( i=rvols->begin(); i!=rvols->end(); ++i ) {
  rvol = (TRATVolume*)*i;
  volumeName = rvol->GetVolName();
  volumeMother = rvol->GetMother();
  volumeSize = rvol->GetSize();
  volumePosition = rvol->GetAbsolutePosition();
  // create volume
  TGeoVolume* volume = geo->MakeBox(volumeName.Data(), med, volumeSize->X(), volumeSize->Y(), volumeSize->Z() );
  if ( volumeName == "world" ) { // top volume //HC//
    if ( ! volume->IsTopVolume() ) {
    geo->SetTopVolume(volume);
    }
  } else { // all other volumes
    volume->SetLineWidth(1);
    volume->SetLineColor(kBlack);
  } // endif -- world (top)
} // end volume loop

// now incorporate mother(s) and create nodes
TObjArray* vols = geo->GetListOfVolumes();
TGeoVolume* world = (TGeoVolume*)vols->FindObject("world");
geo->SetTopVolume(world);
TGeoVolume* mother = new TGeoVolume; // mother volume
Int_t k_volume(0); // volume counter
// loop over creted TGeoVolumes
TGeoVolume *vol, *volMother;
TString volname, volMotherName;
TGeoTranslation *trans;
TIter iv = vols->begin();
//vols->ls(); //debug
for ( iv = vols->begin(); iv != vols->end(); ++iv ) {

  // get volume
  vol = (TGeoVolume*)*iv;
//vol = (TGeoVolume*)vols->FindObject("target_bar_9");
  volname = vol->GetName();
  rvol = (TRATVolume*)g->GetVolume(volname.Data());
  volPosition = rvol->GetAbsolutePosition();

  if (vol->IsTopVolume()) continue; // skip world (already positioned when made top volume)

  trans = new TGeoTranslation( volPosition->X(), volPosition->Y(), volPosition->Z() );
//trans->Print(); //debug

  // find mother and add node
  volMotherName = rvol->GetMother();
  volMother = (TGeoVolume*)vols->FindObject(volMotherName.Data());
  if (volname.Contains(tcregex)) volMother->AddNode(vol, k_volume, trans);
  k_volume++;

//delete trans;

} // end mother/node db loop

cout << endl;

// finish and draw
geo->CloseGeometry();
world->SetLineColor(kGray);
world->SetLineWidth(1);
//geo->SetTopVisible(kFALSE);
geo->SetTopVisible(kTRUE);
TString can_name = experiment+", \""+filename+"\"";
TCanvas* can = new TCanvas("can", can_name, 1000, 100, 850, 700);
//can->SetFillColor(kCyan);
world->Draw();
// draw desired volumes
//for ( iv = vols->begin(); iv != vols->end(); ++iv ) {
//  vol = (TGeoVolume*)*iv;
//  volname = vol->GetName();
//  if (volname.Contains(tcregex)) vol->Draw("SAME");
//}
//vol->Draw();

// annotations
TLegend *gleg = new TLegend(0.01, 0.01, 0.25, 0.15);
gleg->SetName("Geometry Legend");
gleg->AddEntry(volume, "Detector Volume(s)", "lf");
//gleg->AddEntry(target_cell, "Target Cells", "lf");
gleg->AddEntry(world, "Cave Walls", "lf");
gleg->Draw();

// all pau!   )
return g;
}
