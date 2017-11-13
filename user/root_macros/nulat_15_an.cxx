// nulat_15_an -- macro to run analysis on results from SONGS-style (IBD) trigger for RAT-PAC experiment "nulat_15"
//   -- NOTE: BASED ON OUTPUT FROM duvall3-->$RATROOT/user/root_macros/SEDAQ.cxx (i.e., TTree* T2)
//   -- NOTE: REQUIRES CUBE GEOMETRY TABLE "nulat_15-cube_pos_table.txt"
//   -- see SEDAQ.cxx (at location above) for documentation
//   ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2017 ~ //


// might return something else, but void for now
void nulat_15_an( TTree* T2, const char* cube_table = "nulat_15-cube_pos_table.txt" ) {


// read cube table into TTree* "TCubes"
TTree* TCubes = new TTree( "TCubes", "cube indices and centers" );
TCubes->ReadFile( cube_table, "row/I:column/I:slice/I:x/D:y/D:z/D" );


// prepare output vars
Double_t cube_x, cube_y, cube_z;


// prepare output tree
//TTree* T3 = new TTree( "T3", "NuLat analysis (cubified) results");
//T3->Branch( 
T2->Branch("cube_x", &cube_x, "cube_x/D");
T2->Branch("cube_y", &cube_y, "cube_y/D");
T2->Branch("cube_z", &cube_z, "cube_z/D");


// fill output tree
Int_t k;
for (( k=0; k<=T2->GetEntries(); k++ )) {
  T2->GetEntry(k);

} //end for



// all pau!   )
return;
}
