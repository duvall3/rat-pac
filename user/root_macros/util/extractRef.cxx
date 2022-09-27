// extractRef -- wrapper macro to avoid segfaults
//   from repeated instantiations of TRefMatch objects
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

void extractRef(const char* dirname) {

// init
TString filename(dirname);
filename.ReplaceAll("/","");
filename.Append("_ncap_res.root");
TString fullname = dirname + filename;

// main
TRefMatch R = TRefMatch();
R.ExtractRef(fullname.Data(), "T_ncap");

// all pau!   )
return;
}

