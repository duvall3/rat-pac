// TMFPMaterial -- Class for calculating certain properties of materials

#include "TMFPMaterial.h"

// Call the ClassImp() macro to give the TMFPMaterial class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TMFPMaterial);
#endif

//______________________________________________________________________________
// default ctor
TMFPMaterial::TMFPMaterial()
{
  // define here
  SetName("TMFPMaterial");
  SetTitle("class for calculating neutron-ES MFP");
  /* Init(); */
}

//______________________________________________________________________________
// normal ctor
TMFPMaterial::TMFPMaterial( const char* matName, Double_t targetDensity, Double_t ES_XS_B )
{
  // define here
  SetName(TString::Format("TMFPMaterial for %s",matName));
  SetTitle("class for calculating neutron-ES MFP");
  /* Init(); */
  fMatName = TString(matName);
  SetTargetDensity(targetDensity);
  SetES_XS_B(ES_XS_B);
}

/* //______________________________________________________________________________ */
/* // Init */
/* void TMFPMaterial::Init() */
/* { */
/*   fDensity = 1.; */
/*   fTargetDensity = 1.; */
/*   SetES_XS_B(1.); */
/* } */

/* //______________________________________________________________________________ */
/* // SomePrivateMethod */
/* void TMFPMaterial::SomePrivateMethod() */
/* { */
/*   // define here */
/*   return; */
/* } */

/* //______________________________________________________________________________ */
/* // SomeCalculation */
/* Double_t TMFPMaterial::SomeCalculation( Int_t someArg1 ) */
/* { */
/*   // define here */
/*   return retVal; */
/* } */

//______________________________________________________________________________
// SetES_XS_B
void TMFPMaterial::SetES_XS_B(Double_t newES_XS_B)
{
  fES_XS_B = newES_XS_B;
  fES_XS_C = newES_XS_B * 1.e-24;
  return;
}

//______________________________________________________________________________
// SetES_XS_C
void TMFPMaterial::SetES_XS_C(Double_t newES_XS_C)
{
  fES_XS_C = newES_XS_C;
  fES_XS_B = newES_XS_C * 1.e24;
  return;
}

//______________________________________________________________________________
// CalculateTargetDensity
Double_t TMFPMaterial::CalculateTargetDensity()
{
  TString errLoc("TMFPMaterial::CalculateTargetDensity");
  if (GetDensity()==0) {
    this->Error(errLoc.Data(), "Material density is missing; use SetDensity.\n");
    return 0;
  }
  if (GetAMU()==0) {
    this->Error(errLoc.Data(), "Molecular mass is missing; use SetAMU.\n");
    return 0;
  }
  /* Double_t targetDensity = GetPctWt() * GetDensity() / GetAMU(); */
  /* Double_t targetDensity = TMath::Na() * GetDensity() / GetAMU(); */
  Double_t numberRatio = GetAMU() / GetDensity();
  Double_t targetDensity = TMath::Na() * numberRatio;
  SetTargetDensity(targetDensity);
  return targetDensity;
}

//______________________________________________________________________________
// CheckComplete
Bool_t TMFPMaterial::CheckComplete()
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
Double_t TMFPMaterial::Evaluate()
{
  // calculate MFP
  Double_t mfp;
  TString errLoc("TMFPMaterial::Evaluate");
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
//TMFPMaterial::
//{
//}

////______________________________________________________________________________
//TMFPMaterial::
//{
//}

//______________________________________________________________________________
// override ls
void TMFPMaterial::ls()
{
  this->TObject::ls();
  printf("%s\t%f\n", fMatName.Data(), fMFP);
  return;
}

//______________________________________________________________________________
// override Print
TMFPMaterial::Print()
{
  this->TObject::Print();
  printf("MatName: %s\t\tMFP: %f cm\n", fMatName.Data(), fMFP);
  return;
}


