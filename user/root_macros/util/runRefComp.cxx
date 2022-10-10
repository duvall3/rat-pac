// runRefComp -- wrapper macro to avoid segfaults
//   from repeated instantiations of TTestMatch objects
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 09/2022 ~ //

void runRefComp(const char* fileName) {

TRefMatch *r = new TRefMatch(fileName);
r->Run();

// all pau!   )
return;
}

