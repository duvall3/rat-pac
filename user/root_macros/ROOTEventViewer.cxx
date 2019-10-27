// ROOTEventViewer -- for viewing RAT-PAC geometry + particle tracks
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2019 ~ //



void ROOTEventViewer( const char* FileName ) {



//// DETECTOR GEOMETRY


// init

TString filename = FileName;
gSystem->Load("libGeom");
TGeoManager *geo = new TGeoManager(filename+"_GM", "TGeoManager for "+filename);
// placeholder material / medium
TGeoMaterial *mat = new TGeoMaterial("vacuum", 0, 0, 0);
TGeoMedium *med = new TGeoMedium("vacuum", 1, mat);
// top volume
TGeoVolume* top = geo->MakeBox("Top", med, 1.e4, 1.e4, 1.e4); //cm
geo->SetTopVolume(top);


// load detector into TGeoManager
/*
 * PENDING
 */ 

// placeholder box (e.g., cell array)
TGeoVolume* cell_array = geo->MakeBox("CellArray", med, 22.4, 22.4, 40.2); //cm

// finish and draw
geo->CloseGeometry();
top->SetLineColor(kBlack);
geo->SetTopVisible(kTRUE); //debug
TCanvas* can = new TCanvas("can", filename, 1000, 100, 850, 700);
top->Draw();
TView* view = can->GetView();
view->ZoomOut();



//// PARTICLE TRACKS







//// all pau!   )
}
