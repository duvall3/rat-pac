% pr_nulat -- apply realistic position resolution to NuLat (i.e., voxelization)
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %


%% voxelization

% temporarily disabled due to computer rounding errors somewhere in going from RP to ML
% % position of mother volume (i.e., 'cube_array')
% x_offset = 0;
% y_offset = -992.4;
% z_offset = 0;

% offset of cube centers
cube_offsets = [-5.1 0 5.1];

% cube size
cube_size = 5;

% cube positions
cell_centers = zeros(3,3);
cell_centers(:,1) = x_offset;% + cube_offsets;
cell_centers(:,2) = y_offset;% + cube_offsets;
cell_centers(:,3) = z_offset;% + cube_offsets;

% apply voxelization
ds_pr = ds_cut;
ds_pr.neutron_X0 = ds_pr.FSpread( ds_pr.neutron_X0, cell_centers(:,1), cube_size );
ds_pr.neutron_Y0 = ds_pr.FSpread( ds_pr.neutron_Y0, cell_centers(:,2), cube_size );
ds_pr.neutron_Z0 = ds_pr.FSpread( ds_pr.neutron_Z0, cell_centers(:,3), cube_size );
ds_pr.neutron_Xf = ds_pr.FSpread( ds_pr.neutron_Xf, cell_centers(:,1), cube_size );
ds_pr.neutron_Yf = ds_pr.FSpread( ds_pr.neutron_Yf, cell_centers(:,2), cube_size );
ds_pr.neutron_Zf = ds_pr.FSpread( ds_pr.neutron_Zf, cell_centers(:,3), cube_size );


%% cut same-cell events
inds_to_cut = find( ds_pr.neutron_X==0 & ds_pr.neutron_Y==0 & ds_pr.neutron_Z==0 );
inds = 1:ds_pr.N;
inds(inds_to_cut) = [];
ds_pr = IBDDataset( ds_pr.Event(inds), ds_pr.positron_KE0(inds), ds_pr.positron_X0(inds), ds_pr.positron_Y0(inds), ds_pr.positron_Z0(inds), ds_pr.positron_X1(inds), ds_pr.positron_Y1(inds), ds_pr.positron_Z1(inds), ds_pr.positron_Xf(inds), ds_pr.positron_Yf(inds), ds_pr.positron_Zf(inds), ds_pr.positron_T(inds), ds_pr.positron_Gammas(inds), ds_pr.positron_Gamma_Energies(inds), ds_pr.neutron_KE0(inds), ds_pr.neutron_X0(inds), ds_pr.neutron_Y0(inds), ds_pr.neutron_Z0(inds), ds_pr.neutron_X1(inds), ds_pr.neutron_Y1(inds), ds_pr.neutron_Z1(inds), ds_pr.neutron_Xf(inds), ds_pr.neutron_Yf(inds), ds_pr.neutron_Zf(inds), ds_pr.neutron_Scatters(inds), ds_pr.neutron_T(inds), ds_pr.neutron_Gammas(inds), ds_pr.neutron_Gamma_Energies(inds), ds_pr.neutron_Alphas(inds), ds_pr.neutron_Alpha_Energies(inds) );

