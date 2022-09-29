// extractRef -- wrapper macro to avoid segfaults
//   from repeated instantiations of TRefMatch objects
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

void extractRef(const char* name, Bool_t kIsDirectory = kFALSE) {

// file or directory
if (kIsDirectory) { // is directory name

  // init
  TString filename(name);
  filename.ReplaceAll("/","");
  filename.Append("_ncap_res.root");
  TString fullname = name + filename;

  // main
  TRefMatch *r = new TRefMatch();
  r->ExtractRef(fullname.Data(), "T_ncap");

} else { // is just filename

  // init
  TString fullname(name);

  // main
  TRefMatch *r = new TRefMatch();
  r->ExtractRef(fullname.Data(), "T_ncap");

}

/* // init */
/* TString filename(dirname); */
/* filename.ReplaceAll("/",""); */
/* filename.Append("_ncap_res.root"); */
/* TString fullname = dirname + filename; */

/* // main */
/* TRefMatch R = TRefMatch(); */
/* R.ExtractRef(fullname.Data(), "T_ncap"); */

// all pau!   )
return;
}

