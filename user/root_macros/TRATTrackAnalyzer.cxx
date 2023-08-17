// TRATTrackAnalyzer -- Class for processing data from RAT-PAC particle tracks

#include "TRATTrackAnalyzer.h"

// Call the ClassImp() macro to give the TRATTrackAnalyzer class RTTI and full I/O capabilities
#if !defined(__CLING__)
  ClassImp(TRATTrackAnalyzer);
#endif

////______________________________________________________________________________
//// default ctor
//TRATTrackAnalyzer::TRATTrackAnalyzer()
//{
///**
// * Universal initial assignments / settings.
// */
//  SetName("TRATTrackAnalyzer");
//  SetTitle("Class for processing data from RAT-PAC particle tracks");
//}

//______________________________________________________________________________
// normal ctor
/**
 * Create object and initialize items needed for parsing the track records
 * \param filename -- name of RAT file
 */
TRATTrackAnalyzer::TRATTrackAnalyzer( const char* filename )
{
  SetName("TRATTrackAnalyzer");
  SetTitle(TString::Format("for %s", filename));
  fFileName = TString(filename);
  RAT::DSReader R(filename);
  fDSReaderObject = &R;
  fDS = R.GetEvent(0);
  /* fMC = fDS->GetMC(); */
  RAT::TrackNav Nav(fDS);
  /* fTrackNavObject = &Nav; */
  /* fCursor = Nav.Cursor(kFALSE); */
  RAT::TrackCursor C = Nav.Cursor(kTRUE);
  fCursor = &C;
  fNode = fCursor->Here();
}

////______________________________________________________________________________
// // SomePrivateMethod
// void TRATTrackAnalyzer::SomePrivateMethod()
// /**
//  * For example, an Init() method that is called by some public method(s)
//  *   but never directly invoked by the user.
//  */
// {
//   // define here
//   return;
// }

// //______________________________________________________________________________
// // SomeCalculation
// Double_t TRATTrackAnalyzer::SomeCalculation( Int_t someArg1 )
// /**
//  * For example, a function that performs some calculation on the member data,
//  *   with parameter(s) provided by the argument(s).
//  * \param someArg1 -- a parameter for the calculation
//  * \retval retVal -- the result of the calculation
//  */
// {
//   // define here
//   return retVal;
// }

//______________________________________________________________________________
// override Print
void TRATTrackAnalyzer::Print()
{
  printf( "%s\n", GetName() );
  printf( "%s\n", GetTitle() );
  printf( "DSReader | Total Events\t\t\t0x%x | %d\n", GetDSReader(), GetDSReader()->GetTotal() );
  printf( "DS\t\t\t0x%x\n", GetDS() );
  printf( "Cursor\t\t\t0x%x\n", GetCursor() );
  printf( "Node\t\t\t0x%x\n", GetNode() );
}

////______________________________________________________________________________
//TRATTrackAnalyzer::
//{
//}

////______________________________________________________________________________
//TRATTrackAnalyzer::
//{
//}

