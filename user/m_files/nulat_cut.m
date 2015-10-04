% nulat_cut -- additional items for preparing NuLat data
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ October 2015 ~ %


ds_cut = ds_all.Cut( 'neutron_Xf', -7.6, 7.6 );
ds_cut = ds_cut.Cut( 'neutron_Yf', -1000, -984.8);
ds_cut = ds_cut.Cut( 'neutron_Zf', -7.6, 7.6 );

disp(ds_cut)
