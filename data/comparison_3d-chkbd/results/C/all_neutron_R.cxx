// all_neutron_R.cxx -- plot neutron x-displacements together
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 6/2021 ~ //

void all_neutron_R() {

// global opts
gStyle->SetHistLineWidth(3);
gStyle->SetHistLineColor(kBlue);
gROOT->LoadMacro("neutronCaptures.cxx");

// init
Int_t k, N;
TH1D* h_pvt = new TH1D("h_pvt", "PVT", 100, 0., 250.);
TH1D* h_glass = new TH1D("h_glass", "Glass", 100, 0., 250.);
TH1D* h_air = new TH1D("h_air", "Air", 100, 0., 250.);
Double_t R;
TPaveStats* s_pvt, s_glass, s_air;
TCanvas* c_comp_R = new TCanvas("c_comp_R", "Comparison", 800, 100, 1200, 1000);
TTree* T;

// pvt data
TFile* f = TFile::Open("pvt/chkbd-comparison-test_fullarray.root");
T = neutronCaptures(gFile->GetName(), kFALSE, 0);
T->SetBranchAddress("R", &R);
N = T->GetEntries();
for ( k=0; k<N; k++ ) {
  T->GetEntry(k);
  h_pvt->Fill(R);
}
c_comp_R->cd();
h_pvt->Draw();
//s_pvt = (TPaveStats*)h_pvt->FindObject("stats");
//s_pvt->SetY1(s_pvt->GetY1()+20);
//s_pvt->SetY2(s_pvt->GetY2()+20);

// glass data
TFile* f = TFile::Open("glass/chkbd-comparison-test_chkbd3d.root");
T = neutronCaptures(gFile->GetName(), kFALSE, 0);
T->SetBranchAddress("R", &R);
N = T->GetEntries();
for ( k=0; k<N; k++ ) {
  T->GetEntry(k);
  h_glass->Fill(R);
}
c_comp_R->cd();
h_glass->Draw("sames");
//s_glass = (TPaveStats*)h_glass->FindObject("stats");

// air data
TFile* f = TFile::Open("air/chkbd-comparison-test_air.root");
T = neutronCaptures(gFile->GetName(), kFALSE, 0);
T->SetBranchAddress("R", &R);
N = T->GetEntries();
for ( k=0; k<N; k++ ) {
  T->GetEntry(k);
  h_air->Fill(R);
}
c_comp_R->cd();
h_air->Draw("sames");
//s_air = (TPaveStats*)h_air->FindObject("stats");

// tidy
can_skymap->Close();
can_capdist->Close();
can_cospsi->Close();
f->Close();

// prepare plots
h_pvt->SetLineColor(kMagenta);
h_glass->SetLineColor(kBlue);
h_air->SetLineColor(kRed);

// legend
TLegend* l = new TLegend;
l->AddEntry(h_pvt);
l->AddEntry(h_glass);
l->AddEntry(h_air);
l->SetX1NDC(0.85);
l->SetX2NDC(0.95);
l->SetY1NDC(0.65);
l->SetY2NDC(0.80);
l->Draw();

// overall annotations (using first plot)
h_pvt->SetTitle("3D-Checkerboard Comparison Results");
h_pvt->GetXaxis()->SetTitle("Neutron-Capture Displacement (mm)");

// redraw and save
c_comp_R->SetLogy(1);
c_comp_R->Draw();
//c_comp_R->SaveSoruce();
c_comp_R->SaveAs("c_comp_R.eps");

// all pau!   )
}
