% t_distrib -- histogram neutron-capture displacement times,
%  -- assuming duvall3/rat-pac/user/m_files/n0_endpoints.m has just been run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


%nb = round(sqrt(length(data))); % no. of bins for histogram ~ sqrt(N)
%[ mu_t sigma_t ] = histfit_stat( t, nb, 0 ); % make plot

% prepare histogram
t_bins = [0:1:160]; % 1-us bins
%t_adjust = abs( t_bins(2)-t_bins(1) ) / 2; % for correctly plotting histogram
h_t_dist = hist( t, t_bins );
h_adjust = min(h_t_dist(h_t_dist~=0)) / 10; % for correctly plotting histogram
% make plot
f_t_dist = figure;
ax_t_dist = axes( 'color', .8*[1 1 1] );
s_t_dist = stairs( t_bins, h_t_dist+h_adjust, 'linewidth', 2 , 'color', 'k');
% title, labels, etc.
set(ax_t_dist, 'yscale', 'log')
xlim([min(t_bins) max(t_bins)])
T_t_dist = title( 'Neutron-Capture Times', 'interpreter', 'none' );
xlabel 't (us)'
ylabel 'Events'
