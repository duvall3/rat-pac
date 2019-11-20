// logBins -- handy log-binning function for ROOT::THist courtesy of Marc Bergevin
// ~ adapted by Mark J. Duvall ~ mjduvall@hawaii.edu ~ 10/2017 ~ //

#include "logBins.h"

Double_t* logBins( const Int_t nBinsEBP, Double_t xmin, Double_t xmax ) {

Double_t logxmin = TMath::Log10(xmin);
Double_t logxmax = TMath::Log10(xmax);
Double_t binwidth = (logxmax-logxmin)/nBinsEBP;
Double_t xbinsEBP[nBinsEBP+1];
xbinsEBP[0] = xmin;
for (Int_t m=1;m<=nBinsEBP;m++) {
  xbinsEBP[m] = TMath::Power(10,logxmin+m*binwidth);
}
  
  return xbinsEBP;

}
