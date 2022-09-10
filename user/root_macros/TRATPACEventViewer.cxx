// TRATPACEventViewer -- class for viewing RAT-PAC detector geometries
//   and particle tracks in ROOT
// -- Note: For CINT, load using gROOT->LoadMacro("TRATPACEventViewer.cxx");
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

//Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
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

// #include <TRATPACEventViewer.h>
#include "TRATPACEventViewer.h"

// Call the ClassImp() macro to give the TRATPACEventViewer class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TRATPACEventViewer);
#endif

//______________________________________________________________________________
// default ctor
TRATPACEventViewer::TRATPACEventViewer()
{
  SetName("RATPACEventViewer");
  SetTitle("Class for visualizing detector geometries events");
  fVolumePattern = ".*";
  /* fTopChildID = 1; */
  fkHighlight = kTRUE;
}

//______________________________________________________________________________
// normal ctor
TRATPACEventViewer::TRATPACEventViewer( const char* fileName, const char* volumePattern )
{
  SetName("RATPACEventViewer");
  SetTitle("Class for visualizing detector geometries events");
  fFileName = fileName;
  fDataFile = TFile::Open(fFileName.Data());
  fDataFile->cd();
  /* RAT::DSReader r(fFileName.Data()); */
  /* fDSReader = r; */
  fTree = (TTree*)gDirectory->Get("T");
  fTotalEvents = T->GetEntries();
  fVolumePattern = volumePattern;
  /* fTopChildID = 1; */
  fkHighlight = kTRUE;
  Init();
}

/* //______________________________________________________________________________ */
/* // Init */
/* void TRATPACEventViewer::Init() */
/* { */
/*   printf("Initializing RAT-PAC Event Viewer...\n"); */
/*   return; */
/* } */

//______________________________________________________________________________
// Init
void TRATPACEventViewer::Init( const char* fileName, const char* volumePattern )
{
  fFileName = fileName;
  fDataFile->cd();
  /* RAT::DSReader r(fFileName.Data()); */
  /* fDSReader = r; */
  fTree = (TTree*)gDirectory->Get("T");
  fTotalEvents = T->GetEntries();
  fDataFile = TFile::Open(fFileName.Data());
  fVolumePattern = volumePattern;
  /* Init(); */
  return;
}

//______________________________________________________________________________
 //DrawGeometry
