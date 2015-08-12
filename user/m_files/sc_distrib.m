% sc_distrib -- histogram neutron-capture number of scatters
%  -- assuming duvall3/rat-pac/user/m_files/n0_data.m has just been run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #


%nb = round(sqrt(length(data))); % no. of bins for histogram ~ sqrt(N)

% prepare histogram
sc_bins = [0:80]; % 1-us bins
h_sc_dist = hist( scatters, sc_bins );
h_adjust = min(h_sc_dist(h_sc_dist~=0)) / 10; % for correctly plotting histogram
% make plot
f_sc_dist = figure;
ax_sc_dist = axes( 'color', 'w' );
s_sc_dist = stairs( sc_bins, h_sc_dist+h_adjust, 'linewidth', 2 , 'color', 'k');
% title, labels, etc.
xlim([min(sc_bins) max(sc_bins)])
T_sc_dist = title( 'Number of Scatters', 'interpreter', 'none' );
xlabel 'scatters'
ylabel 'Events'
