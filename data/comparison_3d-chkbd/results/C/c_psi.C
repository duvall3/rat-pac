{
//=========Macro generated from canvas: c_psi/c_psi
//=========  (Tue Jun 22 15:54:57 2021) by ROOT version5.34/30
   TCanvas *c_psi = new TCanvas("c_psi", "c_psi",720,80,1200,1000);
   c_psi->SetHighLightColor(2);
   c_psi->Range(-1.25,-63.9,1.25,575.1);
   c_psi->SetFillColor(0);
   c_psi->SetBorderMode(0);
   c_psi->SetBorderSize(2);
   c_psi->SetFrameBorderMode(0);
   c_psi->SetFrameBorderMode(0);
   
   TH1D *hcospsi_pvt = new TH1D("hcospsi_pvt","3D-Checkerboard Comparison Results",10,-1,1);
   hcospsi_pvt->SetBinContent(1,89);
   hcospsi_pvt->SetBinContent(2,100);
   hcospsi_pvt->SetBinContent(3,94);
   hcospsi_pvt->SetBinContent(4,140);
   hcospsi_pvt->SetBinContent(5,173);
   hcospsi_pvt->SetBinContent(6,197);
   hcospsi_pvt->SetBinContent(7,206);
   hcospsi_pvt->SetBinContent(8,252);
   hcospsi_pvt->SetBinContent(9,319);
   hcospsi_pvt->SetBinContent(10,426);
   hcospsi_pvt->SetBinContent(11,4);
   hcospsi_pvt->SetMinimum(0);
   hcospsi_pvt->SetMaximum(511.2);
   hcospsi_pvt->SetEntries(2000);
   
   TPaveStats *ptstats = new TPaveStats(0.7876254,0.8131417,0.9882943,0.973306,"brNDC");
   ptstats->SetName("stats");
   ptstats->SetBorderSize(1);
   ptstats->SetFillColor(0);
   ptstats->SetTextAlign(12);
   TText *text = ptstats->AddText("hcospsi_pvt");
   text->SetTextSize(0.03683778);
   text = ptstats->AddText("Entries = 2000   ");
   text = ptstats->AddText("Mean  = 0.2819");
   text = ptstats->AddText("RMS   = 0.5472");
   ptstats->SetOptStat(1111);
   ptstats->SetOptFit(0);
   ptstats->Draw();
   hcospsi_pvt->GetListOfFunctions()->Add(ptstats);
   ptstats->SetParent(hcospsi_pvt);

   Int_t ci;      // for color index setting
   TColor *color; // for color definition with alpha
   ci = TColor::GetColor("#ff00ff");
   hcospsi_pvt->SetLineColor(ci);
   hcospsi_pvt->SetLineWidth(3);
   hcospsi_pvt->GetXaxis()->SetTitle("cos[#psi]");
   hcospsi_pvt->GetXaxis()->SetLabelFont(132);
   hcospsi_pvt->GetXaxis()->SetTitleFont(132);
   hcospsi_pvt->Draw("");
   
   TPaveText *pt = new TPaveText(0.01,0.9407906,0.71,0.995,"blNDC");
   pt->SetName("title");
   pt->SetBorderSize(1);
   pt->SetFillColor(0);
   pt->SetLineWidth(3);
   text = pt->AddText("3D-Checkerboard Comparison Results");
   pt->Draw();
   
   TH1D *hcospsi_glass = new TH1D("hcospsi_glass","Glass",10,-1,1);
   hcospsi_glass->SetBinContent(1,103);
   hcospsi_glass->SetBinContent(2,172);
   hcospsi_glass->SetBinContent(3,142);
   hcospsi_glass->SetBinContent(4,180);
   hcospsi_glass->SetBinContent(5,183);
   hcospsi_glass->SetBinContent(6,189);
   hcospsi_glass->SetBinContent(7,186);
   hcospsi_glass->SetBinContent(8,250);
   hcospsi_glass->SetBinContent(9,329);
   hcospsi_glass->SetBinContent(10,263);
   hcospsi_glass->SetBinContent(11,3);
   hcospsi_glass->SetMinimum(0);
   hcospsi_glass->SetMaximum(394.8);
   hcospsi_glass->SetEntries(2000);
   
   ptstats = new TPaveStats(0.7867893,0.3162218,0.9874582,0.476386,"brNDC");
   ptstats->SetName("stats");
   ptstats->SetBorderSize(1);
   ptstats->SetFillColor(0);
   ptstats->SetTextAlign(12);
   text = ptstats->AddText("hcospsi_glass");
   text->SetTextSize(0.03683778);
   text = ptstats->AddText("Entries = 2000   ");
   text = ptstats->AddText("Mean  = 0.1581");
   text = ptstats->AddText("RMS   =  0.564");
   ptstats->SetOptStat(1111);
   ptstats->SetOptFit(0);
   ptstats->Draw();
   hcospsi_glass->GetListOfFunctions()->Add(ptstats);
   ptstats->SetParent(hcospsi_glass);

   ci = TColor::GetColor("#0000ff");
   hcospsi_glass->SetLineColor(ci);
   hcospsi_glass->SetLineWidth(3);
   hcospsi_glass->GetXaxis()->SetTitle("cos[#psi]");
   hcospsi_glass->GetXaxis()->SetLabelFont(132);
   hcospsi_glass->GetXaxis()->SetTitleFont(132);
   hcospsi_glass->Draw("sames");
   
   TH1D *hcospsi_air = new TH1D("hcospsi_air","Air",10,-1,1);
   hcospsi_air->SetBinContent(1,103);
   hcospsi_air->SetBinContent(2,154);
   hcospsi_air->SetBinContent(3,173);
   hcospsi_air->SetBinContent(4,148);
   hcospsi_air->SetBinContent(5,152);
   hcospsi_air->SetBinContent(6,197);
   hcospsi_air->SetBinContent(7,225);
   hcospsi_air->SetBinContent(8,233);
   hcospsi_air->SetBinContent(9,330);
   hcospsi_air->SetBinContent(10,285);
   hcospsi_air->SetMinimum(0);
   hcospsi_air->SetMaximum(396);
   hcospsi_air->SetEntries(2000);
   
   ptstats = new TPaveStats(0.7876254,0.1427105,0.9882943,0.3028747,"brNDC");
   ptstats->SetName("stats");
   ptstats->SetBorderSize(1);
   ptstats->SetFillColor(0);
   ptstats->SetTextAlign(12);
   text = ptstats->AddText("hcospsi_air");
   text->SetTextSize(0.03683778);
   text = ptstats->AddText("Entries = 2000   ");
   text = ptstats->AddText("Mean  =  0.174");
   text = ptstats->AddText("RMS   = 0.5646");
   ptstats->SetOptStat(1111);
   ptstats->SetOptFit(0);
   ptstats->Draw();
   hcospsi_air->GetListOfFunctions()->Add(ptstats);
   ptstats->SetParent(hcospsi_air);

   ci = TColor::GetColor("#ff0000");
   hcospsi_air->SetLineColor(ci);
   hcospsi_air->SetLineWidth(3);
   hcospsi_air->GetXaxis()->SetTitle("cos[#psi]");
   hcospsi_air->GetXaxis()->SetLabelFont(132);
   hcospsi_air->GetXaxis()->SetTitleFont(132);
   hcospsi_air->Draw("sames");
   
   TLegend *leg = new TLegend(0.1822742,0.7053388,0.3319398,0.825462,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(3);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   TLegendEntry *entry=leg->AddEntry("hcospsi_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_air","Air","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   
   leg = new TLegend(0.1822742,0.7053388,0.3319398,0.825462,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(3);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   entry=leg->AddEntry("hcospsi_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_air","Air","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   
   leg = new TLegend(0.1822742,0.7053388,0.3319398,0.825462,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(3);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   entry=leg->AddEntry("hcospsi_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_air","Air","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   
   leg = new TLegend(0.1822742,0.7053388,0.3319398,0.825462,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(3);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   entry=leg->AddEntry("hcospsi_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_air","Air","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   
   leg = new TLegend(0.1822742,0.7053388,0.3319398,0.825462,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(3);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   entry=leg->AddEntry("hcospsi_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_air","Air","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   
   leg = new TLegend(0.1822742,0.7053388,0.3319398,0.825462,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(3);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   entry=leg->AddEntry("hcospsi_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("hcospsi_air","Air","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff0000");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   leg->Draw();
   c_psi->Modified();
   c_psi->cd();
   c_psi->SetSelected(c_psi);
}
