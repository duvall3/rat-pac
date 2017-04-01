// MarkLib.C -- handy functions for ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //

/// WARNING: DO NOT USE THE ARRAY FUNCTIONS IN THIS VERSION ///

#include "MarkLib.h"

namespace MarkLib {


// sum vectors & arrays

// sum entire vector or array
// vectors
int sum( vector <int> v ) {
  Int_t n = v.size();
  int _sum(0);
  for ( Int_t k=0; k<n; k++ ) _sum += v[k];
  return _sum;
}
long sum( vector <long> v ) {
  Int_t n = v.size();
  long _sum(0);
  for ( Int_t k=0; k<n; k++ ) _sum += v[k];
  return _sum;
}
float sum( vector <float> v ) {
  Int_t n = v.size();
  float _sum(0);
  for ( Int_t k=0; k<n; k++ ) _sum += v[k];
  return _sum;
}
double sum( vector <double> v ) {
  Int_t n = v.size();
  double _sum(0);
  for ( Int_t k=0; k<n; k++ ) _sum += v[k];
  return _sum;
}
//// arrays
//Int_t sum( Int_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  Int_t _sum(0);
//  for (Int_t k=0; k<n; k++) _sum += a[k];
//  return _sum;
//}
//Long64_t sum( Long64_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  Int_t _sum(0);
//  for (Int_t k=0; k<n; k++) _sum += a[k];
//  return _sum;
//}
//Float_t sum( Float_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  Int_t _sum(0);
//  for (Int_t k=0; k<n; k++) _sum += a[k];
//  return _sum;
//}
//Double_t sum( Double_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  Int_t _sum(0);
//  for (Int_t k=0; k<n; k++) _sum += a[k];
//  return _sum;
//}

// sum first n elemets
// vectors
int sum( vector <int> v, int n ) {
  int _sum(0);
  for (int k=0; k<n; k++)  _sum += v[k];
  return _sum;
}
long sum( vector <long> v, int n ) {
  long _sum(0);
  for (int k=0; k<n; k++)  _sum += v[k];
  return _sum;
}
float sum( vector <float> v, int n ) {
  float _sum(0);
  for (int k=0; k<n; k++)  _sum += v[k];
  return _sum;
}
double sum( vector <double> v, int n ) {
  double _sum(0);
  for (int k=0; k<n; k++)  _sum += v[k];
  return _sum;
}
//// arrays
//Int_t sum( Int_t[] a, Int_t n ) {
//  Int_t _sum(0);
//  for (Int_t k=0; k<n; k++ )  _sum += a[k];
//  return _sum;
//}
//Long64_t sum( Long64_t[] a, Int_t n ) {
//  Long64_t _sum(0);
//  for (Int_t k=0; k<n; k++ )  _sum += a[k];
//  return _sum;
//}
//Float_t sum( Float_t[] a, Int_t n ) {
//  Float_t _sum(0);
//  for (Int_t k=0; k<n; k++ )  _sum += a[k];
//  return _sum;
//}
//Double_t sum( Double_t[] a, Int_t n ) {
//  Double_t _sum(0);
//  for (Int_t k=0; k<n; k++ )  _sum += a[k];
//  return _sum;
//}

// sum elements n through m
// vectors
int sum( vector <int> v, int n, int m ) {
  int _sum(0);
  for (int k=(n-1); k<m; k++)  _sum += v[k];
  return _sum;
}
long sum( vector <long> v, int n, int m ) {
  long _sum(0);
  for (int k=(n-1); k<m; k++)  _sum += v[k];
  return _sum;
}
float sum( vector <float> v, int n, int m ) {
  float _sum(0);
  for (int k=(n-1); k<m; k++)  _sum += v[k];
  return _sum;
}
double sum( vector <double> v, int n, int m ) {
  double _sum(0);
  for (int k=(n-1); k<m; k++)  _sum += v[k];
  return _sum;
}
//// arrays
//Int_t sum( Int_t[] a, Int_t n, Int_t m ) {
//  Int_t _sum(0);
//  for (Int_t k=(n-1); k<m; k++)  _sum += v[k];
//  return _sum;
//}
//Long64_t sum( Long64_t[] a, Int_t n, Int_t m ) {
//  Long64_t _sum(0);
//  for (Int_t k=(n-1); k<m; k++)  _sum += v[k];
//  return _sum;
//}
//Float_t sum( Float_t[] a, Int_t n, Int_t m ) {
//  Float_t _sum(0);
//  for (Int_t k=(n-1); k<m; k++)  _sum += v[k];
//  return _sum;
//}
//Double_t sum( Double_t[] a, Int_t n, Int_t m ) {
//  Double_t _sum(0);
//  for (Int_t k=(n-1); k<m; k++)  _sum += v[k];
//  return _sum;
//}




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
//// arrays
//void print( Int_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
//}
//void print( Long64_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
//}
//void print( Float_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
//}
//void print( Double_t[] a ) {
//  Int_t n = sizeof(a) / sizeof(&a[0]);
//  for (Int_t k=0; k<n; k++) { cout << a[k] << endl; }
//}

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
//// arrays
//void print( Int_t[] a, Int_t n ) {
//  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
//}
//void print( Long64_t[] a, Int_t n ) {
//  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
//}
//void print( Float_t[] a, Int_t n ) {
//  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
//}
//void print( Double_t[] a, Int_t n ) {
//  for (Int_t k=0; k<n; k++)  cout << a[k] << endl;
//}


// elements n through m
// vectors
void print( vector <int> v, int n, int m ) {
  for (Int_t k=(n-1); k<m; k++) { cout << v[k] << endl; }
}
void print( vector <long> v, int n, int m ) {
  for (Int_t k=(n-1); k<m; k++) { cout << v[k] << endl; }
}
void print( vector <float> v, int n, int m ) {
  for (Int_t k=(n-1); k<m; k++) { cout << v[k] << endl; }
}
void print( vector <double> v, int n, int m ) {
  for (Int_t k=(n-1); k<m; k++) { cout << v[k] << endl; }
}
//// arrays
//void print( Int_t[] a, Int_t n, Int_t m ) {
//  for (Int_t k=(n-1); k<m; k++)  cout << a[k] << endl;
//}
//void print( Long64_t[] a, Int_t n, Int_t m ) {
//  for (Int_t k=(n-1); k<m; k++)  cout << a[k] << endl;
//}
//void print( Float_t[] a, Int_t n, Int_t m ) {
//  for (Int_t k=(n-1); k<m; k++)  cout << a[k] << endl;
//}
//void print( Double_t[] a, Int_t n, Int_t m ) {
//  for (Int_t k=(n-1); k<m; k++)  cout << a[k] << endl;
//}




// all pau!   )
} //namespace
