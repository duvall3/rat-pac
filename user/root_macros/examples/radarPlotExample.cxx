// radarPlotExample -- simple macro demonstrating an only slightly-hacked method
//   for creating an angular 1-D histogram ("radar plot") in ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2021 ~ //

TH2D* radarPlotExample() {

// init
Int_t k(0), N(1000);
TH2D *h_radar = new TH2D("h_radar", "Example Angular Histogram (degrees)", 36, -180., 180., 1, 0., 1.01);

// fill
for ( k=0; k<N; k++ ) {
  h_radar->Fill( gRandom->Gaus(0.,45.), 1. );
}

// draw
TCanvas *can_radar = new TCanvas("can_radar", "can_radar");
h_radar->Draw("cyllego");

// to adjust view
printf("\nTo set the view, run the following lines:\n\n");
printf("TView *view = gPad->GetView();\n");
printf("view->Top();\n\n");

// all pau!   )
return h_radar;
}
