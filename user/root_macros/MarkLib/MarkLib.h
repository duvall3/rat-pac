// MarkLib.h -- various handy functions for ROOT
// ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/17 ~ //


#include <vector>

namespace MarkLib {


// sum vectors & arrays

// sum entire vector or array -- MarkLib::sum(x)
int sum( vector <int> v );
long sum( vector <long> v );
float sum( vector <float> v );
double sum( vector <double> v );
Int_t sum( Int_t[] a );
Long64_t sum( Long64_t[] a );
Float_t sum( Float_t[] a );
Double_t sum( Double_t[] a );

// sum first n elements -- MarkLib::sum(x,n)
int sum( vector <int> v, int n );
long sum( vector <long> v, int n );
float sum( vector <float> v, int n );
double sum( vector <double> v, int n );
Int_t sum( Int_t[] a, Int_t n );
Long64_t sum( Long64_t[] a, Int_t n );
Float_t sum( Float_t[] a, Int_t n );
Double_t sum( Double_t[] a, Int_t n );

// sum elements n through m -- MarkLib::sum(x,n,m)
int sum( vector <int> v, int n, int m );
long sum( vector <long> v, int n, int m );
float sum( vector <float> v, int n, int m );
double sum( vector <double> v, int n, int m );
Int_t sum( Int_t[] a, Int_t n, Int_t m );
Long64_t sum( Long64_t[] a, Int_t n, Int_t m );
Float_t sum( Float_t[] a, Int_t n, Int_t m );
Double_t sum( Double_t[] a, Int_t n, Int_t m );



// print vectors & arrays

// print entire vector or array -- MarkLib::print(x)
void print( vector <int> v );
void print( vector <long> v );
void print( vector <float> v );
void print( vector <double> v );
void print( Int_t[] a );
void print( Long64_t[] a );
void print( Float_t[] a );
void print( Double_t[] a );

// print first n elements -- MarkLib::print(x,n)
void print( vector <int> v, int n );
void print( vector <long> v, int n );
void print( vector <float> v, int n );
void print( vector <double> v, int n );
void print( Int_t[] a, Int_t n );
void print( Long64_t[] a, Int_t n );
void print( Float_t[] a, Int_t n );
void print( Double_t[] a, Int_t n );

// print elements n through m -- MarkLib::print(x,n,m)
void print( vector <int> v, int n, int m );
void print( vector <long> v, int n, int m );
void print( vector <float> v, int n, int m );
void print( vector <double> v, int n, int m );
void print( Int_t[] a, Int_t n, Int_t m );
void print( Long64_t[] a, Int_t n, Int_t m );
void print( Float_t[] a, Int_t n, Int_t m );
void print( Double_t[] a, Int_t n, Int_t m );



// all pau!   )
} // namespace
