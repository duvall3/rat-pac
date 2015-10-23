% chooz_an -- simple script to analyze monolithic IBD run
% Mark J. Duvall ~ mjduvall@hawaii.edu ~ October 2015 ~ %


ds_all = ibd_data( data );

% cut events above or below target volume (Y)
ds_cut = ds_all.CutOutsideRange( 'neutron_Yf', -995.0, -895.0 );

% cut events outside r <= 50 cm (r=x^2+z^2)
inds_all = 1:ds_cut.N;
inds = find( ds_cut.neutron_Xf.^2 + ds_cut.neutron_Zf.^2 <= 50.0^2 );
ds_cut = IBDDataset( ds_cut.Event(inds), ds_cut.positron_KE0(inds), ds_cut.positron_X0(inds), ds_cut.positron_Y0(inds), ds_cut.positron_Z0(inds), ds_cut.positron_X1(inds), ds_cut.positron_Y1(inds), ds_cut.positron_Z1(inds), ds_cut.positron_Xf(inds), ds_cut.positron_Yf(inds), ds_cut.positron_Zf(inds), ds_cut.positron_T(inds), ds_cut.positron_Gammas(inds), ds_cut.positron_Gamma_Energies(inds), ds_cut.neutron_KE0(inds), ds_cut.neutron_X0(inds), ds_cut.neutron_Y0(inds), ds_cut.neutron_Z0(inds), ds_cut.neutron_X1(inds), ds_cut.neutron_Y1(inds), ds_cut.neutron_Z1(inds), ds_cut.neutron_Xf(inds), ds_cut.neutron_Yf(inds), ds_cut.neutron_Zf(inds), ds_cut.neutron_Scatters(inds), ds_cut.neutron_T(inds), ds_cut.neutron_Gammas(inds), ds_cut.neutron_Gamma_Energies(inds), ds_cut.neutron_Alphas(inds), ds_cut.neutron_Alpha_Energies(inds) );


% apply position resolution sigma = 15 cm to all {x,y,z}{i,f}
ds_pr = ds_cut;
sigmas_raw = [ std(ds_pr.neutron_X0) std(ds_pr.neutron_Y0) std(ds_pr.neutron_Z0) std(ds_pr.neutron_Xf) std(ds_pr.neutron_Yf) std(ds_pr.neutron_Zf) ];
sigmas_adjustment = sqrt( 15^2 - sigmas_raw.^2 );
ds_pr.neutron_X0 = ds_cut.GSpread( ds_cut.neutron_X0, sigmas_adjustment(1), -50, 50 );
ds_pr.neutron_Y0 = ds_cut.GSpread( ds_cut.neutron_Y0, sigmas_adjustment(2), -995.0, -895.0 );
ds_pr.neutron_Z0 = ds_cut.GSpread( ds_cut.neutron_Z0, sigmas_adjustment(3), -50, 50 );
ds_pr.neutron_Xf = ds_cut.GSpread( ds_cut.neutron_Xf, sigmas_adjustment(4), -50, 50 );
ds_pr.neutron_Yf = ds_cut.GSpread( ds_cut.neutron_Yf, sigmas_adjustment(5), -995.0, -895.0 );
ds_pr.neutron_Zf = ds_cut.GSpread( ds_cut.neutron_Zf, sigmas_adjustment(6), -50, 50 );

disp( ds_pr )

