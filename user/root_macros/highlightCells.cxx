// highlightCells -- highlight IBD-relevant target cells in RATPACEventViewer
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2020 ~ //

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
TGeoVolume* top = vol_list->FindObject("Top");

// find current highlights, if any
TObjArray* vol_colors = new TObjArray;
TIter vi = vol_list->begin();
for (( vi = vol_list->begin(); vi != vol_list->end(); ++vi )) {
  TGeoVolume* vol_vi = (TGeoVolume*)*vi;
  TString vol_vi_name = vol_vi->GetName();
  if ( vol_vi_name.Contains("target") && vol_vi->GetLineColor() != kBlack ) {
    vol_colors->Add(vol_vi);
  }
}

// clear current highlights, if any
if ( vol_colors != 0x0 ) {
//cout << "vol_colors est'" << endl; //debug
  TIter vci = vol_colors->begin();
  for (( vci = vol_colors->begin(); vci != vol_colors->end(); ++vci )) {
    TGeoVolume* vol_vci = (TGeoVolume*)*vci;
    vol_vci->SetLineColor(kBlack);
    vol_vci->SetLineWidth(1);
    can->Draw();
  }
}

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

// all pau!   )
}
