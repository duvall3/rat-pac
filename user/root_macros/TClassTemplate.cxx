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
/**
 * Universal initial assignments / settings.
 */
  // define here
  fSomeData = 0.;
}

//______________________________________________________________________________
// normal ctor
/**
 * Initial assignments / settings with some parameters specified.
 * \param someArg1 -- e.g., a filename
 * \param someArg2 -- e.g., a tolerance
 */
TClassTemplate::TClassTemplate( const char* someArg1, Double_t someArg2 )
{
  // define here
  fSomeData = 0.;
}

//______________________________________________________________________________
// SomePrivateMethod
void TClassTemplate::SomePrivateMethod()
/**
 * For example, an Init() method that is called by some public method(s)
 *   but never directly invoked by the user.
 */
{
  // define here
  return;
}

//______________________________________________________________________________
// SomeCalculation
Double_t TClassTemplate::SomeCalculation( Int_t someArg1 )
/**
 * For example, a function that performs some calculation on the member data,
 *   with parameter(s) provided by the argument(s).
 * \param someArg1 -- a parameter for the calculation
 * \retval retVal -- the result of the calculation
 */
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


