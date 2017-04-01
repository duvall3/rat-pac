// MarkLib.C -- handy functions for ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //


#include "MarkLib.h"

namespace MarkLib {


// sum vectors & arrays

// sum entire vector or array
// vectors
int sum( vector <int> v ) {
  Int_t n = v.size();
  int sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
long sum( vector <long> v ) {
  Int_t n = v.size();
  long sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
float sum( vector <float> v ) {
  Int_t n = v.size();
  float sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
double sum( vector <double> v ) {
  Int_t n = v.size();
  double sum(0);
  for ( Int_t k=0; k<n; k++ ) sum += v[k];
  return sum;
}
// arrays
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

// sum first n elemets
// vectors
int sum( vector <int> v, int n ) {
  int k;
  int sum(0);
  for (k=0; k<n; k++)  sum += v[k];
  return sum;
}
long sum( vector <long> v, int n ) {
  int k;
  long sum(0);
  for (k=0; k<n; k++)  sum += v[k];
  return sum;
}
float sum( vector <float> v, int n ) {
  int k;
  float sum(0);
  for (k=0; k<n; k++)  sum += v[k];
  return sum;
}
double sum( vector <double> v, int n ) {
  int k;
  double sum(0);
  for (k=0; k<n; k++)  sum += v[k];
  return sum;
}
// arrays
Int_t sum( Int_t[] a, Int_t n ); {
  Int_t sum(0);
  for (Int_t k=0; k<n; k++ )  sum += a[k];
  return sum;
}
Long64_t sum( Long64_t[] a, Int_t n ); {
  Long64_t sum(0);
  for (Int_t k=0; k<n; k++ )  sum += a[k];
  return sum;
}
Float sum( Float_t[] a, Int_t n ); {
  Float_t sum(0);
  for (Int_t k=0; k<n; k++ )  sum += a[k];
  return sum;
}
Double_t sum( Double_t[] a, Int_t n ); {
  Double_t sum(0);
  for (Int_t k=0; k<n; k++ )  sum += a[k];
  return sum;
}

// sum elements n through m
// vectors
int sum( vector <int> v, int n, int m ) {
  int sum(0);
  for (int k=n; k<=m; k++)  sum += v[k];
  return sum;
}
long sum( vector <long> v, int n, int m ) {
  long sum(0);
  for (int k=n; k<=m; k++)  sum += v[k];
  return sum;
}
float sum( vector <float> v, int n, int m ) {
  float sum(0);
  for (int k=n; k<=m; k++)  sum += v[k];
  return sum;
}
double sum( vector <double> v, int n, int m ) {
  double sum(0);
  for (int k=n; k<=m; k++)  sum += v[k];
  return sum;
}
// arrays
Int_t sum( Int_t[] a, Int_t n, Int_t m ) {
  Int_t sum(0);
  for (Int_t k=n; k<=m; k++)  sum += v[k];
  return sum;
}
Long64_t sum( Long64_t[] a, Int_t n, Int_t m ) {
  Long64_t sum(0);
  for (Int_t k=n; k<=m; k++)  sum += v[k];
  return sum;
}
Float_t sum( Float_t[] a, Int_t n, Int_t m ) {
  Float_t sum(0);
  for (Int_t k=n; k<=m; k++)  sum += v[k];
  return sum;
}
Double_t sum( Double_t[] a, Int_t n, Int_t m ) {
  Double_t sum(0);
  for (Int_t k=n; k<=m; k++)  sum += v[k];
  return sum;
}




// print vectors & arrays

// entire vector or array
// vectors
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
// arrays
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
// vectors
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
// arrays
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
// vectors
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
// arrays
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
