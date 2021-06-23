// all_neutron_deltax.cxx -- plot neutron x-displacements together
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/2021 ~ //

void all_neutron_deltax() {

// global opts
gStyle->SetHistLineWidth(3);
gStyle->SetHistLineColor(kBlue);

// init
Int_t k, N;
TH1D* h_pvt = new TH1D("h_pvt", "PVT", 100, -500., 500.);
TH1D* h_glass = new TH1D("h_glass", "Glass", 100, -500., 500.);
TH1D* h_air = new TH1D("h_air", "Air", 100, -500., 500.);
Double_t xpi, xpf;
TPaveStats* s_pvt, s_glass, s_air;
TCanvas* c_comp = new TCanvas("c_comp", "Comparison", 800, 100, 1200, 1000);

// pvt data
TFile* f = TFile::Open("pvt/chkbd-comparison-test_fullarray.root");
T_xyz->SetBranchAddress("xpi", &xpi);
T_xyz->SetBranchAddress("xpf", &xpf);
N = T_xyz->GetEntries();
for ( k=0; k<N; k++ ) {
  T_xyz->GetEntry(k);
  h_pvt->Fill(xpf-xpi);
}
h_pvt->Draw();
//s_pvt = (TPaveStats*)h_pvt->FindObject("stats");
//s_pvt->SetY1(s_pvt->GetY1()+20);
//s_pvt->SetY2(s_pvt->GetY2()+20);

// glass data
TFile* f = TFile::Open("glass/chkbd-comparison-test_chkbd3d.root");
T_xyz->SetBranchAddress("xpi", &xpi);
T_xyz->SetBranchAddress("xpf", &xpf);
N = T_xyz->GetEntries();
for ( k=0; k<N; k++ ) {
  T_xyz->GetEntry(k);
  h_glass->Fill(xpf-xpi);
}
h_glass->Draw("sames");
//s_glass = (TPaveStats*)h_glass->FindObject("stats");

// air data
TFile* f = TFile::Open("air/chkbd-comparison-test_air.root");
T_xyz->SetBranchAddress("xpi", &xpi);
T_xyz->SetBranchAddress("xpf", &xpf);
N = T_xyz->GetEntries();
for ( k=0; k<N; k++ ) {
  T_xyz->GetEntry(k);
  h_air->Fill(xpf-xpi);
}
h_air->Draw("sames");
//s_air = (TPaveStats*)h_air->FindObject("stats");

// tidy
f->Close();

// prepare plots
h_pvt->SetLineColor(kMagenta);
h_glass->SetLineColor(kBlue);
h_air->SetLineColor(kRed);

//// prepare and draw THStack
//THStack* hs = new THStack;
//hs->Add(h_pvt);
//hs->Add(h_glass);
//hs->Add(h_air);
//hs->SetTitle("3D-Checkerboard Results Comparison");
//hs->Draw("nostack");
//hs->GetXaxis()->SetTitle("Neutron #DeltaX (mm)");

// legend
TLegend* l = new TLegend;
l->AddEntry(h_pvt);
l->AddEntry(h_glass);
l->AddEntry(h_air);
l->SetX1NDC(0.15);
l->SetX2NDC(0.25);
l->SetY1NDC(0.75);
l->SetY2NDC(0.85);
l->Draw();

// overall annotations (using first plot)
h_pvt->SetTitle("3D-Checkerboard Comparison Results");
h_pvt->GetXaxis()->SetTitle("Neutron #Deltax (mm)");

// redraw and save
c_comp->Draw();
//c_comp->SaveSoruce();
c_comp->SaveAs("c_comp.eps");

// all pau!   )
}
