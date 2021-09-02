// TRATEventViewer -- class for visualizing RAT-PAC events
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ //

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

#include <TRATEventViewer.h>

// Call the ClassImp() macro to give the TRATEventViewer class RTTI and full I/O capabilities.
#if !defined(__CLING__)
  ClassImp(TRATEventViewer);
#endif

const TString defaultName = "TRATEventViewer";
const TString defaultTitle = "class for assembling geometry from RAT-PAC ROOT file";

//______________________________________________________________________________
// default ctor
TRATEventViewer::TRATEventViewer()
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fFile = 0;
  fFileName = "";
  fExperiment = "";
  fExperimentPath = "";
  fDB = 0;
  fRATGeo = 0;
  fGeoManager = 0;
}

//______________________________________________________________________________
// alternate ctor
TRATEventViewer::TRATEventViewer(const char* filename)
{
  SetName(defaultName);
  SetTitle(defaultTitle);
  fRATGeo = 0;
  fGeoManager = 0;
  TFile::Open(filename);
  Init();
}

//______________________________________________________________________________
// FindExperiment
TRATEventViewer::FindExperiment()
{
  if ( fDB == 0x0 ) {
    TString warnLoc = TString::Format("%s::FindExperiment", Class_Name());
    TString warnMsg = TString::Format("RAT-PAC database not found in %s; experiment name and path unknown.", fFileName);
    Warning(warnLoc.Data(), warnMsg.Data());
    fExperiment = "";
    fExperimentPath = "";
  } else {
    TPair* tp = fDB->FindObject("DETECTOR[].experiment");
    TObjString* tos = tp->Value();
    fExperimentPath = tos->GetString();
    fExperimentPath.ReplaceAll("\"", "");
    TString experimentPath = fExperimentPath;
    TObjArray* toa = experimentPath.Tokenize("/");
    tos = (TObjString*)toa->At(toa->GetEntries()-1);
    fExperiment = tos->GetString();
  }
}

//______________________________________________________________________________
// Init
TRATEventViewer::Init()
{
  if (gFile) {
    fFile = gFile;
    fFileName = fFile->GetName();
  } else {
    fFile = 0;
    fFileName = "";
  }
  fDB = (TMap*)fFile->FindObjectAny("db");
  if (fDB == 0) {
    TString errMsg = "RAT-PAC database \"db\" not found\n";
    this->Error("TRATVolume(const char* name)", errMsg.Data());
    return;
  }
  FindExperiment();
}

//______________________________________________________________________________
// Build
TRATEventViewer::Build()
{
  Init();
  // Build init
  TString tcs = ".*" ;
  TString filename = fFileName;
  TRegexp tcregex = tcs;
  TFile* f = TFile::Open(filename);
  TRATGeo g;
  fRATGeo = &g;
  g.Build();
  TMap* db = fDB;
  TString experiment = fExperiment;
  TString experiment_path = fExperimentPath;
  RAT::DSReader r(filename);
  gSystem->Load("libGeom");
  TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
  fGeoManager = geo;
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
  // create TGeoVolumes from TRATVolumes
  TList *rvols = g.GetListOfVolumes();
  TIter i(rvols);
  TRATVolume *rvol;
  TString volumeName, volumeMother; //, volumeType;
  TVector3 volumeSize, volumePosition;
  for ( i=rvols->begin(); i!=rvols->end(); ++i ) {
    rvol = (TRATVolume*)*i;
    volumeName = rvol->GetVolName();
    volumeMother = rvol->GetMother();
    volumeSize = rvol->GetSize();
    volumePosition = rvol->GetAbsolutePosition();
    // create volume
    TGeoVolume* volume = geo->MakeBox(volumeName.Data(), med, volumePosition.X(), volumePosition.Y(), volumePosition.Z() );
    if ( volumeName == "world" ) { // top volume //HC//
      if ( ! volume->IsTopVolume() ) {
      geo->SetTopVolume(volume);
      }
    } else { // all other volumes
      volume->SetLineWidth(1);
    } // endif -- world (top)
  } // end volume loop
  // now incorporate mother(s) and create nodes
  TObjArray* vols = geo->GetListOfVolumes();
  TGeoVolume* world = (TGeoVolume*)vols->FindObject("world");
  geo->SetTopVolume(world);
  TGeoVolume* mother = new TGeoVolume; // mother volume
  Int_t k_volume(0); // volume counter
  // loop over creted TGeoVolumes
  TGeoVolume *vol, volMother;
  TString volname;
  TIter iv = vols->begin();
  for ( iv = vols->begin(); iv != vols->end(); ++iv ) {
    // get volume
    vol = (TGeoVolume*)*iv;
    volname = vol->GetName();
    rvol = (TRATVolume*)g.GetVolume(volname.Data());
    volPosition = rvol->GetAbsolutePosition();
    if (volname != "world") { // skip world (already positioned when made top volume)
      TGeoTranslation* trans = new TGeoTranslation( volPosition.X(), volPosition.Y(), volPosition.Z() );
      // find mother and add node
      volMother = (TGeoVolume*)vols->FindObject(rvol->GetMother().Data());
      if (volname.Contains(tcregex)) volMother->AddNode(vol, k_volume, trans);
      k_volume++;
    } //endif -- skipping top volume
  //delete trans;
  } // end mother/node db loop
  // finish and draw
  geo->CloseGeometry();
  world->SetLineColor(kGray);
  world->SetLineWidth(1);
  geo->SetTopVisible(kFALSE);
  //geo->SetTopVisible(kTRUE);
  TString can_name = experiment+", \""+filename+"\"";
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
}

