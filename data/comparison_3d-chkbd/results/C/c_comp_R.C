{
//=========Macro generated from canvas: c_comp_R/Comparison
//=========  (Wed Jun 23 15:43:02 2021) by ROOT version5.34/30
   TCanvas *c_comp_R = new TCanvas("c_comp_R", "Comparison",720,80,1200,1000);
   c_comp_R->SetHighLightColor(2);
   c_comp_R->Range(-31.25,-0.6132371,281.25,2.508834);
   c_comp_R->SetFillColor(0);
   c_comp_R->SetBorderMode(0);
   c_comp_R->SetBorderSize(2);
   c_comp_R->SetLogy();
   c_comp_R->SetFrameBorderMode(0);
   c_comp_R->SetFrameBorderMode(0);
   
   TH1D *h_pvt = new TH1D("h_pvt","3D-Checkerboard Comparison Results",100,0,250);
   h_pvt->SetBinContent(1,2);
   h_pvt->SetBinContent(3,7);
   h_pvt->SetBinContent(4,15);
   h_pvt->SetBinContent(5,13);
   h_pvt->SetBinContent(6,25);
   h_pvt->SetBinContent(7,30);
   h_pvt->SetBinContent(8,33);
   h_pvt->SetBinContent(9,34);
   h_pvt->SetBinContent(10,49);
   h_pvt->SetBinContent(11,52);
   h_pvt->SetBinContent(12,52);
   h_pvt->SetBinContent(13,70);
   h_pvt->SetBinContent(14,67);
   h_pvt->SetBinContent(15,55);
   h_pvt->SetBinContent(16,73);
   h_pvt->SetBinContent(17,62);
   h_pvt->SetBinContent(18,72);
   h_pvt->SetBinContent(19,64);
   h_pvt->SetBinContent(20,71);
   h_pvt->SetBinContent(21,83);
   h_pvt->SetBinContent(22,82);
   h_pvt->SetBinContent(23,61);
   h_pvt->SetBinContent(24,48);
   h_pvt->SetBinContent(25,61);
   h_pvt->SetBinContent(26,75);
   h_pvt->SetBinContent(27,65);
   h_pvt->SetBinContent(28,66);
   h_pvt->SetBinContent(29,56);
   h_pvt->SetBinContent(30,53);
   h_pvt->SetBinContent(31,42);
   h_pvt->SetBinContent(32,50);
   h_pvt->SetBinContent(33,35);
   h_pvt->SetBinContent(34,33);
   h_pvt->SetBinContent(35,26);
   h_pvt->SetBinContent(36,27);
   h_pvt->SetBinContent(37,23);
   h_pvt->SetBinContent(38,28);
   h_pvt->SetBinContent(39,20);
   h_pvt->SetBinContent(40,25);
   h_pvt->SetBinContent(41,24);
   h_pvt->SetBinContent(42,18);
   h_pvt->SetBinContent(43,19);
   h_pvt->SetBinContent(44,12);
   h_pvt->SetBinContent(45,12);
   h_pvt->SetBinContent(46,11);
   h_pvt->SetBinContent(47,16);
   h_pvt->SetBinContent(48,6);
   h_pvt->SetBinContent(49,13);
   h_pvt->SetBinContent(50,9);
   h_pvt->SetBinContent(51,11);
   h_pvt->SetBinContent(52,6);
   h_pvt->SetBinContent(53,9);
   h_pvt->SetBinContent(54,8);
   h_pvt->SetBinContent(55,3);
   h_pvt->SetBinContent(56,5);
   h_pvt->SetBinContent(58,2);
   h_pvt->SetBinContent(59,4);
   h_pvt->SetBinContent(62,1);
   h_pvt->SetBinContent(64,1);
   h_pvt->SetBinContent(66,1);
   h_pvt->SetBinContent(68,1);
   h_pvt->SetBinContent(69,1);
   h_pvt->SetBinContent(76,1);
   h_pvt->SetBinContent(78,1);
   h_pvt->SetEntries(2000);
   
   TPaveStats *ptstats = new TPaveStats(0.78,0.835,0.98,0.995,"brNDC");
   ptstats->SetName("stats");
   ptstats->SetBorderSize(1);
   ptstats->SetFillColor(0);
   ptstats->SetTextAlign(12);
   TText *text = ptstats->AddText("h_pvt");
   text->SetTextSize(0.0368);
   text = ptstats->AddText("Entries = 2000   ");
   text = ptstats->AddText("Mean  =  58.83");
   text = ptstats->AddText("RMS   =     29");
   ptstats->SetOptStat(1111);
   ptstats->SetOptFit(0);
   ptstats->Draw();
   h_pvt->GetListOfFunctions()->Add(ptstats);
   ptstats->SetParent(h_pvt);

   Int_t ci;      // for color index setting
   TColor *color; // for color definition with alpha
   ci = TColor::GetColor("#ff00ff");
   h_pvt->SetLineColor(ci);
   h_pvt->SetLineWidth(3);
   h_pvt->GetXaxis()->SetTitle("Neutron-Capture Displacement (mm)");
   h_pvt->GetXaxis()->SetLabelFont(132);
   h_pvt->GetXaxis()->SetTitleFont(132);
   h_pvt->Draw("");
   
   TH1D *h_glass = new TH1D("h_glass","Glass",100,0,250);
   h_glass->SetBinContent(1,2);
   h_glass->SetBinContent(2,6);
   h_glass->SetBinContent(3,5);
   h_glass->SetBinContent(4,7);
   h_glass->SetBinContent(5,9);
   h_glass->SetBinContent(6,28);
   h_glass->SetBinContent(7,23);
   h_glass->SetBinContent(8,34);
   h_glass->SetBinContent(9,30);
   h_glass->SetBinContent(10,34);
   h_glass->SetBinContent(11,38);
   h_glass->SetBinContent(12,36);
   h_glass->SetBinContent(13,24);
   h_glass->SetBinContent(14,11);
   h_glass->SetBinContent(15,2);
   h_glass->SetBinContent(16,1);
   h_glass->SetBinContent(17,2);
   h_glass->SetBinContent(19,1);
   h_glass->SetBinContent(20,1);
   h_glass->SetBinContent(21,2);
   h_glass->SetBinContent(22,5);
   h_glass->SetBinContent(23,3);
   h_glass->SetBinContent(24,10);
   h_glass->SetBinContent(25,9);
   h_glass->SetBinContent(26,8);
   h_glass->SetBinContent(27,9);
   h_glass->SetBinContent(28,14);
   h_glass->SetBinContent(29,17);
   h_glass->SetBinContent(30,22);
   h_glass->SetBinContent(31,13);
   h_glass->SetBinContent(32,24);
   h_glass->SetBinContent(33,35);
   h_glass->SetBinContent(34,35);
   h_glass->SetBinContent(35,52);
   h_glass->SetBinContent(36,52);
   h_glass->SetBinContent(37,33);
   h_glass->SetBinContent(38,33);
   h_glass->SetBinContent(39,32);
   h_glass->SetBinContent(40,22);
   h_glass->SetBinContent(41,15);
   h_glass->SetBinContent(42,27);
   h_glass->SetBinContent(43,23);
   h_glass->SetBinContent(44,23);
   h_glass->SetBinContent(45,17);
   h_glass->SetBinContent(46,18);
   h_glass->SetBinContent(47,16);
   h_glass->SetBinContent(48,18);
   h_glass->SetBinContent(49,19);
   h_glass->SetBinContent(50,13);
   h_glass->SetBinContent(51,13);
   h_glass->SetBinContent(52,15);
   h_glass->SetBinContent(53,10);
   h_glass->SetBinContent(54,5);
   h_glass->SetBinContent(55,13);
   h_glass->SetBinContent(56,16);
   h_glass->SetBinContent(57,20);
   h_glass->SetBinContent(58,26);
   h_glass->SetBinContent(59,29);
   h_glass->SetBinContent(60,35);
   h_glass->SetBinContent(61,32);
   h_glass->SetBinContent(62,26);
   h_glass->SetBinContent(63,27);
   h_glass->SetBinContent(64,29);
   h_glass->SetBinContent(65,32);
   h_glass->SetBinContent(66,21);
   h_glass->SetBinContent(67,27);
   h_glass->SetBinContent(68,20);
   h_glass->SetBinContent(69,17);
   h_glass->SetBinContent(70,13);
   h_glass->SetBinContent(71,20);
   h_glass->SetBinContent(72,15);
   h_glass->SetBinContent(73,12);
   h_glass->SetBinContent(74,20);
   h_glass->SetBinContent(75,20);
   h_glass->SetBinContent(76,15);
   h_glass->SetBinContent(77,8);
   h_glass->SetBinContent(78,9);
   h_glass->SetBinContent(79,9);
   h_glass->SetBinContent(80,8);
   h_glass->SetBinContent(81,12);
   h_glass->SetBinContent(82,8);
   h_glass->SetBinContent(83,12);
   h_glass->SetBinContent(84,8);
   h_glass->SetBinContent(85,13);
   h_glass->SetBinContent(86,9);
   h_glass->SetBinContent(87,15);
   h_glass->SetBinContent(88,16);
   h_glass->SetBinContent(89,16);
   h_glass->SetBinContent(90,15);
   h_glass->SetBinContent(91,16);
   h_glass->SetBinContent(92,10);
   h_glass->SetBinContent(93,10);
   h_glass->SetBinContent(94,15);
   h_glass->SetBinContent(95,14);
   h_glass->SetBinContent(96,9);
   h_glass->SetBinContent(97,13);
   h_glass->SetBinContent(98,12);
   h_glass->SetBinContent(99,15);
   h_glass->SetBinContent(100,9);
   h_glass->SetBinContent(101,278);
   h_glass->SetEntries(2000);
   
   ptstats = new TPaveStats(0.7801003,0.6529774,0.9807692,0.8131417,"brNDC");
   ptstats->SetName("stats");
   ptstats->SetBorderSize(1);
   ptstats->SetFillColor(0);
   ptstats->SetTextAlign(12);
   text = ptstats->AddText("h_glass");
   text->SetTextSize(0.03683778);
   text = ptstats->AddText("Entries = 2000   ");
   text = ptstats->AddText("Mean  =  121.4");
   text = ptstats->AddText("RMS   =  65.47");
   ptstats->SetOptStat(1111);
   ptstats->SetOptFit(0);
   ptstats->Draw();
   h_glass->GetListOfFunctions()->Add(ptstats);
   ptstats->SetParent(h_glass);

   ci = TColor::GetColor("#0000ff");
   h_glass->SetLineColor(ci);
   h_glass->SetLineWidth(3);
   h_glass->GetXaxis()->SetLabelFont(132);
   h_glass->GetXaxis()->SetTitleFont(132);
   h_glass->Draw("sames");
   
   TH1D *h_air = new TH1D("h_air","Air",100,0,250);
   h_air->SetBinContent(2,3);
   h_air->SetBinContent(3,6);
   h_air->SetBinContent(4,18);
   h_air->SetBinContent(5,10);
   h_air->SetBinContent(6,14);
   h_air->SetBinContent(7,19);
   h_air->SetBinContent(8,28);
   h_air->SetBinContent(9,25);
   h_air->SetBinContent(10,26);
   h_air->SetBinContent(11,26);
   h_air->SetBinContent(12,23);
   h_air->SetBinContent(13,10);
   h_air->SetBinContent(14,5);
   h_air->SetBinContent(15,3);
   h_air->SetBinContent(18,1);
   h_air->SetBinContent(23,5);
   h_air->SetBinContent(24,2);
   h_air->SetBinContent(25,2);
   h_air->SetBinContent(26,7);
   h_air->SetBinContent(27,7);
   h_air->SetBinContent(28,6);
   h_air->SetBinContent(29,3);
   h_air->SetBinContent(30,9);
   h_air->SetBinContent(31,8);
   h_air->SetBinContent(32,7);
   h_air->SetBinContent(33,11);
   h_air->SetBinContent(34,16);
   h_air->SetBinContent(35,24);
   h_air->SetBinContent(36,22);
   h_air->SetBinContent(37,22);
   h_air->SetBinContent(38,25);
   h_air->SetBinContent(39,16);
   h_air->SetBinContent(40,21);
   h_air->SetBinContent(41,20);
   h_air->SetBinContent(42,7);
   h_air->SetBinContent(43,12);
   h_air->SetBinContent(44,4);
   h_air->SetBinContent(45,11);
   h_air->SetBinContent(46,5);
   h_air->SetBinContent(47,10);
   h_air->SetBinContent(48,7);
   h_air->SetBinContent(49,6);
   h_air->SetBinContent(50,11);
   h_air->SetBinContent(51,11);
   h_air->SetBinContent(52,6);
   h_air->SetBinContent(53,9);
   h_air->SetBinContent(54,7);
   h_air->SetBinContent(55,14);
   h_air->SetBinContent(56,14);
   h_air->SetBinContent(57,14);
   h_air->SetBinContent(58,8);
   h_air->SetBinContent(59,14);
   h_air->SetBinContent(60,20);
   h_air->SetBinContent(61,19);
   h_air->SetBinContent(62,21);
   h_air->SetBinContent(63,19);
   h_air->SetBinContent(64,24);
   h_air->SetBinContent(65,18);
   h_air->SetBinContent(66,18);
   h_air->SetBinContent(67,13);
   h_air->SetBinContent(68,16);
   h_air->SetBinContent(69,10);
   h_air->SetBinContent(70,18);
   h_air->SetBinContent(71,15);
   h_air->SetBinContent(72,7);
   h_air->SetBinContent(73,11);
   h_air->SetBinContent(74,9);
   h_air->SetBinContent(75,9);
   h_air->SetBinContent(76,9);
   h_air->SetBinContent(77,7);
   h_air->SetBinContent(78,5);
   h_air->SetBinContent(79,7);
   h_air->SetBinContent(80,6);
   h_air->SetBinContent(81,11);
   h_air->SetBinContent(82,14);
   h_air->SetBinContent(83,13);
   h_air->SetBinContent(84,16);
   h_air->SetBinContent(85,7);
   h_air->SetBinContent(86,21);
   h_air->SetBinContent(87,14);
   h_air->SetBinContent(88,14);
   h_air->SetBinContent(89,10);
   h_air->SetBinContent(90,10);
   h_air->SetBinContent(91,7);
   h_air->SetBinContent(92,13);
   h_air->SetBinContent(93,15);
   h_air->SetBinContent(94,12);
   h_air->SetBinContent(95,16);
   h_air->SetBinContent(96,19);
   h_air->SetBinContent(97,12);
   h_air->SetBinContent(98,16);
   h_air->SetBinContent(99,12);
   h_air->SetBinContent(100,15);
   h_air->SetBinContent(101,832);
   h_air->SetEntries(2000);
   
   ptstats = new TPaveStats(0.7792642,0.2258727,0.9799331,0.386037,"brNDC");
   ptstats->SetName("stats");
   ptstats->SetBorderSize(1);
   ptstats->SetFillColor(0);
   ptstats->SetTextAlign(12);
   text = ptstats->AddText("h_air");
   text->SetTextSize(0.03683778);
   text = ptstats->AddText("Entries = 2000   ");
   text = ptstats->AddText("Mean  =  131.6");
   text = ptstats->AddText("RMS   =  72.07");
   ptstats->SetOptStat(1111);
   ptstats->SetOptFit(0);
   ptstats->Draw();
   h_air->GetListOfFunctions()->Add(ptstats);
   ptstats->SetParent(h_air);

   ci = TColor::GetColor("#ff0000");
   h_air->SetLineColor(ci);
   h_air->SetLineWidth(3);
   h_air->GetXaxis()->SetLabelFont(132);
   h_air->GetXaxis()->SetTitleFont(132);
   h_air->Draw("sames");
   
   TLegend *leg = new TLegend(0.01505017,0.6386037,0.1153846,0.788501,NULL,"brNDC");
   leg->SetBorderSize(1);
   leg->SetTextFont(132);
   leg->SetLineColor(1);
   leg->SetLineStyle(1);
   leg->SetLineWidth(1);
   leg->SetFillColor(0);
   leg->SetFillStyle(1001);
   TLegendEntry *entry=leg->AddEntry("h_pvt","PVT","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#ff00ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_glass","Glass","lpf");
   entry->SetFillStyle(1001);

   ci = TColor::GetColor("#0000ff");
   entry->SetLineColor(ci);
   entry->SetLineStyle(1);
   entry->SetLineWidth(3);
   entry->SetMarkerColor(1);
   entry->SetMarkerStyle(1);
   entry->SetMarkerSize(1);
   entry->SetTextFont(132);
   entry=leg->AddEntry("h_air","Air","lpf");
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
   
   TPaveText *pt = new TPaveText(0.01,0.9407906,0.71,0.995,"blNDC");
   pt->SetName("title");
   pt->SetBorderSize(1);
   pt->SetFillColor(0);
   text = pt->AddText("3D-Checkerboard Comparison Results");
   pt->Draw();
   c_comp_R->Modified();
   c_comp_R->cd();
   c_comp_R->SetSelected(c_comp_R);
}
