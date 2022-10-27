// part of pmtBasics.cxx
void drawCentroid(const char* filename) {

// workaround for drawing error
TFile *f = TFile::Open(filename, "update");
TTree *T_qt = (TTree*)gDirectory->Get("T_qt");
TCanvas *c_r = new TCanvas("c_r", "c_r");
T_qt->Draw("centPos.fZ:centPos.fY:centPos.fX>>hr", "", "glbox1FbBb");	// PMT-centroid histogram
hr->SetTitle("Event PMT Centroids");
hr->SetFillColor(kBlue);
hr->GetXaxis()->SetTitle("x (mm)");
hr->GetYaxis()->SetTitle("y (mm)");
hr->GetZaxis()->SetTitle("z (mm)");
hr->GetXaxis()->SetTitleOffset(1.50);
hr->GetYaxis()->SetTitleOffset(2.50);
hr->GetZaxis()->SetTitleOffset(2.25);
TPaveText *hrt = new TPaveText(0.1, 0.7, 0.9, 0.9);
hrt->AddText(hr->GetTitle());
hrt->Draw();
c_r->Write("c_r");
hr->Write("hr");
f->Close();
return;

}
