// nulat_15_an -- macro to run analysis on results from SONGS-style (IBD) trigger for RAT-PAC experiment "nulat_15"
//   -- NOTE: BASED ON "_T.root" FILE from duvall3-->comparison
//   -- NOTE: REQUIRES CUBE GEOMETRY TABLE "nulat_15-cube_pos_table.txt"
//   -- see SEDAQ.cxx (at location above) for documentation
//   ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 11/2017 ~ //


TTree* nulat_15_an( const char* filename, const char* cube_table = "nulat_15-cube_pos_table.txt" ) {


// init cube (half-)size
Double_t cube_half_side = 25.; //mm


// prepare output tree
Double_t cubed_x, cubed_y, cubed_z;
TTree* T_cubed = new TTree( "T_cubed", "NuLat analysis (cubified) results");
T_cubed->Branch("cubed_x", &cubed_x, "cubed_x/D");
T_cubed->Branch("cubed_y", &cubed_y, "cubed_y/D");
T_cubed->Branch("cubed_z", &cubed_z, "cubed_z/D");
// read & address burst output
TFriendElement* TF = T_cubed->AddFriend("T", filename);
TTree* T = TF->GetTree();
Double_t x, y, z;
T->SetBranchAddress("x", &x);
T->SetBranchAddress("y", &y);
T->SetBranchAddress("z", &z);


// read cube table into TTree* "TCubes"
Int_t row, column, slice;
Double_t cx, cy, cz;
TTree* TCubes = new TTree( "TCubes", "cube indices and centers" );
TCubes->ReadFile( cube_table, "row/I:column/I:slice/I:cx/D:cy/D:cz/D" );
TCubes->SetBranchAddress("row", &row);
TCubes->SetBranchAddress("column", &column);
TCubes->SetBranchAddress("slice", &slice);
TCubes->SetBranchAddress("cx", &cx);
TCubes->SetBranchAddress("cy", &cy);
TCubes->SetBranchAddress("cz", &cz);


// fill output tree
Int_t k, m;
for (( k=0; k<=T->GetEntries(); k++ )) { // burst loop
  T->GetEntry(k); // get SEDAQ entry for this burst -- pulls x, y, z
  for (( m=0; m<=TCubes->GetEntries(); m++ )) { // cube loop
    TCubes->GetEntry(m); // get cube for comparison
    if ( abs(cx-x)<=cube_half_side & abs(cy-y)<=cube_half_side & abs(cz-z)<=cube_half_side ) {
      // // burst happened inside this cube:
      cubed_x = cx;
      cubed_y = cy;
      cubed_z = cz;
//    cubed_x = k; //DEBUG
//    cubed_y = k+1; //DEBUG
//    cubed_z = k+2; //DEBUG
//    cout << m << "\t\t"; //DEBUG
//    cout << "inside if:\t" << x << "\t" << y << "\t" << z << "\t\t" << k << "\t" << m << endl;  //DEBUG
    }  //end if
//  cout << "outside if:\t" << x << "\t" << y << "\t" << z << "\t\t" << k << "\t" << m << endl;  //DEBUG
  } //end cube loop
  T_cubed->Fill();
//cout << "outside cube loop:\t\t" << x << "\t" << y << "\t" << z << "\t\t" << k << "\t" << m << endl;  //DEBUG
} //end burst loop

cout << endl << endl; //DEBUG


// all pau!   )
return T_cubed;
}
