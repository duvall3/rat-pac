// TRATMaterial -- Class for calculating certain properties of materials

#include "TRATMaterial.h"
/* #include "TDuvallUtils.cxx" */

//// TRATMaterial

// Call the ClassImp() macro to give the TRATMaterial class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TRATMaterial);
#endif

//______________________________________________________________________________
// default ctor
TRATMaterial::TRATMaterial()
{
  SetName("TRATMaterial");
  SetTitle("class for calculating neutron-ES MFP");
  /* Init(); */
}

//______________________________________________________________________________
// normal ctor
TRATMaterial::TRATMaterial( const char* matName, Double_t targetDensity, Double_t ES_XS_B )
{
  SetName(TString::Format("TRATMaterial for %s",matName));
  SetTitle("class for calculating neutron-ES MFP");
  /* Init(); */
  fMatName = TString(matName);
  SetTargetDensity(targetDensity);
  SetES_XS_B(ES_XS_B);
}

/* //______________________________________________________________________________ */
/* // Init */
/* void TRATMaterial::Init() */
/* { */
/*   fDensity = 1.; */
/*   fTargetDensity = 1.; */
/*   SetES_XS_B(1.); */
/* } */

/* //______________________________________________________________________________ */
/* // SomePrivateMethod */
/* void TRATMaterial::SomePrivateMethod() */
/* { */
/*   // define here */
/*   return; */
/* } */

/* //______________________________________________________________________________ */
/* // SomeCalculation */
/* Double_t TRATMaterial::SomeCalculation( Int_t someArg1 ) */
/* { */
/*   // define here */
/*   return retVal; */
/* } */

//______________________________________________________________________________
// SetES_XS_B
void TRATMaterial::SetES_XS_B(Double_t newES_XS_B)
{
  fES_XS_B = newES_XS_B;
  fES_XS_C = newES_XS_B * 1.e-24;
  return;
}

//______________________________________________________________________________
// SetES_XS_C
void TRATMaterial::SetES_XS_C(Double_t newES_XS_C)
{
  fES_XS_C = newES_XS_C;
  fES_XS_B = newES_XS_C * 1.e24;
  return;
}

//______________________________________________________________________________
// CalculateTargetDensity
Double_t TRATMaterial::CalculateTargetDensity()
{
  TString errLoc("TRATMaterial::CalculateTargetDensity");
  if (GetDensity()==0) {
    this->Error(errLoc.Data(), "Material density is missing; use SetDensity.\n");
    return 0;
  }
  if (GetAMU()==0) {
    this->Error(errLoc.Data(), "Molecular mass is missing; use SetAMU.\n");
    return 0;
  }
  Double_t numberRatio = GetPctWt() * GetAMU() / GetDensity();
  Double_t targetDensity = TMath::Na() * numberRatio;
  SetTargetDensity(targetDensity);
  return targetDensity;
}

//______________________________________________________________________________
// CheckComplete
Bool_t TRATMaterial::CheckComplete()
{
  if ( ( GetES_XS_C() != 0 ) \
    && ( GetTargetDensity() != 0 ) ) {
    SetComplete(kTRUE);
  } else {
    SetComplete(kFALSE);
  }
  return fkComplete;
}

//______________________________________________________________________________
// Evaluate
Double_t TRATMaterial::Evaluate()
{
  // calculate MFP
  Double_t mfp;
  TString errLoc("TRATMaterial::Evaluate");
  if (GetES_XS_C()==0) {
    this->Error(errLoc.Data(), "Cross-Section is missing; use SetES_XS_{B,C}.\n");
    return 0;
  }
  if (GetTargetDensity()==0) CalculateTargetDensity();
  if (GetTargetDensity()==0) {
    this->Error(errLoc.Data(), "Target density calculation failed.\n");
    return 0;
  }
  CheckComplete();
  if (fkComplete) {
    mfp = 1 / (GetTargetDensity()*GetES_XS_C());
    SetMFP(mfp);
    SetEval(kTRUE); //TEMP
  } else {
    // calculate from components
    // ...
    /* mfp = 1 / (GetTargetDensity()*GetES_XS_C()); */
    /* SetMFP(mfp); */
    return 0; //TEMP
  }
  /* SetEval(kTRUE); //TEMP DISABLE */
  return mfp;
}

////______________________________________________________________________________
//TRATMaterial::
//{
//}

////______________________________________________________________________________
//TRATMaterial::
//{
//}

//______________________________________________________________________________
// override ls
void TRATMaterial::ls()
{
  this->TObject::ls();
  printf("%s\t%f\n", fMatName.Data(), fMFP);
  return;
}

