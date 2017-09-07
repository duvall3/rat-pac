% santa_cut -- additional items for preparing SANTA data (after using n0_data.m)
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %


% x_cut_min = -100;
% x_cut_max = 100;
% %y_cut_min = -1000; %NeutronDataset currently uses x=xf-x0, etc.
% %y_cut_max = -796; %NeutronDataset currently uses x=xf-x0, etc.
% y_cut_min = -100;
% y_cut_max = 100;
% %z_cut_min = 47;
% %z_cut_max = 53;
% z_cut_min = 97; %NeutronDataset currently uses x=xf-x0, etc.
% z_cut_max = 103; %NeutronDataset currently uses x=xf-x0, etc.

%cut_inds = find( x_cut_min<xf & xf<x_cut_max & y_cut_min<yf & yf<y_cut_max & z_cut_min<zf & zf<z_cut_max );
%x_cut = x(cut_inds); y_cut = y(cut_inds); z_cut = z(cut_inds);
%
%run_analysis( x_cut, y_cut, z_cut );

% nds_cut = nds_all.XCut( x_cut_min, x_cut_max );
% nds_cut = nds_cut.YCut( y_cut_min, y_cut_max );
% nds_cut = nds_cut.ZCut( z_cut_min, z_cut_max );
% 
% disp(nds_cut);

% if class(ds_all) == 'NeutronDataset'
%     ds_cut = ds_all.Cut( 'X', -100, 100 );
%     ds_cut = ds_cut.Cut( 'Y', -1000, -796 );
%     ds_cut = ds_cut.Cut( 'Z', 47, 53 );
%elseif class(ds_all) == 'IBDDataset'
    ds_cut = ds_all.CutOutsideRange( 'neutron_Xf', -100, 100 );
    ds_cut = ds_cut.CutOutsideRange( 'neutron_Yf', -1000, -796 );
    ds_cut = ds_cut.CutOutsideRange( 'neutron_Zf', 47, 53 );
    
    ds_cut = ds_cut.CutOutsideRange( 'neutron_T', 0, 10 );
%else
%end %if

disp(ds_cut)