TRATPACEventViewer::DrawGeometry()
{

  // switch default rendering engine to OpenGL
  gStyle->SetCanvasPreferGL(kTRUE);

  // general init
  TString filename = fFileName;
  TRegexp tcregex = fVolumePattern;
  TFile* f = GetDataFile();
  // TRATGeo
  TRATGeo* g = new TRATGeo;
  g->Build(fVolumePattern);
  TRATGeo *G = &g;
  TMap* db = g->GetDB();
  // file and datarun details
  TString experiment = g->GetExperiment();
  TString experiment_path = g->GetExperimentPath();
  RAT::DSReader r(filename);
  // TGeo system
  gSystem->Load("libGeom");
  TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
  fGeoManager = geo;
  TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
  TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
  TGeoMedium *ej254_005li6 = new TGeoMedium("vacuum", 1, mat);
  TGeoMedium *glass = new TGeoMedium("vacuum", 1, mat);
  TRegexp waterregex("water");

  // create TGeoVolumes from TRATVolumes
  TList *rvols = g->GetListOfVolumes();
  TIter i(rvols);
  TRATVolume *rvol;
  TString volumeName, volumeMother, volumeType;
  Double_t volumeRMin, volumeRMax, volumeSizeZ;
  TVector3 *volumeSize, *volumePosition;
  for ( i=rvols->begin(); i!=rvols->end(); ++i ) {
    rvol = (TRATVolume*)*i;
    volumeName = rvol->GetVolName();
    volumeMother = rvol->GetMother();
    volumeType = rvol->GetVolumeType();
    volumeSize = rvol->GetSize();
    volumeRMin = rvol->GetRMin();
    volumeRMax = rvol->GetRMax();
    volumeSizeZ = rvol->GetSizeZ();
    volumePosition = rvol->GetRelativePosition();
    // create volume
    if (volumeType == "box") {
      TGeoVolume* volume = geo->MakeBox(volumeName.Data(), med, volumeSize->X(), volumeSize->Y(), volumeSize->Z());
    } else if (volumeType == "tube") {
      TGeoVolume* volume = geo->MakeTube(volumeName.Data(), med, 0., 12.7, 5000.); //debug
    } else {
      continue;
    }
    if ( volumeName == "world" ) { // top volume //HC//
      if ( ! volume->IsTopVolume() ) {
      geo->SetTopVolume(volume);
      }
    } else { // all other volumes
      volume->SetLineWidth(1);
      volume->SetLineColor(kBlack);
      /* volume->SetLineColorAlpha(kGray, 0.3); */
    } // endif -- world (top)
  } // end volume loop

  // now incorporate mother(s) and create nodes
  TObjArray* vols = geo->GetListOfVolumes();
  TGeoVolume* world = (TGeoVolume*)vols->FindObject("world");
  geo->SetTopVolume(world);
  TGeoVolume* mother = new TGeoVolume; // mother volume

  // loop over creted TGeoVolumes
  TGeoVolume *vol, *volMother;
  TString volname, volMotherName, warnLoc, warnMsg;
  TGeoTranslation *trans;
  TIter iv = vols->begin();
  for ( iv = vols->begin(); iv != vols->end(); ++iv ) {

    // get volume
    vol = (TGeoVolume*)*iv;
    volname = vol->GetName();
    rvol = (TRATVolume*)g->GetVolume(volname.Data());
    volPosition = rvol->GetRelativePosition();

    // volume checks
    if ( (vol->IsTopVolume()) || (volname=="world") ) continue; // skip world (already positioned when made top volume)

    // create translation
    trans = new TGeoTranslation( volPosition->X(), volPosition->Y(), volPosition->Z() );

    // find mother and add node
    volMotherName = rvol->GetMother();
    volMother = (TGeoVolume*)vols->FindObject(volMotherName.Data());
    if ( volMother == 0 ) {
      warnLoc.Form("RATPACEventViewer");
      warnMsg.Form("volMother \"%s\" of volume \"%s\" not found in list at 0x%x.", volMotherName.Data(), volname.Data(); vols);
      g->Warning(warnLoc.Data(), warnMsg.Data());
    } else {
      if (volname.Contains(tcregex)) {
	/* printf("Adding target volume \"%s\", copy no. %d, at (%f, %f, %f)\n", volname.Data(), k_volume, volPosition->X(), volPosition->Y(), volPosition->Z()); //debug */
	volMother->AddNode(vol, 0, trans);
      } else if (volname.Contains(waterregex)) {
	/* printf("Adding water volume \"%s\", copy no. %d, at (%f, %f, %f)\n", volname.Data(), k_volume, volPosition->X(), volPosition->Y(), volPosition->Z()); //debug */
	volMother->AddNode(vol, 0, trans);
      } else {
	/* printf("Adding other volume \"%s\", copy no. %d, at (%f, %f, %f)\n", volname.Data(), k_volume, volPosition->X(), volPosition->Y(), volPosition->Z()); //debug */
	volMother->AddNode(vol, 0, trans);
      } // end volume-type check
    } // end volMother check

  } // end mother/node db loop

  printf("\n");

  // finish and prepare to draw
  geo->CloseGeometry();
  world->SetLineColor(kGray);
  world->SetLineWidth(1);
  //geo->SetTopVisible(kFALSE);
  geo->SetTopVisible(kTRUE);
  TString can_title = experiment+", \""+filename+"\"";
  TCanvas *c_rpev = new TCanvas("c_rpev", can_title, 1000, 100, 850, 700);
  fCanvas = c_rpev;

  // draw desired volumes
  //for ( iv = vols->begin(); iv != vols->end(); ++iv ) {
  //  vol = (TGeoVolume*)*iv;
  //  volname = vol->GetName();
  //  if (volname.Contains(tcregex)) vol->Draw("SAME");
  //}
  //vol->Draw();

  // draw
  geo->SetVisOption(1);
  geo->SetVisLevel(); // default 3
  world->Draw();

  // annotations
  TLegend *gleg = new TLegend(0.01, 0.01, 0.25, 0.15);
  gleg->SetName("Geometry Legend");
  gleg->AddEntry(volume, "Detector Volume(s)", "lf");
  //gleg->AddEntry(target_cell, "Target Cells", "lf");
  gleg->AddEntry(world, "World", "lf");
  gleg->Draw();

  // special volumes
  TGeoVolume *wat = geo->GetVolume("water_shield");
  if ( wat != 0 ) {
    wat->SetLineColor(kBlue);
    gleg->AddEntry(wat, "Water Shield", "lf");
    wat->Draw("same");
  }
  TGeoVolume *cave = geo->GetVolume("cave");
  if ( cave != 0 ) {
    cave->SetLineColor(kOrange+2);
    gleg->AddEntry(cave, "Cave Walls", "lf");
    cave->Draw("same");
  }

  // all pau!   )
  fRATGeo = g;
  return;

}

