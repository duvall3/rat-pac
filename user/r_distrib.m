% r_distrib -- histogram neutron-capture displacement distances, !!assuming endpoints.sh has just been run!!

nb = round(sqrt(length(data))); % no. of bins for histogram ~ sqrt(N)
[ mu_r sigma_r ] = histfit_stat( r, nb, 0 ); % make plot
% make labels
Th = title( 'Neutron-Capture Displacements', 'interpreter', 'none' );
xlabel 'r (cm)'
