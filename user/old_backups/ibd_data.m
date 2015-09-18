% ibd_data -- read in positions & generate vectors for delta_{x,y,z,r} from IBD table
%  -- intended for use with the output from duvall3/rat-pac/user/shell_scripts/ibd_dat_to_txt.sh,
%        in which case you should read in the data with this command:  data = dlmread( 'FILENAME.dat.txt', '', 1, 0 );
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


% e+ first
positron_KE0 = data(:,1); % MeV
positron_x0 = data(:,2)/10; positron_y0 = data(:,3)/10; positron_z0 = data(:,4)/10; % convert mm to cm
positron_xf = data(:,4)/10; positron_yf = data(:,5)/10; positron_zf = data(:,6)/10; % convert mm to cm
positron_x = positron_xf - positron_x0; positron_y = positron_yf - positron_y0; positron_z = positron_zf - positron_z0;
%r = sqrt( x.^2 + y.^2 + z.^2 );
positron_t = data(:,7)/1000; % convert ns to us

% n0 next
neutron_KE0 = data(:,9); % MeV
neutron_x0 = data(:,10)/10; neutron_y0 = data(:,11)/10; neutron_z0 = data(:,12)/10; % convert mm to cm
neutron_xf = data(:,13)/10; neutron_yf = data(:,14)/10; neutron_zf = data(:,15)/10; % convert mm to cm
%r = sqrt( x.^2 + y.^2 + z.^2 );
neutron_t = data(:,16)/1000; % convert ns to us


% now you have all the initial velocities & energies and can check for 4-momentum conservation, angular distributions, etc.
