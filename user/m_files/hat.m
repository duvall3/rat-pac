function r_hat = hat( r )
% hat -- simple function to return unit vector for a given input vector (arbitrary number of dimensions)
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %

r_hat = r / sqrt( sum(r.^2) );
