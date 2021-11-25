// toggleInertVisAddGeo -- helper macro (function definition) for addGeoSANDD.cxx
// -- toggle whether inert cells are drawn in the viewer
// -- user can provide the number of checkerboarding dimensions:
//      kDims=2 or kDims=3

void toggleInertVisAddGeo( const TList *volNodes, const Int_t kDims = 3 ) {

// init
TRegexp tcr = "target_cell_.*_.*";
TIter i(volNodes);
TNode *v;
TString vName;
TObjArray *vNameTOA;
TObjString *vTOS;
Int_t R, C, L;
Bool_t chkTest(kFALSE);

// MAIN
for ( i=volNodes->begin(); i!=volNodes->end(); ++i ) {
  v = (TNode*)*i;
  vName = v->GetName();
  if (vName.Contains(tcr)) {
    // extract row, column, and layer
    vNameTOA = vName.Tokenize('_');
    vTOS = (TObjString*)vNameTOA->At(2);
    R = vTOS->GetString().Atoi();
    vTOS = (TObjString*)vNameTOA->At(3);
    C = vTOS->GetString().Atoi();
    vTOS = (TObjString*)vNameTOA->At(4);
    L = vTOS->GetString().Atoi();
    // perform checkerboarding test
    if (kDims==2) {
      chkTest = ( R%2 == C%2 );
    } else if (kDims==3) {
      chkTest = ( (R%2==C%2) && (C%2==L%2) );
    } else {
      gPad->Error("toggleInertVisAddGeo.cxx", "Invalid checkerboarding dimension");
//    return;
    } // end if -- kDims
    // switch visibility for *inert* cells
    if (! chkTest) {
      if (v->GetLineColor() == kGray) {
        v->SetLineColor(kWhite);
      } else if (v->GetLineColor() == kWhite) {
        v->SetLineColor(kGray);
      }
    }
  } // end if -- target-cell regex
} // end volume-list loop

} // end function

