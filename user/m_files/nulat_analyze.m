% nulat_analyze -- short master script to analyze a NuLat run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %

% first, manually run:   data = dlmread( '<filename>.txt', '', 1, 0 );

ds_all = ibd_data( data );
nulat_cut;
pr_nulat;

% remove y==0 events for phi calculation
inds_to_cut = find( ds_pr.neutron_X==0 & ds_pr.neutron_Z==0 );
inds = 1:ds_pr.N;
inds(inds_to_cut) = [];
ds_pr_nopolar = IBDDataset( ds_pr.Event(inds), ds_pr.positron_KE0(inds), ds_pr.positron_X0(inds), ds_pr.positron_Y0(inds), ds_pr.positron_Z0(inds), ds_pr.positron_X1(inds), ds_pr.positron_Y1(inds), ds_pr.positron_Z1(inds), ds_pr.positron_Xf(inds), ds_pr.positron_Yf(inds), ds_pr.positron_Zf(inds), ds_pr.positron_T(inds), ds_pr.positron_Gammas(inds), ds_pr.positron_Gamma_Energies(inds), ds_pr.neutron_KE0(inds), ds_pr.neutron_X0(inds), ds_pr.neutron_Y0(inds), ds_pr.neutron_Z0(inds), ds_pr.neutron_X1(inds), ds_pr.neutron_Y1(inds), ds_pr.neutron_Z1(inds), ds_pr.neutron_Xf(inds), ds_pr.neutron_Yf(inds), ds_pr.neutron_Zf(inds), ds_pr.neutron_Scatters(inds), ds_pr.neutron_T(inds), ds_pr.neutron_Gammas(inds), ds_pr.neutron_Gamma_Energies(inds), ds_pr.neutron_Alphas(inds), ds_pr.neutron_Alpha_Energies(inds) );