//______________________________________________________________________________
// DrawTracks
void TRATPACEventViewer::DrawTracks( Long64_t event )
{

  // event check
  if ( event < 0 ) {
    this->Info("TRATPACEventViewer::DrawTracks", "Event ID numbers must be nonnegative.");
    return;
  } else if ( event > (fTotalEvents-1) ) {
    this->Info("TRATPACEventViewer::DrawTracks", "Requested event exceeds total.");
    return;
  }

  // init
  SetCurrentEvent(event);
  Int_t step, stepcount;
  TString filename = fFileName, parname;
  /* RAT::DSReader r = GetDSReader(); */
  RAT::DSReader r(filename);
  RAT::DS::Root *ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(kFALSE);
  RAT::TrackNode *n;
  RAT::DS::MC *mc = ds->GetMC();
  Int_t mcCount = mc->GetMCParticleCount();
  TGeoManager *geo = fGeoManager;
  geo->ClearTracks();
  TObjArray* track_list = geo->GetListOfTracks();
  Int_t track_no;

  // MCParticle loop
  Int_t mcp;
  for ( mcp=0; mcp<mcCount; mcp++ ) {

    n = c.GoChild(mcp);
    parname = n->GetParticleName();
    stepcount = c.StepCount();
    track_no++;
    geo->AddTrack( track_no, n->GetPDGCode() );
    TGeoTrack* mcp_track = track_list->At(track_no-1);
    for ( step = 0; step < stepcount; step++ ) {
      n = c.GoStep(step);
      mcp_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
    }
    mcp_track->SetName(parname);
//  mcp_track->SetLineColor(kRed);
    mcp_track->SetLineWidth(3);
    mcp_track->SetLineStyle(0);
    if (parname == "neutron") {
      mcp_track->SetLineColor(kBlue);
    } else {
      mcp_track->SetLineColor(kRed);
    }

    // capture products
    if (parname == "neutron") {
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
	  cap_prod_track->AddPoint( n->GetEndpoint().x(), n->GetEndpoint().y(), n->GetEndpoint().z(), n->GetGlobalTime() );
	}
	cap_prod_track->SetName(parname);
	cap_prod_track->SetLineColor(5+cap_prod_no);
	cap_prod_track->SetLineWidth(3);
	cap_prod_track->SetLineStyle(0);
	c.GoParent();
      } //end for
    } // end if -- neutron

    // draw
    geo->DrawTracks();

    // back to top-level MC event
    c.GoParent();

  } // MCParticle loop

  // draw tracks and print summary
  Printf( "\nTrack Summary for Event %i:\n", event);
  track_list->Print();

  // create legend if needed 
  Int_t k;
  TCanvas *can = GetCanvas();
  TList* can_list = can->GetListOfPrimitives();
  TLegend* tleg = can_list->FindObject("Track Legend");
  if ( tleg != 0x0 )  { tleg->Delete(); }
  TLegend* tleg = new TLegend(0.85, 0.01, 0.99, 0.30);
  tleg->SetName("Track Legend");
  TGeoTrack *leg_track;
  track_list = geo->GetListOfTracks();
  TIter iT(track_list);
  for ( iT=track_list->begin(); iT!=track_list->end(); ++iT ) {
    leg_track = (TGeoTrack*)*iT;
    tleg->AddEntry(leg_track, leg_track->GetName(), "lp");
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

  /* // if IBD and if requested, highlight cells */
  /* if ( mc->GetMCParticleCount() == 2 ) { */
  /*   Bool_t t0positron = ( mc->GetMCParticle(0)->GetParticleName() == "e+" ); */
  /*   Bool_t t1neutron = ( mc->GetMCParticle(1)->GetParticleName() == "neutron" ); */
  /*   if (t0positron && t1neutron && highlight_TF) highlightCells(); */
  /* } // end if */

  // apply (or remove) cell highlighting
  HighlightCells();

/*   // if IBD, add markers for the 3 important vertices */
/*   if ( mc->GetMCParticleCount() == 2 ) { */
/*     Bool_t t0positron = ( mc->GetMCParticle(0)->GetParticleName() == "e+" ); */
/*     Bool_t t1neutron = ( mc->GetMCParticle(1)->GetParticleName() == "neutron" ); */
/*     if (t0positron && t1neutron && fkHighlight) { // then is (almost certainly) IBD event */
/*       printf("\n IBD Event = true\n\n"); //debug */
/*       // IBD vertex */
/*       mcp_track = (TGeoTrack*)track_list->At(0); */
/*       Double_t *rIBD = mcp_track->GetPoint(0); */
/*       // e+ annihilation vertex */
/*       Double_t *rPositron = mcp_track->GetPoint( mcp_track->GetNpoints()-1 ); */
/*       // neutron capture vertex */
/*       mcp_track = (TGeoTrack*)track_list->At(1); */
/*       Double_t *rNeutron = mcp_track->GetPoint( mcp_track->GetNpoints()-1 ); */
/*       // markers */
/*       TPolyMarker3D mIBD(1), mPositron(1), mNeutron(1); */
/*       mIBD.SetPoint(0, rIBD[0], rIBD[1], rIBD[2]); */
/*       mIBD.SetMarkerStyle(kFullCircle); */
/*       mIBD.SetMarkerSize(1.5); */
/*       mIBD.SetMarkerColorAlpha(kMagenta, 0.5); */
/*       mPositron.SetPoint(0, rPositron[0], rPositron[1], rPositron[2]); */
/*       mPositron.SetMarkerStyle(kFullCircle); */
/*       mPositron.SetMarkerSize(1.5); */
/*       mPositron.SetMarkerColorAlpha(kRed, 0.5); */
/*       mNeutron.SetPoint(0, rNeutron[0], rNeutron[1], rNeutron[2]); */
/*       mNeutron.SetMarkerStyle(kFullCircle); */
/*       mNeutron.SetMarkerSize(1.5); */
/*       mNeutron.SetMarkerColorAlpha(kBlue, 0.5); */
/*       mIBD.Draw(); */
/*       mPositron.Draw(); */
/*       mNeutron.Draw(); */
/*       // legend */
/*       tleg->AddEntry(&mIBD, "IBD Vertex"); */
/*       tleg->AddEntry(&mPositron, "e+ Annihilation"); */
/*       tleg->AddEntry(&mNeutron, "n Capture"); */
/*     } // end if */
/*   } // end if */

  // all pau!   )
  return;
}

