% ibd_data -- read in positions & generate vectors for delta_{x,y,z,r} from IBD text table
%  -- intended for use with the output from duvall3/rat-pac/user/shell_scripts/ibd_dat_to_txt.sh,
%        in which case you should read in the data with this command:  data = dlmread( 'FILENAME.txt', '', 1, 0 );
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #


%% reading in data
% events
ibd_event_list = data(:,1);
% positron -- positions, times, gammas, total gamma energies (positions / 10 so mm->cm)
e_x0 = data(:,2)/10; e_y0 = data(:,3)/10; e_z0 = data(:,4)/10;
e_x1 = data(:,5)/10; e_y1 = data(:,6)/10; e_z1 = data(:,7)/10;
e_xf = data(:,8)/10; e_yf = data(:,9)/10; e_zf = data(:,10)/10;
e_t = data(:,11)/1000; % ns->us
e_gam_mult = data(:,12);
e_gam_ke = data(:,13);
% neutron -- positions, total scatters, times, alphas, alpha energies, gammas, gamma energies
n_x0 = data(:,14)/10; n_y0 = data(:,15)/10; n_z0 = data(:,16)/10;
n_x1 = data(:,17)/10; n_y1 = data(:,18)/10; n_z1 = data(:,19)/10;
n_xf = data(:,20)/10; n_yf = data(:,21)/10; n_zf = data(:,22)/10;
n_scat = data(:,23);
n_t = data(:,24);
n_alph_mult = data(:,25);
n_alph_ke = data(:,26);
n_gam_mult = data(:,27);
n_gam_ke = data(:,28);


%% displacements
n_x = n_xf - n_x0; n_y = n_yf - n_y0; n_z = n_zf - n_z0;
e_x = e_xf - e_x0; e_y = e_yf - e_y0; e_z = e_zf - e_z0;
n_r = sqrt( n_x.^2 + n_y.^2 + n_z.^2 );
e_r = sqrt( e_x.^2 + e_y.^2 + e_z.^2 );


% whew! all pau
