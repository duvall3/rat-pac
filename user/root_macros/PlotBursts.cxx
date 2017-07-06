// PlotBursts -- plot results from Mar{c,k}'s SimpleEnergyDAQ triggers
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2017 ~ //

void PlotBursts( const char* filename ) {

TTree *T = new TTree("T", "burst-trigger data");

T->ReadFile( filename, "Ti/F:Tf:En" );

T->Draw("En");
c1->SetLogy(1);
htemp->SetTitle(filename);
htemp->SetLineColor(kBlue);
htemp->SetLineWidth(2.);
htemp->SetXTitle("Quenched Scintillation Energy (MeV)");
htemp->SetYTitle("Entries");
htemp->Draw();

// all pau!   )
}
