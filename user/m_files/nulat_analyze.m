% nulat_analyze -- short master script to analyze a NuLat run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %

% first, manually run:   data = dlmread( '<filename>.txt', '', 1, 0 );

ds_all = ibd_data( data );
nulat_cut;
pr_nulat;