//______________________________________________________________________________
// DrawNextEvent
void TRATPACEventViewer::DrawNextEvent()
{
  // event check
  Long64_t event = GetCurrentEvent(), lastEvent = GetTotalEvents()-1;
  if ( event == lastEvent ) {
    this->Info("TRATPACEventViewer::DrawNextEvent", "This is the final event.");
    return;
  } else {
    DrawTracks(event+1);
  }
}

//______________________________________________________________________________
// DrawPrevEvent
void TRATPACEventViewer::DrawPrevEvent()
{
  // event check
  Long64_t event = GetCurrentEvent();
  if ( event == 0 ) {
    this->Info("TRATPACEventViewer::DrawPrevEvent", "This is the first event.");
    return;
  } else {
    DrawTracks(event-1);
  }
}

//______________________________________________________________________________
// HighlightCells
void TRATPACEventViewer::HighlightCells()
{

  // init
  Long64_t event = GetCurrentEvent();
  TCanvas *can = GetCanvas();
  TGeoManager *geo = GetGeoManager();
  TObjArray* vol_list = gGeoManager->GetListOfVolumes();

  // find current highlights, if any
  TRegexp tcr = "target";
  TObjArray* vol_colors = new TObjArray;
  TIter vi = vol_list->begin();
  for (( vi = vol_list->begin(); vi != vol_list->end(); ++vi )) {
    TGeoVolume* vol_vi = (TGeoVolume*)*vi;
    TString vol_vi_name = vol_vi->GetName();
    /* if ( vol_vi_name.Contains(tcr) && vol_vi->GetLineColor() != kBlack ) { */
    if ( vol_vi_name.Contains(tcr) ) vol_colors->Add(vol_vi);
  }

  // clear current highlights, if any
  if ( vol_colors != 0x0 ) {
    TIter vci = vol_colors->begin();
    for ( vci = vol_colors->begin(); vci != vol_colors->end(); ++vci ) {
      TGeoVolume* vol_vci = (TGeoVolume*)*vci;
      /* vol_vci->SetLineColor(kBlack); */
      vol_vci->SetLineColorAlpha(kGray, 0.3);
      vol_vci->SetLineWidth(1);
    }
  }
  can->Draw();

  // exit if not applying highlights
  if (!GetHighlightMode()) return;

  // RAT-PAC track(s)
  RAT::DSReader r(fFileName.Data());
  RAT::DS::Root* ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(false);
  RAT::TrackNode* n = c.GoChild(0);
  c.GoParent();

  // highlight generation volume
  TString vol_gen_name = n->GetVolume();
  TGeoVolume* vol_gen = (TGeoVolume*)vol_list->FindObject(vol_gen_name.Data());
  vol_colors->Add(vol_gen);
  vol_gen->SetLineColor(kGreen);
  vol_gen->SetLineWidth(5);
  can->Draw();

  // highlight termination volume (if target cell)
  TString pcl_name;
  enum EColor cell_color;
  // loop over tracks
  Int_t child;
  for (( child=0; child<=1; child++ )) {
    n = c.GoChild(child);
    pcl_name = n->GetParticleName();
  //cout << child << "\t" << pcl_name.Data() << endl; //debug
    n = c.GoTrackEnd();
    TString vol_term_name = n->GetVolume();
    // check if target volume
    if ( vol_term_name.Contains("target") ) {
      TGeoVolume* vol_term = (TGeoVolume*)vol_list->FindObject(vol_term_name.Data());
      vol_colors->Add(vol_term);
      // check particle type
      if (pcl_name.Contains("e+")) {
	cell_color = kRed;
      } else if (pcl_name.Contains("neutron")) {
	cell_color = kBlue;
      } else {
	cell_color = kMagenta;
      } // end if -- particle type
      vol_term->SetLineColor(cell_color);
      vol_term->SetLineWidth(5);
      can->Draw();
    } // end if -- target volume
    c.GoParent();
  } // end for -- track loop

  // all pau!   )
  return;
}

////______________________________________________________________________________
//TRATPACEventViewer::
//{
//}

////______________________________________________________________________________
//TRATPACEventViewer::
//{
//}

//______________________________________________________________________________
// Zoom -- simple shortcut for adjusting zoom when running interactively
void TRATPACEventViewer::Zoom( Double_t zoomFactor )
{
  if (gPad==0x0) {
    gROOT->Error("TRATPACEventViewer::Zoom", "gPad not found.");
    return;
  }
  TView3D *view = gPad->GetView();
  if (view==0x0) {
    gPad->Error("TRATPACEventViewer::Zoom", "TView not found.");
    return;
  }
  view->ZoomView(gPad, zoomFactor);
  return;
}

////______________________________________________________________________________
//TRATPACEventViewer::
//{
//}

////______________________________________________________________________________
//TRATPACEventViewer::
//{
//}

////______________________________________________________________________________
//// override ls
//void TRATPACEventViewer::ls()
//{
//}

////______________________________________________________________________________
//// override Print
//void TRATPACEventViewer::Print()
//{
//}


