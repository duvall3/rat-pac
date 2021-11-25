// rpevFunctions -- functions needed for github.com/duvall3/rat-pac/tree/collab/user/root_macros/RATPACEventViewer.cxx
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/21 ~ //


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


// define function to draw e+ and n0 tracks for a given top-level MC event
int drawTracks( Int_t event = 0, Bool_t highlight_TF = kTRUE ) {

  // init
  Bool_t kIBD = kFALSE;
  TTree* tree = (TTree*)gDirectory->FindObjectAny("T");
  Int_t last_event = tree->GetEntries()-1;
  if ( event < 0 || event > last_event ) {
    cerr << "Error: No such event (requested event: " << event << "). Final event: " << last_event << "." << endl;
    return -1;
  }
  Int_t step, stepcount;
  TString filename = gDirectory->GetFile()->GetName();
  TString parname;
  RAT::DSReader r(filename);
  RAT::DS::Root *ds = r.GetEvent(event);
  RAT::TrackNav nav(ds);
  RAT::TrackCursor c = nav.Cursor(kFALSE);
  RAT::TrackNode *n;
  RAT::DS::MC *mc = ds->GetMC();
  Int_t mcCount = mc->GetMCParticleCount();
  TGeoManager* geo = gGeoManager;
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

  // if IBD and if requested, highlight cells
  if ( mc->GetMCParticleCount() == 2 ) {
    Bool_t t0positron = ( mc->GetMCParticle(0)->GetParticleName() == "e+" );
    Bool_t t1neutron = ( mc->GetMCParticle(1)->GetParticleName() == "neutron" );
    if (t0positron && t1neutron && highlight_TF) highlightCells();
  } // end if

  // return event number for possible additional use
  return event;
  cout << endl;
} // end function drawTracks()


// drawNextEvent
void drawNextEvent() {
  // retrieve canvas and event label/number
  TCanvas* c = gPad->GetCanvas();
  TPaveText* lab = c->GetListOfPrimitives()->FindObject("Event Label");
  if ( lab == 0x0 )  {
    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
    return;
  }
  TString evname = lab->GetLine(0)->GetTitle();
  TRegexp tr = "[0-9]";
  evname.Remove( 0, evname.Index(tr) );
  Int_t ev = evname.Atoi();
//// retrieve ibd_TF
//Bool_t ibd_TF;
//TLegend* tl = c->GetListOfPrimitives()->FindObject("Track Legend");
//Int_t num_tracks = tl->GetListOfPrimitives()->LastIndex() + 1;
//if ( num_tracks < 2  ) {
//  ibd_TF = kFALSE;
//} else if ( num_tracks == 2 ) {
//  ibd_TF = kTRUE;
//} else {
//  ibd_TF = kTRUE;
//  cout << "WARNING: Only the first two top-level tracks will be drawn." << endl;
//}
  // increment event and draw
  ev++;
//drawTracks(ev, ibd_TF);
  drawTracks(ev);
}


// drawPrevEvent -- see github.com/duvall3-->RAT-PAC-->collab-->user-->root_macros-->drawTracks.cxx
void drawPrevEvent() {
  // retrieve canvas and event label/number
  TCanvas* c = gPad->GetCanvas();
  TPaveText* lab = c->GetListOfPrimitives()->FindObject("Event Label");
  if ( lab == 0x0 )  {
    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
    return;
  }
  TString evname = lab->GetLine(0)->GetTitle();
  TRegexp tr = "[0-9]";
  evname.Remove( 0, evname.Index(tr) );
  Int_t ev = evname.Atoi();
//// retrieve ibd_TF
//Bool_t ibd_TF;
//TLegend* tl = c->GetListOfPrimitives()->FindObject("Track Legend");
//Int_t num_tracks = tl->GetListOfPrimitives()->LastIndex() + 1;
//if ( num_tracks < 2  ) {
//  ibd_TF = kFALSE;
//} else if ( num_tracks == 2 ) {
//  ibd_TF = kTRUE;
//} else {
//  ibd_TF = kTRUE;
//  cout << "WARNING: Only the first two top-level tracks will be drawn." << endl;
//}
  // increment event and draw
  ev--;
  drawTracks(ev);
}


