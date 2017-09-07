// testMarkLib -- tests functions in MarkLib
//   -- currently, summing & suming of vectors & arrays
//   -- vector functions defined for {int,long,float,doulbe}
//   -- array functions defined for {Int_t,Long64_t,Float_t,Double_t}

#include "MarkLib.C"

using namespace MarkLib

Int_t k(0);

// definitions:

vector <int> vi;
vector <long> vl;
vector <float> vf;
vector <double> vd;

Int_t ai[10];
Long64_t al[10];
Float_t af[10];
Double_t ad[10];

// filling:
for (k=0; k<10; k++) {
  
  vi.push_back(k);
  vl.push_back(k*10);
  vf.push_back(k+0.5);
  vd.push_back(k*10+0.5);
  
  ai[k] = k;
  al[k] = 10*k;
  af[k] = k+0.5;
  ad[k] = k*10+0.5;
  
}

// test printing:

print(vi);
//print(ai);
print(vl);
//print(al);
print(vf);
//print(af);
print(vd);
//print(ad);

print(vi,3);
//print(ai,3);
print(vl,3);
//print(al,3);
print(vf,3);
//print(af,3);
print(vd,3);
//print(ad,3);

print(vi,3,7);
//print(ai,3,7);
print(vl,3,7);
//print(al,3,7);
print(vf,3,7);
//print(af,3,7);
print(vd,3,7);
//print(ad,3,7);

// test summing:

sum(vi)
//sum(ai)
sum(vl)
//sum(al)
sum(vf)
//sum(af)
sum(vd)
//sum(ad)

sum(vi,3)
//sum(ai,3)
sum(vl,3)
//sum(al,3)
sum(vf,3)
//sum(af,3)
sum(vd,3)
//sum(ad,3)

sum(vi,3,7)
//sum(ai,3,7)
sum(vl,3,7)
//sum(al,3,7)
sum(vf,3,7)
//sum(af,3,7)
sum(vd,3,7)
//sum(ad,3,7)

// all pau!   )

