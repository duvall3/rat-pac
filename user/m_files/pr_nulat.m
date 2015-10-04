% pr_nulat -- apply realistic position resolution to NuLat (i.e., voxelization)
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %


%% voxelization

% position of mother volume (i.e., 'cube_array')
x_offset = 0;
y_offset = -992.4;
z_offset = 0;

% offset of cube centers
cube_offsets = [-5.1 0 5.1];

% cube size
cube_size = 5;

% cube positions
cell_centers = zeros(3,3);
cell_centers(:,1) = x_offset + cube_offsets;
cell_centers(:,2) = y_offset + cube_offsets;
cell_centers(:,3) = z_offset + cube_offsets;

% apply voxelization
ds_pr = ds_cut;
ds_pr.neutron_X0 = ds_pr.FSpread( ds_pr.neutron_X0, cell_centers(:,1), cube_size );
ds_pr.neutron_Y0 = ds_pr.FSpread( ds_pr.neutron_Y0, cell_centers(:,2), cube_size );
ds_pr.neutron_Z0 = ds_pr.FSpread( ds_pr.neutron_Z0, cell_centers(:,3), cube_size );
ds_pr.neutron_Xf = ds_pr.FSpread( ds_pr.neutron_Xf, cell_centers(:,1), cube_size );
ds_pr.neutron_Yf = ds_pr.FSpread( ds_pr.neutron_Yf, cell_centers(:,2), cube_size );
ds_pr.neutron_Zf = ds_pr.FSpread( ds_pr.neutron_Zf, cell_centers(:,3), cube_size );


%% cut same-cell events
ds_pr2 = ds_pr;
%ds_pr2 = ds_pr2.Cut( 'neutron_X', 
