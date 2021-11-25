// plotG4NeutronXS -- plot neutron cross-sections from $G4NEUTRONXS data
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 7/2021 ~ //


//void plotG4NeutronXS( Int_t Z, const enum EColor = kBlue ) {
void plotG4NeutronXS( Int_t Z ) {


// filesystem setup
TString g4xs_absolute = gSystem->Getenv("G4NEUTRONXSDATA");
TString g4xs_file = g4xs_absolute( g4xs_absolute.Last('/')+1, g4xs_absolute.Length()-1 );
if (g4xs_absolute == "") {
  gSystem->Error("Getenv", "Error: Environment variable $G4NEUTRONXSDATA not found. Were environment scripts sourced?\n");
  return;
}
TString elastFile, inelastFile, capFile;
elastFile = TString::Format("%s/elast%d", g4xs_absolute.Data(), Z);
inelastFile = TString::Format("%s/inelast%d", g4xs_absolute.Data(), Z);
capFile = TString::Format("%s/cap%d", g4xs_absolute.Data(), Z);

//debug
//printf("%s %s %s %s %s\n", g4xs_absolute.Data(), g4xs_file.Data(), elastFile.Data(), inelastFile.Data(), capFile.Data());
//TString shellcmd = TString::Format("ls -l %s", elastFile.Data());
//gSystem->Exec(shellcmd.Data());

// read data into TTrees
TTree* T_e = new TTree( "T_e", "Elastic Scattering Data" );
TTree* T_i = new TTree( "T_i", "Inelastic Scattering Data" );
TTree* T_c = new TTree( "T_c", "Capture Data" );
T_e->ReadFile( elastFile.Data(), "energy/D:xs/D");
T_i->ReadFile( inelastFile.Data(), "energy/D:xs/D");
T_c->ReadFile( capFile.Data(), "energy/D:xs/D");

// prepare axes
TString enLabel = "Energy (keV)";
TString xsLabel = "Cross-Section (cm^{2})";
Double_t en_low, en_high, en_therm, en_reactor_low, en_reactor_high, xs_low, xs_high;
en_low = 1.e-6; en_high = 1.e2;
en_therm = (1/40)*1e-3;
en_reactor_low = 1.e-6; en_reactor_high = 1.e-5;
xs_low = 1.e-30; xs_high = 1.e-18;


// MAIN
TCanvas* c = new TCanvas("c", g4xs_file.Data());
//TH2D* he = new TH2D;
//TH2D* hi = new TH2D;
//TH2D* hc = new TH2D;
T_e->Draw("xs:energy>>he", "xs<1");
//he->GetXaxis()->SetLimits(en_low, en_high);
//he->GetYaxis()->SetLimits(xs_low, xs_high);
//he->SetMarkerStyle(2);
//he->Draw();
//T_i->Draw("xs:energy>>hi", "xs<1", "csame");
//T_c->Draw("xs:energy>>hc", "xs<1", "csame");
c->SetLogx(true);
c->SetLogy(true);




// all pau!   )
}
