// extractTest -- wrapper macro to avoid segfaults
//   from repeated instantiations of TTestMatch objects
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

void extractTest(const char* dirname) {

// init
TString filename(dirname);
filename.ReplaceAll("/","");
filename.Append("_ncap_res.root");
TString fullname = dirname + filename;

// main
TRefMatch R = TRefMatch();
R.ExtractTest(fullname.Data(), "T_ncap");

// all pau!   )
return;
}

