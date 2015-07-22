% t_distrib -- histogram neutron-capture displacement times, !!assuming endpoints.sh has just been run!!
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


nb = round(sqrt(length(data))); % no. of bins for histogram ~ sqrt(N)
[ mu_t sigma_t ] = histfit_stat( t, nb, 0 ); % make plot
% make labels
Th = title( 'Neutron-Capture Times', 'interpreter', 'none' );
xlabel 't (us)'
