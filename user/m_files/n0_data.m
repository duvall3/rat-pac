% n0_data -- read in positions & generate vectors for delta_{x,y,z,r} from neutron-capture table
%  -- intended for use with the output from duvall3/rat-pac/user/shell_scripts/n0_dat_to_txt.sh,
%        in which case you should read in the data with this command:  data = dlmread( 'FILENAME.dat.txt', '', 1, 0 );
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


data = data/10;  % convert mm to cm
x0 = data(:,1); y0 = data(:,2); z0 = data(:,3);
xf = data(:,4); yf = data(:,5); zf = data(:,6);
x = xf - x0; y = yf - y0; z = zf - z0;
r = sqrt( x.^2 + y.^2 + z.^2 );
t = data(:,7)/1000; % convert ns to us

% now you are ready to process x,y,z,r,t however you wish
