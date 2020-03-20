// aTanFull.cxx -- arctangent(opp/adj) that tests inputs & adjusts for quadrant to return answer in [-180 +180]
// Mark J. Duvall ~ mjduvall@hawaii.edu ~ 3/2020 ~ //
// opp = "opposite" (perpendicular); adj = "adjacent" (parallel)

double aTanFull( double opp, double adj ) {

Double_t phi;

if ( adj >= 0 ) {
  phi = TMath::ATan( opp / adj );
} else {
  if ( opp >= 0 ) {
    phi = TMath::ATan( opp / adj ) + TMath::Pi();
  } else {
    phi = TMath::ATan( opp / adj ) - TMath::Pi();
  }
}

// all pau!
return phi;
}
