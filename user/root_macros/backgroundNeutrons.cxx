// backgroundNeutrons -- macro for getting muogenic background parameters
//   from TRATNeutronGen and preparing a neutron ROOT file to feed to RAT-PAC
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall / T. Rocks Science
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <http://www.gnu.org/licenses/>.

//#include <TRATNeutronGen.cxx>

void backgroundNeutrons( const char* infile = "bgNeutronSpec.root" ) {

// input init
Long64_t k;
Double_t nEnergy;
TVector3 *nMom = new TVector3;
TFile *fin = TFile::Open(infile);//, "update");
TTree *T_BGN = (TTree*)gDirectory->Get("T_BGN");
T_BGN->SetBranchAddress("nEnergy", &nEnergy);
T_BGN->SetBranchAddress("nMom", &nMom);
Long64_t numNeutrons = T_BGN->GetEntries();

// output init
TString outFile(infile);
outFile.ReplaceAll(".root","");
outFile.ReplaceAll("Spec","");
outFile.Append("s.root");
TFile *f = TFile::Open(outFile.Data(), "recreate");
Int_t pdg = 2112;
const char* pclname = "neutron";
//Double_t px = 10., py = 20., pz = 30.; //debug
//TVector3 p = TVector3(px,py,pz); //debug
//TVector3 p;
RAT::DS::Root *ds = new RAT::DS::Root;
RAT::DS::MC *mc = ds->GetMC();
TTree *T = new TTree("T","T");
T->Branch("ds", &ds);

//// prepare to add MCParticles
//RAT::DS::MCParticle *P = new RAT::DS::MCParticle();
//P->SetPDGCode(2112);
//P->SetParticleName("neutron");
//RAT::DS::MCParticle *p = (RAT::DS::MCParticle*)P->Clone("p");
////TTree *Tout = new TTree("T_BGNeutrons", "Muogenic Fast-Neutron Data for RAT-PAC Vertexfile Generator");
////Tout->Branch("p", &p);
////TFile *fout = TFile::Open(outFile.Data(), "recreate");
//TBranch *mcpB = T_BGN->Branch("mcparticle", &p);

// add neutrons from input TTree to MC
for ( k=0; k<numNeutrons; k++ ) {
  T_BGN->GetEntry(k);
//p = (RAT::DS::MCParticle*)P->Clone("p");
//T->Fill();
//mcpB->Fill();
  RAT::DS::Root *ds = new RAT::DS::Root;
  RAT::DS::MC *mc = ds->GetMC();
  RAT::DS::MCParticle *mcp = mc->AddNewMCParticle();
  mcp->SetPDGCode(pdg);
  mcp->SetParticleName(pclname);
//mcp->SetMomentum(p);
  mcp->SetMomentum(*nMom);
  RAT::DS::MCParticle *parent = mc->AddNewMCParent();
  T->Fill();
}

//// from temp
/*
TUUID mcu, mcpu, paru, Tu, dsu;
mc->SetUniqueID(mcu.GetUUIDNumber());
mcp->SetUniqueID(mcpu.GetUUIDNumber());
parent->SetUniqueID(paru.GetUUIDNumber());
T->SetUniqueID(Tu.GetUUIDNumber());
ds->SetUniqueID(dsu.GetUUIDNumber());
*/

//// from temp
//for ( Int_t k=0; k<25; k++ ) {
//  RAT::DS::MCParticle *mcp = mc->AddNewMCParticle();
//  mcp->SetPDGCode(pdg);
//  mcp->SetParticleName(pclname);
////  TUUID *MCPu = new TUUID;
////  mcp->SetUniqueID(MCPu.GetUUIDNumber());
////  RAT::DS::Root *ds = new RAT::DS::Root;
////  RAT::DS::MC *mc = ds->GetMC();
//  p.SetX(k);
//  mcp->SetMomentum(p);
//  T->Fill();
////  delete ds;
////  delete MCPu;
//}

// save output
fin->Close();
//mcp->Write("mcp");
//mc->Write("mc");
ds->Write("ds");
T->Write("T");
f->Write();
f->Close();

// all pau!   )
}
