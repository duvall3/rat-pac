// extractTest -- wrapper macro to avoid segfaults
//   from repeated instantiations of TTestMatch objects
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

void extractTest(const char* name, Bool_t kIsDirectory = kFALSE) {

// file or directory
if (kIsDirectory) { // is directory name

  // init
  TString filename(name);
  filename.ReplaceAll("/","");
  filename.Append("_ncap_res.root");
  TString fullname = dirname + filename;

  // main
  TRefMatch *r = new TRefMatch();
  r->ExtractTest(fullname.Data(), "T_ncap");

} else { // is just filename

  // init
  TString fullname(name);

  // main
  TRefMatch *r = new TRefMatch();
  r->ExtractTest(fullname.Data(), "T_ncap");

}

// all pau!   )
return;
}