//______________________________________________________________________________
// override Print
TRATMaterial::Print()
{
  this->TObject::Print();
  printf("MatName: %s\t\tMFP: %f cm\n", fMatName.Data(), fMFP);
  return;
}


//// TRATElement

// Call the ClassImp() macro to give the TRATElement class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TRATElement);
#endif

//______________________________________________________________________________
// default ctor
TRATElement::TRATElement()
{
  SetName("TRATElement");
  SetTitle("class for calculating neutron-ES MFP");
  /* Init(); */
}

//______________________________________________________________________________
// normal ctor
TRATElement::TRATElement( const char* elName )
{
  SetName(TString::Format("TRATElement for %s",elName));
  SetTitle("class for calculating neutron-ES MFP");
  /* Init(); */
  fElName = TString(elName);
}

//______________________________________________________________________________
// FillFromRATDB
void TRATElement::FillFromRATDB( TString elName )
{
  // check for RATDB
  TString errLoc("TRATElement::FillFromRATDB");
  TMap *db = (TMap*)gDirectory->Get("db");
  if (db==0) {
    this->Error(errLoc.Data(), "RATDB (TMap *db) not found in current file.");
    return;
  }
  // prepare database search
  if (elName.Length()==0) elName = GetElName();
  if (elName.Length()==0) {
    this->Error(errLoc.Data(), "Please provide an element name.");
    return;
  }
  TString elName0( elName(0) );
  elName0.ToUpper();
  elName = TString::Format("%s%s", elName0.Data(), elName(1,elName.Length()).Data());
  TString searchStr;
  searchStr.Form("ELEMENT.%s.", elName.Data());
  // retrieve parameter list
  TList *l = TDuvallUtils::FindMatchingObjects(db, searchStr);
  if (l==0) {
    this->Error(errLoc.Data(), "Requested element not found in RATDB. Try searching the element's full name.");
    return;
  }
  // process parameter list
  TIter il(l);
  TPair *tp;
  TObjString *keyOS, *valOS;
  TString keyStr, valStr, keyMatch, valSub;
  Ssiz_t ind;
  /* vector<Int_t> isoMass; */
  /* vector<Double_t> isoAbundance; */
  TVectorD isoMass(1);
  TVectorD isoAbundance(1);
  Int_t isoCount(1);
  for ( il=l->begin(); il!=l->end(); ++il ) {
    tp = (TPair*)*il;
    /* tp->Key()->Print(); //debug */
    /* tp->Value()->Print(); //debug */
    printf("\n"); //debug
    keyOS = (TObjString*)tp->Key();
    valOS = (TObjString*)tp->Value();
    keyStr = keyOS->GetString();
    valStr = valOS->GetString();
    // atomic number
    keyMatch.Form("%s\.z", searchStr.Data());
    if (keyStr.Contains(TRegexp(keyMatch.Data()))) {
      /* cout << "Found atomic number: " << valStr.Data() << endl; //debug */
      SetAtomicNumber(valStr.Atoi());
    }
    keyMatch.Form("%s\.isotopes$", searchStr.Data());
    if (keyStr.Contains(TRegexp(keyMatch.Data()))) {
      /* cout << "Found isotopes: " << valStr.Data() << endl; //debug */
      TRegexp RE("[0-9]+");
      ind = valStr.Index(RE);
      isoCount = 0;
      ind = valStr.Index(RE,ind);
      while (ind!=-1) {
	isoCount++;
	valSub = TString(valStr(RE,ind));
	isoMass.ResizeTo(isoCount);
	isoMass[isoCount-1] = valSub.Atof();
	ind++;
	ind = valStr.Index(RE,ind);
      }
      isoMass.Print(); //debug
    }
    keyMatch.Form("%s\.isotopes_frac", searchStr.Data());
    if (keyStr.Contains(TRegexp(keyMatch.Data()))) {
      cout << "Found isotope fracs: " << valStr.Data() << endl; //debug
      TRegexp RE("[0-9]*\.[0-9]*");
      ind = valStr.Index(RE);
      isoCount = 0;
      ind = valStr.Index(RE,ind);
      while (ind!=-1) {
	isoCount++;
	valSub = TString(valStr(RE,ind));
	isoAbundance.ResizeTo(isoCount);
	isoAbundance[isoCount-1] = valSub.Atof();
	ind++;
	ind = valStr.Index(RE,ind);
      }
      isoAbundance.Print(); //debug
    }
  }
  return;
}

////______________________________________________________________________________
//TRATElement::
//{
//}

////______________________________________________________________________________
//TRATElement::
//{
//}

////______________________________________________________________________________
//TRATElement::
//{
//}

////______________________________________________________________________________
//TRATElement::
//{
//}

////______________________________________________________________________________
//TRATElement::
//{
//}