////______________________________________________________________________________
//TRATEventViewer::
//{
//}

////______________________________________________________________________________
//TRATEventViewer::
//{
//}

//______________________________________________________________________________
// override Print
TRATEventViewer::Print()
{
  printf("\n");
  printf("%s\t%s\t%s\n", Class_Name(), GetName(), GetTitle());
  printf("Experiment:\t\t%s\n", fExperiment.Data());
  printf("Experiment Path:\t%s\n", fExperimentPath.Data());
  printf("ROOT File:\t%s\n", fFileName);
  printf("RAT-PAC Database TMap*: "); cout << fDB << endl;
  printf("TRATGeo: "); cout << fRATGeo << endl;
  printf("TGeoManager: "); cout << fGeoManager << endl;
  printf("\n");
}

// all pau!   )



//// define function to draw e+ and n0 tracks for a given top-level MC event
//int drawTracks( Int_t event = 0, Bool_t ibd_TF = kTRUE, Bool_t highlight_TF = kTRUE ) {
//
//  // init
//  TTree* tree = (TTree*)gDirectory->FindObjectAny("T");
//  Int_t last_event = tree->GetEntries()-1;
//  if ( event < 0 || event > last_event ) {
//    cerr << "Error: No such event (requested event: " << event << "). Final event: " << last_event << "." << endl;
//    return -1;
//  }
//  Int_t step, stepcount;
//  TString filename = gDirectory->GetFile()->GetName();
//  TString parname;
//  RAT::DSReader r(filename);
//  RAT::DS::Root *ds = r.GetEvent(event);
//  RAT::TrackNav nav(ds);
//  RAT::TrackCursor c = nav.Cursor(kFALSE);
//  RAT::TrackNode *n;
//  TGeoManager* geo = gGeoManager;
//  geo->ClearTracks();
//  TObjArray* track_list = geo->GetListOfTracks();
//  Int_t track_no;
//
//  // positron (if IBD; otherwise, single primary particle)
//  n = c.GoChild(0);
//  parname = n->GetParticleName();
//  stepcount = c.StepCount();
//  track_no++;
//  geo->AddTrack( track_no, n->GetPDGCode() );
//  TGeoTrack* e_track = track_list->At(track_no-1);
//  for ( step = 0; step < stepcount; step++ ) {
//    n = c.GoStep(step);
//  //e_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
//    e_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
//  }
//  e_track->SetName(parname);
//  e_track->SetLineColor(kRed);
//  e_track->SetLineWidth(3);
//  e_track->SetLineStyle(0);
//
//  // for IBD, now process neutron
//
//  if ( ibd_TF == kTRUE ) {
//
//    // back to top-level MC event
//    c.GoParent();
//
//    // neutron
//    n = c.GoChild(1);
//    parname = n->GetParticleName();
//    stepcount = c.StepCount();
//    track_no++;
//    geo->AddTrack( track_no, n->GetPDGCode() );
//    TGeoTrack* n_track = track_list->At(track_no-1);
//    for ( step = 0; step < stepcount; step++ ) {
//      n = c.GoStep(step);
//  //  n_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
//      n_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
//    }
//    n_track->SetName(parname);
//    n_track->SetLineColor(kBlue);
//    n_track->SetLineWidth(3);
//    n_track->SetLineStyle(0);
//
//    // capture products
//    Int_t cap_prod_count = c.ChildCount();
//    Int_t cap_prod_no;
//    for ( cap_prod_no=0; cap_prod_no<cap_prod_count; cap_prod_no++ ) {
//      n = c.GoChild(cap_prod_no);
//      parname = n->GetParticleName();
//      stepcount = c.StepCount();
//      track_no++;
//      geo->AddTrack( track_no, n->GetPDGCode() );
//      TGeoTrack* cap_prod_track = track_list->At(track_no-1);
//      for ( step = 0; step < stepcount; step++ ) {
//	n = c.GoStep(step);
//       //ap_prod_track->AddPoint( n->GetEndpoint().x()/10., n->GetEndpoint().y()/10., n->GetEndpoint().z()/10., n->GetGlobalTime() ); //cm
//	cap_prod_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
//      }
//      cap_prod_track->SetName(parname);
//      cap_prod_track->SetLineColor(5+cap_prod_no);
//      cap_prod_track->SetLineWidth(3);
//      cap_prod_track->SetLineStyle(0);
//      c.GoParent();
//    } //end for
//
//  } //end if -- ibd_TF
//
//  // draw tracks and print summary
//  geo->DrawTracks();
//  Printf( "\nTrack Summary for Event %i:\n", event);
//  track_list->Print();
//
//  // create legend if needed 
//  Int_t k;
//  TList* can_list = can->GetListOfPrimitives();
//  TLegend* tleg = can_list->FindObject("Track Legend");
//  if ( tleg != 0x0 )  { tleg->Delete(); }
//  TLegend* tleg = new TLegend(0.85, 0.01, 0.99, 0.30);
//  tleg->SetName("Track Legend");
//  tleg->AddEntry(e_track, e_track->GetName());
//  if ( ibd_TF == kTRUE )  { tleg->AddEntry(n_track, n_track->GetName()); }
//  Int_t total_tracks = track_list->GetEntries();
//  if ( total_tracks > 2 ) {
//    for ( k=2; k<total_tracks; k++ ) {
//      TGeoTrack* cap_track = (TGeoTrack*)track_list->At(k);
//      tleg->AddEntry(cap_track, cap_track->GetName());
//    }
//  }
//  tleg->Draw();
//
//  // update event label
//  TPaveText* label = can_list->FindObject("Event Label");
//  if ( label == 0x0 ) {
//    TPaveText* label = new TPaveText(-0.2, 0.8, 0.2, 0.9);
//    label->SetName("Event Label");
//  } else {
//    label->Clear();
//  }
//  TString evname = "Event: ";
//  evname += event;
//  label->AddText(evname);
//  label->Draw();
//
//  // highlight cells if desired
//  if ( highlight_TF == kTRUE ) { highlightCells(); }
//
//  // return event number for possible additional use
//  return event;
//  cout << endl;
//} // end function drawTracks()
//
//
//// drawNextEvent
//void drawNextEvent() {
//  // retrieve canvas and event label/number
//  TCanvas* c = gPad->GetCanvas();
//  TPaveText* lab = c->GetListOfPrimitives()->FindObject("Event Label");
//  if ( lab == 0x0 )  {
//    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
//    return;
//  }
//  TString evname = lab->GetLine(0)->GetTitle();
//  TRegexp tr = "[0-9]";
//  evname.Remove( 0, evname.Index(tr) );
//  Int_t ev = evname.Atoi();
//  // retrieve ibd_TF
//  Bool_t ibd_TF;
//  TLegend* tl = c->GetListOfPrimitives()->FindObject("Track Legend");
//  Int_t num_tracks = tl->GetListOfPrimitives()->LastIndex() + 1;
//  if ( num_tracks < 2  ) {
//    ibd_TF = kFALSE;
//  } else if ( num_tracks == 2 ) {
//    ibd_TF = kTRUE;
//  } else {
//    ibd_TF = kTRUE;
//    cout << "WARNING: Only the first two top-level tracks will be drawn." << endl;
//  }
//  // increment event and draw
//  ev++;
//  drawTracks(ev, ibd_TF);
//}
//
//
//// drawPrevEvent -- see github.com/duvall3-->RAT-PAC-->collab-->user-->root_macros-->drawTracks.cxx
//void drawPrevEvent() {
//  // retrieve canvas and event label/number
//  TCanvas* c = gPad->GetCanvas();
//  TPaveText* lab = c->GetListOfPrimitives()->FindObject("Event Label");
//  if ( lab == 0x0 )  {
//    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
//    return;
//  }
//  TString evname = lab->GetLine(0)->GetTitle();
//  TRegexp tr = "[0-9]";
//  evname.Remove( 0, evname.Index(tr) );
//  Int_t ev = evname.Atoi();
//  // retrieve ibd_TF
//  Bool_t ibd_TF;
//  TLegend* tl = c->GetListOfPrimitives()->FindObject("Track Legend");
//  Int_t num_tracks = tl->GetListOfPrimitives()->LastIndex() + 1;
//  if ( num_tracks < 2  ) {
//    ibd_TF = kFALSE;
//  } else if ( num_tracks == 2 ) {
//    ibd_TF = kTRUE;
//  } else {
//    ibd_TF = kTRUE;
//    cout << "WARNING: Only the first two top-level tracks will be drawn." << endl;
//  }
//  // increment event and draw
//  ev--;
//  drawTracks(ev);
//}
//
//
//
//// highlightCells -- highlight IBD-relevant target cells in RATPACEventViewer
//void highlightCells() {
//
//  // init
//  TString filename = gDirectory->GetFile()->GetName();
//
//  // retrieve canvas and event label/number
//  TCanvas* can = gPad->GetCanvas();
//  TPaveText* lab = can->GetListOfPrimitives()->FindObject("Event Label");
//  if ( lab == 0x0 )  {
//    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
//    return;
//  }
//  TString evname = lab->GetLine(0)->GetTitle();
//  TRegexp tr = "[0-9]";
//  evname.Remove( 0, evname.Index(tr) );
//  Int_t event = evname.Atoi();
//
//  // retrieve items from gGeoManager
//  TCanvas* can = gPad->GetCanvas();
//  TObjArray* vol_list = gGeoManager->GetListOfVolumes();
//  //TGeoVolume* top = vol_list->FindObject("Top");
//
//  // find current highlights, if any
//  TRegexp tcr = "target";
//  TObjArray* vol_colors = new TObjArray;
//  TIter vi = vol_list->begin();
//  for (( vi = vol_list->begin(); vi != vol_list->end(); ++vi )) {
//    TGeoVolume* vol_vi = (TGeoVolume*)*vi;
//    TString vol_vi_name = vol_vi->GetName();
//    if ( vol_vi_name.Contains(tcr) && vol_vi->GetLineColor() != kBlack ) {
//      vol_colors->Add(vol_vi);
//    }
//  }
//
//  // clear current highlights, if any
//  if ( vol_colors != 0x0 ) {
//  //cout << "vol_colors est'" << endl; //debug
//    TIter vci = vol_colors->begin();
//    for ( vci = vol_colors->begin(); vci != vol_colors->end(); ++vci ) {
//      TGeoVolume* vol_vci = (TGeoVolume*)*vci;
//      vol_vci->SetLineColor(kBlack);
//      vol_vci->SetLineWidth(1);
//    }
//  }
//  can->Draw();
//
//  // RAT-PAC track(s)
//  RAT::DSReader r(filename.Data());
//  RAT::DS::Root* ds = r.GetEvent(event);
//  RAT::TrackNav nav(ds);
//  RAT::TrackCursor c = nav.Cursor(false);
//  RAT::TrackNode* n = c.GoChild(0);
//  c.GoParent();
//
//  // highlight generation volume
//  TString vol_gen_name = n->GetVolume();
//  TGeoVolume* vol_gen = (TGeoVolume*)vol_list->FindObject(vol_gen_name.Data());
//  vol_colors->Add(vol_gen);
//  vol_gen->SetLineColor(kGreen);
//  vol_gen->SetLineWidth(5);
//  can->Draw();
//
//  // highlight termination volume (if target cell)
//  TString pcl_name;
//  enum EColor cell_color;
//  // loop over tracks
//  Int_t child;
//  for (( child=0; child<=1; child++ )) {
//    n = c.GoChild(child);
//    pcl_name = n->GetParticleName();
//  //cout << child << "\t" << pcl_name.Data() << endl; //debug
//    n = c.GoTrackEnd();
//    TString vol_term_name = n->GetVolume();
//    // check if target volume
//    if ( vol_term_name.Contains("target") ) {
//      TGeoVolume* vol_term = (TGeoVolume*)vol_list->FindObject(vol_term_name.Data());
//      vol_colors->Add(vol_term);
//      // check particle type
//      if (pcl_name.Contains("e+")) {
//	cell_color = kRed;
//      } else if (pcl_name.Contains("neutron")) {
//	cell_color = kBlue;
//      } else {
//	cell_color = kMagenta;
//      } // end if -- particle type
//      vol_term->SetLineColor(cell_color);
//      vol_term->SetLineWidth(5);
//      can->Draw();
//    } // end if -- target volume
//    c.GoParent();
//  } // end for -- track loop
//
//}
//
//
//// all pau!   )
