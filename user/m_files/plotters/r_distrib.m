% r_distrib -- histogram neutron-capture displacement distances
%  -- assuming duvall3/rat-pac/user/m_files/n0_endpoints.m has just been run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


nb = round(sqrt(length(data))); % no. of bins for histogram ~ sqrt(N)
[ mu_r sigma_r ] = histfit_stat( r, nb, 0 ); % make plot
% make labels
Th = title( 'Neutron-Capture Displacements', 'interpreter', 'none' );
xlabel 'r (cm)'