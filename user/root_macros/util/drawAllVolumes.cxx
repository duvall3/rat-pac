// drawAllVolumes -- simple lil` debugging macro to explicitly draw everything in gGeoManager
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 5/21 ~ //

void drawAllVolumes( TGeoManager* geo ) {

// init
//gSystem->Load("libGeom");
TObjArray* vols = geo->GetListOfVolumes();
TGeoVolume* v;
TIter i = vols->begin();

// loop over volumes
for ( i=vols->begin(); i!=vols->end(); ++i ) {
  v = (TGeoVolume*)*i;
  v->Draw("same");
}

// all pau!   )
}
