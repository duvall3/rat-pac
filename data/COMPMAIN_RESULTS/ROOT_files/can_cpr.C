{
//=========Macro generated from canvas: can_cpr/All Cos[psi] Results
//=========  (Sat Sep 18 23:52:33 2021) by ROOT version5.34/30

   gStyle->SetCanvasPreferGL(kTRUE);

   TCanvas *can_cpr = new TCanvas("can_cpr", "All Cos[psi] Results",1120,64,800,800);
   can_cpr->SetHighLightColor(2);
   can_cpr->Range(-1.2625,-200,1.2625,1800);
   can_cpr->SetFillColor(0);
   can_cpr->SetBorderMode(0);
   can_cpr->SetBorderSize(2);
   can_cpr->SetFrameBorderMode(0);
   can_cpr->SetFrameBorderMode(0);
   
   TH1D *h_cos_psi = new TH1D("h_cos_psi","Cos[#psi]",10,-1.01,1.01);
   h_cos_psi->SetBinContent(1,843);
   h_cos_psi->SetBinContent(2,868);
   h_cos_psi->SetBinContent(3,824);
   h_cos_psi->SetBinContent(4,938);
   h_cos_psi->SetBinContent(5,857);
   h_cos_psi->SetBinContent(6,913);
   h_cos_psi->SetBinContent(7,995);
   h_cos_psi->SetBinContent(8,1016);
   h_cos_psi->SetBinContent(9,1001);
   h_cos_psi->SetBinContent(10,907);
   h_cos_psi->SetMinimum(0);
   h_cos_psi->SetMaximum(1600);
   h_cos_psi->SetEntries(9162);
   h_cos_psi->SetStats(0);

   Int_t ci;      // for color index setting
   TColor *color; // for color definition with alpha
   ci = TColor::GetColor("#0000ff");
   h_cos_psi->SetLineColor(ci);
   h_cos_psi->SetLineWidth(3);
   h_cos_psi->GetXaxis()->SetTitle("cos[#psi]");
   h_cos_psi->GetXaxis()->SetLabelFont(42);
   h_cos_psi->GetYaxis()->SetLabelFont(42);
   h_cos_psi->GetZaxis()->SetLabelFont(42);
   h_cos_psi->Draw("");
   
   TPaveText *pt = new TPaveText(0.01,0.9407364,0.1757286,0.995,"blNDC");
   pt->SetName("title");
   pt->SetBorderSize(1);
   pt->SetFillColor(0);
   pt->SetTextFont(22);
   TText *text = pt->AddText("Cos[#psi]");
   pt->Draw();
   
   TLegend *leg = new TLegend(0.01,0.83,0.12,0.93,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(1);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   TLegendEntry *entry=leg->AddEntry("h_cos_psi","CHOOZ","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_cos_psi","NuLat (3)","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#00ffff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_cos_psi","NuLat (5)","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#00ff00");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_cos_psi","SANTA","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_cos_psi","SANDD","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_cos_psi","2D Chkbd.","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ffff00");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   
   TH1D *h_cos_psi = new TH1D("h_cos_psi","Cos[#psi]",10,-1.01,1.01);
   h_cos_psi->SetBinContent(1,184);
   h_cos_psi->SetBinContent(2,343);
   h_cos_psi->SetBinContent(3,178);
   h_cos_psi->SetBinContent(5,873);
   h_cos_psi->SetBinContent(6,834);
   h_cos_psi->SetBinContent(8,435);
   h_cos_psi->SetBinContent(9,933);
   h_cos_psi->SetBinContent(10,517);
   h_cos_psi->SetMinimum(0);
   h_cos_psi->SetMaximum(1119.6);
   h_cos_psi->SetEntries(4297);
   h_cos_psi->SetStats(0);

   ci = TColor::GetColor("#00ffff");
   h_cos_psi->SetLineColor(ci);
   h_cos_psi->SetLineWidth(3);
   h_cos_psi->GetXaxis()->SetTitle("cos[#psi]");
   h_cos_psi->GetXaxis()->SetLabelFont(42);
   h_cos_psi->GetYaxis()->SetLabelFont(42);
   h_cos_psi->GetZaxis()->SetLabelFont(42);
   h_cos_psi->Draw("same");
   
   TH1D *h_cos_psi = new TH1D("h_cos_psi","Cos[#psi]",10,-1.01,1.01);
   h_cos_psi->SetBinContent(1,146);
   h_cos_psi->SetBinContent(2,197);
   h_cos_psi->SetBinContent(3,149);
   h_cos_psi->SetBinContent(4,4);
   h_cos_psi->SetBinContent(5,649);
   h_cos_psi->SetBinContent(6,651);
   h_cos_psi->SetBinContent(7,13);
   h_cos_psi->SetBinContent(8,388);
   h_cos_psi->SetBinContent(9,628);
   h_cos_psi->SetBinContent(10,583);
   h_cos_psi->SetMinimum(0);
   h_cos_psi->SetMaximum(781.2);
   h_cos_psi->SetEntries(3408);
   h_cos_psi->SetStats(0);

   ci = TColor::GetColor("#00ff00");
   h_cos_psi->SetLineColor(ci);
   h_cos_psi->SetLineWidth(3);
   h_cos_psi->GetXaxis()->SetTitle("cos[#psi]");
   h_cos_psi->GetXaxis()->SetLabelFont(42);
   h_cos_psi->GetYaxis()->SetLabelFont(42);
   h_cos_psi->GetZaxis()->SetLabelFont(42);
   h_cos_psi->Draw("same");
   
   TH1D *h_cos_psi = new TH1D("h_cos_psi","Cos[#psi]",10,-1.01,1.01);
   h_cos_psi->SetBinContent(7,1);
   h_cos_psi->SetBinContent(8,45);
   h_cos_psi->SetBinContent(9,488);
   h_cos_psi->SetBinContent(10,1531);
   h_cos_psi->SetBinContent(11,1);
   h_cos_psi->SetMinimum(0);
   h_cos_psi->SetMaximum(1837.2);
   h_cos_psi->SetEntries(2066);
   h_cos_psi->SetStats(0);

   ci = TColor::GetColor("#ff0000");
   h_cos_psi->SetLineColor(ci);
   h_cos_psi->SetLineWidth(3);
   h_cos_psi->GetXaxis()->SetTitle("cos[#psi]");
   h_cos_psi->GetXaxis()->SetLabelFont(42);
   h_cos_psi->GetYaxis()->SetLabelFont(42);
   h_cos_psi->GetZaxis()->SetLabelFont(42);
   h_cos_psi->Draw("same");
   
   TH1D *h_cos_psi = new TH1D("h_cos_psi","Cos[#psi]",10,-1.01,1.01);
   h_cos_psi->SetBinContent(1,16);
   h_cos_psi->SetBinContent(2,7);
   h_cos_psi->SetBinContent(3,5);
   h_cos_psi->SetBinContent(4,8);
   h_cos_psi->SetBinContent(5,13);
   h_cos_psi->SetBinContent(6,13);
   h_cos_psi->SetBinContent(7,9);
   h_cos_psi->SetBinContent(8,25);
   h_cos_psi->SetBinContent(9,24);
   h_cos_psi->SetBinContent(10,54);
   h_cos_psi->SetMinimum(0);
   h_cos_psi->SetMaximum(64.8);
   h_cos_psi->SetEntries(174);
   h_cos_psi->SetStats(0);

   ci = TColor::GetColor("#ff00ff");
   h_cos_psi->SetLineColor(ci);
   h_cos_psi->SetLineWidth(3);
   h_cos_psi->GetXaxis()->SetTitle("cos[#psi]");
   h_cos_psi->GetXaxis()->SetLabelFont(42);
   h_cos_psi->GetYaxis()->SetLabelFont(42);
   h_cos_psi->GetZaxis()->SetLabelFont(42);
   h_cos_psi->Draw("same");
   
   TH1D *h_cos_psi = new TH1D("h_cos_psi","Cos[#psi]",10,-1.01,1.01);
   h_cos_psi->SetBinContent(1,171);
   h_cos_psi->SetBinContent(2,104);
   h_cos_psi->SetBinContent(3,87);
   h_cos_psi->SetBinContent(4,81);
   h_cos_psi->SetBinContent(5,89);
   h_cos_psi->SetBinContent(6,91);
   h_cos_psi->SetBinContent(7,117);
   h_cos_psi->SetBinContent(8,169);
   h_cos_psi->SetBinContent(9,210);
   h_cos_psi->SetBinContent(10,534);
   h_cos_psi->SetMinimum(0);
   h_cos_psi->SetMaximum(640.8);
   h_cos_psi->SetEntries(1653);
   h_cos_psi->SetStats(0);

   ci = TColor::GetColor("#ffff00");
   h_cos_psi->SetLineColor(ci);
   h_cos_psi->SetLineWidth(3);
   h_cos_psi->GetXaxis()->SetTitle("cos[#psi]");
   h_cos_psi->GetXaxis()->SetLabelFont(42);
   h_cos_psi->GetYaxis()->SetLabelFont(42);
   h_cos_psi->GetZaxis()->SetLabelFont(42);
   h_cos_psi->Draw("same");
   can_cpr->Modified();
   can_cpr->cd();
   can_cpr->SetSelected(can_cpr);
}