// highlightCells -- highlight IBD-relevant target cells in RATPACEventViewer
void highlightCells() {

  // init
  TString filename = gDirectory->GetFile()->GetName();

  // retrieve canvas and event label/number
  TCanvas* can = gPad->GetCanvas();
  TPaveText* lab = can->GetListOfPrimitives()->FindObject("Event Label");
  if ( lab == 0x0 )  {
    cerr << "Error: No event drawn yet; use drawTracks(<EVENT>, [IBD_TF])." << endl;
    return;
  }
  TString evname = lab->GetLine(0)->GetTitle();
  TRegexp tr = "[0-9]";
  evname.Remove( 0, evname.Index(tr) );
  Int_t event = evname.Atoi();

  // retrieve items from gGeoManager
  TCanvas* can = gPad->GetCanvas();
  TObjArray* vol_list = gGeoManager->GetListOfVolumes();
  //TGeoVolume* top = vol_list->FindObject("Top");

  // find current highlights, if any
  TRegexp tcr = "target";
  TObjArray* vol_colors = new TObjArray;
  TIter vi = vol_list->begin();
  for (( vi = vol_list->begin(); vi != vol_list->end(); ++vi )) {
    TGeoVolume* vol_vi = (TGeoVolume*)*vi;
    TString vol_vi_name = vol_vi->GetName();
    if ( vol_vi_name.Contains(tcr) && vol_vi->GetLineColor() != kBlack ) {
      vol_colors->Add(vol_vi);
    }
  }

  // clear current highlights, if any
  if ( vol_colors != 0x0 ) {
  //cout << "vol_colors est'" << endl; //debug
    TIter vci = vol_colors->begin();
    for ( vci = vol_colors->begin(); vci != vol_colors->end(); ++vci ) {
      TGeoVolume* vol_vci = (TGeoVolume*)*vci;
      vol_vci->SetLineColor(kBlack);
      vol_vci->SetLineWidth(1);
    }
  }
  can->Draw();

  // RAT-PAC track(s)
  RAT::DSReader r(filename.Data());
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

}


// toggleInertVis -- toggle whether inert cells are drawn in the viewer
// -- user must provide the number of checkerboarding dimensions:
//      kDims=2 or kDims=3
void toggleInertVis( const Int_t kDims = 3 ) {

// init
TGeoManager *geo = gGeoManager;
TObjArray *vols = geo->GetListOfVolumes();
TRegexp tcr = "target_cell_.*_.*";
TIter i(vols);
TGeoVolume *v;
TString vName;
TObjArray *vNameTOA;
TObjString *vTOS;
Int_t R, C, L;
Bool_t chkTest(kFALSE);

// MAIN
for ( i=vols->begin(); i!=vols->end(); ++i ) {
  v = (TGeoVolume*)*i;
  vName = v->GetName();
  if (vName.Contains(tcr)) {
    // extract row, column, and layer
    vNameTOA = vName.Tokenize('_');
    vTOS = (TObjString*)vNameTOA->At(2);
    R = vTOS->GetString().Atoi();
    vTOS = (TObjString*)vNameTOA->At(3);
    C = vTOS->GetString().Atoi();
    vTOS = (TObjString*)vNameTOA->At(4);
    L = vTOS->GetString().Atoi();
    // perform checkerboarding test
    if (kDims==2) {
      chkTest = ( R%2 == C%2 );
    } else if (kDims==3) {
      chkTest = ( (R%2==C%2) && (C%2==L%2) );
    } else {
      geo->Error("toggleInertVis.cxx", "Invalid checkerboarding dimension");
//    return;
    } // end if -- kDims
    // switch visibility for *inert* cells
    if (! chkTest) v->SetVisibility( ! v->IsVisible() );
  } // end if -- target-cell regex
} // end volume-list loop

geo->Draw();

} // end function


// all pau!   )
