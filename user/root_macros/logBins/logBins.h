// logBins -- handy log-binning function for ROOT::THist courtesy of Marc Bergevin
// ~ adapted by Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //

#include <math.h>

Double_t* logBins( const Int_t nBinsEBP, Double_t xmin, Double_t xmax );
// returns nBinsEBP log-scaled bins between xmin and xmax
//
// example usage:
// Double_t xbins[100];
// xbins = logBins(100, 10.e-3, 10.e-7);
// TH1D* h1 = new TH1D("h1", "Log-binned Histogram", 100, xbins);
