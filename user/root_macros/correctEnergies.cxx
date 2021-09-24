// correctEnergies -- extract correct energies from old analysis data and
//   add them to new data
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 8/2021 ~ //

//Copyright (C) 2021 Mark J. Duvall
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


void correctEnergies( const char* mainFilename, const char* energyFilename ) {


//// INIT

// file operations
TFile* f1 = TFile::Open(mainFilename, "update");
TTree* T1 = (TTree*)f1->FindObjectAny("T_scint");
TFile* f2 = TFile::Open(energyFilename);
TTree* T2 = (TTree*)f2->FindObjectAny("T_scint");
f1->cd();

// init
Double_t timeTol = 0.5e-9; // time tolerance (s)
TString evCutStr, timeCutStr;
TCut evCut, timeCut, totalCut;
TEntryList* eList;
Int_t k(0), N = T1->GetEntries();
Int_t _event, event;
Double_t _wall_time_adj, wall_time_adj;
Double_t _corrected_energy, corrected_energy;
Double_t _corrected_energy_q, corrected_energy_q;
//TVectorF matches_0_1_multiple(3);
TVectorF matches_0_1_multiple(4);

// address / create T1 branches
T1->SetBranchAddress("event", &event);
T1->SetBranchAddress("wall_time_adj", &wall_time_adj);
TBranch* cor_en_b = T1->Branch("corrected_energy", &corrected_energy);
TBranch* cor_en_q_b = T1->Branch("corrected_energy_q", &corrected_energy_q);

// address T2 branches
T2->SetBranchAddress("event", &_event);
T2->SetBranchAddress("wall_time_adj", &_wall_time_adj);
T2->SetBranchAddress("energy", &_corrected_energy);
T2->SetBranchAddress("energy_q", &_corrected_energy_q);


//// MAIN
cout << endl;

// prepare match tracking
//Int_t match_count_0, match_count_1, match_count_multiple;
Int_t match_count_0, match_count_1, match_count_2, match_count_many;

// burst loop
Int_t N_list;
cout << "Importing corrected energies..." << endl;
for ( k=0; k<N; k++ ) {

  // reset energies
  corrected_energy = 0;
  corrected_energy_q = 0;

  // setup
  T1->GetEntry(k);
  evCutStr.Form("event == %d", event);
  timeCutStr.Form("abs(wall_time_adj-%1.35e) < %e", wall_time_adj, timeTol);
  evCut = evCutStr;
  timeCut = timeCutStr;
  totalCut = evCut + timeCut;

  // todo (maybe not needed): first find closest match, *then* test for tolerance (then add)
  // TODO // NOTE: CURRENTLY NOT TESTING FOR WHETHER ibdTracksToScint ENTRY 
  //   SHOULD BE SCINTILLATING OR NOT, SO ENTRIES WITHOUT MATCHES ARE EXPECTED;
  //   TESTING NEEDED TO CONFIRM THE CORRECT ENTRIES ARE "MISSING" // TODO //
  // match-finding / tolerance tests
  T2->Draw(">>eList", totalCut, "entrylist");
  eList = (TEntryList*)gDirectory->FindObjectAny("eList");
  N_list = eList->GetN();
  if ( N_list == 0 ) {
    match_count_0++;
  } else if ( N_list == 1 ) {
    match_count_1++;
    T2->GetEntry(eList->GetEntry(0));
    corrected_energy = _corrected_energy;
    corrected_energy_q = _corrected_energy_q;
  } else if ( N_list == 2 ) {
    match_count_2++;
  } else {
    match_count_many++;
//  match_count_multiple++;
//  T2->GetEntry(eList->GetEntry(0));
//  corrected_energy = _corrected_energy;
//  corrected_energy_q = _corrected_energy_q;
  }

  // fill energies
  cor_en_b->Fill();
  cor_en_q_b->Fill();

} // end burst loop
cout << "Done." << endl;


//// END

//// report and prepare to save match counts
//printf( "Entries without matches:\t\t%d (%2.1f\%)\n", match_count_0, (Double_t)100*match_count_0/N );
//printf( "Entries with exactly 1 match:\t\t%d (%2.1f\%)\n", match_count_1, (Double_t)100*match_count_1/N );
//printf( "Entries with multiple matches:\t\t%d (%2.1f\%)\n", match_count_multiple, (Double_t)100*match_count_multiple/N );
//matches_0_1_multiple(0) = match_count_0;
//matches_0_1_multiple(1) = match_count_1;
//matches_0_1_multiple(2) = match_count_multiple;

// report and prepare to save match counts
printf( "Entries without matches:\t\t%d (%.f\%)\n", match_count_0, (Double_t)100*match_count_0/N );
printf( "Entries with exactly 1 match:\t\t%d (%.f\%)\n", match_count_1, (Double_t)100*match_count_1/N );
printf( "Entries with exactly 2 matches:\t\t%d (%.f\%)\n", match_count_2, (Double_t)100*match_count_2/N );
printf( "Entries with matches >= 3:\t\t%d (%.f\%)\n", match_count_many, (Double_t)100*match_count_many/N );
matches_0_1_multiple(0) = match_count_0;
matches_0_1_multiple(1) = match_count_1;
matches_0_1_multiple(2) = match_count_2;
matches_0_1_multiple(2) = match_count_many;

// finish up
f2->Close();
T1->Write("", TObject::kWriteDelete);
matches_0_1_multiple.Write("matches_0_1_multiple");
f1->Close();

// all pau!   )
return;
}
