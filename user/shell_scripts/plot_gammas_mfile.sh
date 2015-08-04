#!/bin/bash
# plot_gammas_mfile -- generate m-file for making preparing agent-specific plots of gamma multiplicities & energy totals
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #

for agent_file in ./gam/*; do
  
  agent=$(basename $file .gam)
  
  echo "\
    \
    % read in data
    data = dlmread( \'$agent_file\', \'\', 0, 1 );
    
    % create lists from \"data\"
    g_mult_$agent = data(:,1);   % can remove individual labels (& overwrite each time) if RAM becomes an issue
    g_ke_$agent = data(:,2);  % can remove individual labels (& overwrite each time) if RAM becomes an issue
%   clear data
    
    % MULTIPLICITIES
    mults = [0:15]; % vector of bins
    hist_g_mult_$agent = [ g_mult_$agent, mults ];
    f_mult_$agent = figure('position', [1000 100 1.5*[560 420]]);
    
    
    
    
  " > ./gam/plot_gammas.m
