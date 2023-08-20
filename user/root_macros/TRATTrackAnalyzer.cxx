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
  SetParticleSelectionMode(0);
  SetStepSelectionMode(0);
  SetVerbose(kFALSE);
  /* SetVerbose(kTRUE); //debug */
  //RAT::DSReader R(filename);
  //fDSReaderObject = &R;
  //SetTotalEvents(R.GetTotal());
  //fDS = R.GetEvent(0);
  //fMC = fDS->GetMC();
  //RAT::TrackNav Nav(fDS);
  //RAT::DS::Root *ds = R.GetEvent(0);
  //RAT::TrackNav Nav(ds);
  //fTrackNavObject = &Nav;
  //RAT::TrackCursor C = Nav.Cursor(IsVerbose());
  //fCursor = &C;
  //fNode = fCursor->Here();
  fTree = new TTree("T_ta", "Track-analysis results tree");
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
// Analyze
void TRATTrackAnalyzer::Analyze()
{

  printf("Beginning analysis...\n");

  // init
  RAT::DSReader R(GetFileName().Data());
  fDSReaderObject = &R;
  SetTotalEvents(R.GetTotal());
  Long64_t event, N(GetTotalEvents());
  RAT::DS::Root *ds = R.GetEvent(0);
  RAT::TrackNav Nav(ds);
  RAT::TrackCursor C = Nav.Cursor(IsVerbose());
  RAT::TrackNode *n = C.Here();
  Nav.Clear();
  Int_t psm = (Int_t)GetParticleSelectionMode();
  TVector3 r0, r1, dr;
  Double_t qty;
  /* GetTree()->Branch("qty", &qty); */
  /* TBranch *qty_br = GetTree()->Branch("qty", &qty); */
  T_ta->Branch("qty", &qty);

  // MAIN

  // loop over MC events
  for ( event=0; event<N; event++ ) {
    ds = R.GetEvent(event);
    RAT::TrackNav Nav(ds);
    /* Nav = RAT::TrackNav(ds); */
    C = Nav.Cursor(IsVerbose());
    n = C.Here();

    // IBD e+ or n
    if ( psm < 2 ) {
      /* printf("IBD mode\n"); */
      n = C.GoChild(psm);
      // test: displacement
      r0 = n->GetEndpoint();
      n = C.GoTrackEnd();
      r1 = n->GetEndpoint();
      dr = r1 - r0;
      qty = dr.Mag();
      T_ta->Fill();

    // Particle-name search
    } else if ( psm == 2 ) {
      /* printf("Name-search mode\n"); */
      // particle-search loop (w/in this top-level MC event)
      while ( n = C.FindNextParticle(GetParticleName().Data()) ) {
	/* cout << n->GetParticleName() << endl; */
	// test: displacement
	r0 = n->GetEndpoint();
	n = C.GoTrackEnd();
	r1 = n->GetEndpoint();
	dr = r1 - r0;
	qty = dr.Mag();
	T_ta->Fill();
      }

    // other
    } else {
      this->Error("TRATTrackAnalyzer::Analyze", "ParticleSelectionMode not recognzied.\n");
      /* return; */
    }

    Nav.Clear();

  }

  // all pau!   )
  printf("Done!\n");
  T_ta->Draw("qty");
  return;
}

//______________________________________________________________________________
// Save
void TRATTrackAnalyzer::Save()
{
  return;
}

//______________________________________________________________________________
// Run
void TRATTrackAnalyzer::Run()
{
  Analyze();
  Save();
  return;
}

////______________________________________________________________________________
//TRATTrackAnalyzer::
//{
//}

////______________________________________________________________________________
//TRATTrackAnalyzer::
//{
//}

//______________________________________________________________________________
// override Print
void TRATTrackAnalyzer::Print()
{
  printf( "%s %s\n", GetName(), GetTitle() );
  printf( "Particle-selection mode: \t%d\n", GetParticleSelectionMode() );
  printf( "Step-selection mode: \t\t%d\n", GetStepSelectionMode() );
  printf( "Verbose: \t\t\t%d\n", IsVerbose() );
  printf( "Particle-search name: %\ts\n", GetParticleName().Data() );
  printf( "DSReader | Total Events\t\t0x%x | %d\n", GetDSReader(), GetDSReader()->GetTotal() );
  /* printf( "DS\t\t\t\t0x%x\n", GetDS() ); */
  /* printf( "Cursor\t\t\t\t0x%x\n", GetCursor() ); */
  /* printf( "Node\t\t\t\t0x%x\n", GetNode() ); */
}

