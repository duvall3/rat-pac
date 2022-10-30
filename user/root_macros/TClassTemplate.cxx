// TClassTemplate -- basic template for writing ROOT classes

#include "TClassTemplate.h"

// Call the ClassImp() macro to give the TClassTemplate class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TClassTemplate);
#endif

//______________________________________________________________________________
// default ctor
TClassTemplate::TClassTemplate()
{
  // define here
  fSomeData = 0.;
}

//______________________________________________________________________________
// normal ctor
/**
 * \param someArg1 -- e.g., a filename
 * \param someArg2 -- e.g., a track ID
 */
TClassTemplate::TClassTemplate( const char* someArg1, Double_t someArg2 )
{
  // define here
  fSomeData = 0.;
}

//______________________________________________________________________________
// SomePrivateMethod
void TClassTemplate::SomePrivateMethod()
{
  // define here
  return;
}

//______________________________________________________________________________
// SomeCalculation
Double_t TClassTemplate::SomeCalculation( Int_t someArg1 )
{
  // define here
  return retVal;
}

////______________________________________________________________________________
//TClassTemplate::
//{
//}

////______________________________________________________________________________
//TClassTemplate::
//{
//}


