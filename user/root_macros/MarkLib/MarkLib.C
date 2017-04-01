// MarkLib.C -- handy functions for ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //


#include "MarkLib.h"

namespace MarkLib {


// sum vectors
int sum( vector <int> v ) {
  Int_t n = v.size();
  Int_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
long sum( vector <long> v ) {
  Int_t n = v.size();
  Long64_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
float sum( vector <float> v ) {
  Int_t n = v.size();
  Float_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
double sum( vector <double> v ) {
  Int_t n = v.size();
  Double_t sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}

// sum arrays
Int_t sum( Int_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  Int_t sum(0);
  for (Int_t k=0; k<n; k++) sum += a[k];
  return sum;
}
Long64_t sum( Long64_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  Int_t sum(0);
  for (Int_t k=0; k<n; k++) sum += a[k];
  return sum;
}
Float_t sum( Float_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  Int_t sum(0);
  for (Int_t k=0; k<n; k++) sum += a[k];
  return sum;
}
Double_t sum( Double_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  Int_t sum(0);
  for (Int_t k=0; k<n; k++) sum += a[k];
  return sum;
}



// print vectors
// entire vector
void print( vector <int> v ) {
  Int_t n = v.size();
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
void print( vector <long> v ) {
  Int_t n = v.size();
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
void print( vector <float> v ) {
  Int_t n = v.size();
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
void print( vector <double> v ) {
  Int_t n = v.size();
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
// first n elements
void print( vector <int> v, int n ) {
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
void print( vector <long> v, int n ) {
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
void print( vector <float> v, int n ) {
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
void print( vector <double> v, int n ) {
  for (Int_t k=0; k<n; k++) { cout << v[k] << endl; }
}
// elements n through m
void print( vector <int> v, int n, int m ) {
  for (Int_t k=n; k<=m; k++) { cout << v[k] << endl; }
}
void print( vector <long> v, int n, int m ) {
  for (Int_t k=n; k<=m; k++) { cout << v[k] << endl; }
}
void print( vector <float> v, int n, int m ) {
  for (Int_t k=n; k<=m; k++) { cout << v[k] << endl; }
}
void print( vector <double> v, int n, int m ) {
  for (Int_t k=n; k<=m; k++) { cout << v[k] << endl; }
}


// print arrays
// entire array
void print( Int_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
}
void print( Long64_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
}
void print( Float_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
}
void print( Double_t[] a ) {
  Int_t n = sizeof(a) / sizeof(&a[0]);
  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
}
// first n elements
void print( Int_t[] a, Int_t n ) {
  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
}
void print( Long64_t[] a, Float_t n ) {
  for (Int_t k=0; k<(Int_t)n; k++)  cout << a[k] << endl;
}
void print( Float_t[] a, Int_t n ) {
  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
}
void print( Double_t[] a, Int_t n ) {
  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
}
// elements n through m
void print( Int_t[] a, Int_t n, Int_t m ) {
  for (Int_t k=n; k<=m; k++)  cout << a[k] << endl;
}
void print( Long64_t[] a, Int_t n, Int_t m ) {
  for (Int_t k=n; k<=m; k++)  cout << a[k] << endl;
}
void print( Float_t[] a, Int_t n, Int_t m ) {
  for (Int_t k=n; k<=m; k++)  cout << a[k] << endl;
}
void print( Double_t[] a, Int_t n, Int_t m ) {
  for (Int_t k=n; k<=m; k++)  cout << a[k] << endl;
}




// all pau!   )
} //namespace
