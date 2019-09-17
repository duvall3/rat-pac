// geodump -- EWISotT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 9/2019 ~ //

void geodump( const char* filename ) {

// init
TFile* f = TFile::Open(filename);
TIter i = db->begin();

// loop over db entries
for ( i = db->begin(); i != db->end(); ++i ) {

  // declarations and first entry
  TPair* tp = *i;
  TObjString* key = tp->Key();
  TObjString* val = tp->Value();
  TString keystr = key->GetString(), valstr = val->GetString();

//  // test for GEO.<position||size> entry
//  if ( keystr.Contains("size") || keystr.Contains("position") ) {

  // test for target volume and position
//if ( keystr.Contains('"target_cell_.*position"') ) {
  TRegexp tr = "target_cell_[0-9].*position";
  if ( keystr.Contains(tr) ) {

    // cleanup
    valstr.ReplaceAll( "[ ", "" );
    valstr.ReplaceAll( " ]", "" );
    valstr.ReplaceAll( "d,", "" );

    //debug
    cout << keystr.Data() << "\t" << valstr.Data() << endl;

  } //endif -- GEO entry

} // end entry loop

// all pau!   )
}
