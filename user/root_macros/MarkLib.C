// MarkLib.C -- handy functions
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //


#include <vector>

namespace MarkLib {


// sum vectors
int Sum( vector <int> v ) {
  Int_t n = v.size();
  Int_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
long Sum( vector <long> v ) {
  Int_t n = v.size();
  Long64_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
float Sum( vector <float> v ) {
  Int_t n = v.size();
  Float_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
double Sum( vector <double> v ) {
  Int_t n = v.size();
  Double_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}



} //namespace
