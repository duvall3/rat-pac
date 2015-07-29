% n0_data -- read in positions & generate vectors for delta_{x,y,z,r} from neutron-capture table
%  -- intended for use with the output from duvall3/rat-pac/user/shell_scripts/n0_dat_to_txt.sh,
%        in which case you should read in the data with this command:  data = dlmread( 'FILENAME.dat.txt', '', 1, 0 );
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #


data = data/10;  % convert mm to cm
% positions
x0 = data(:,1); y0 = data(:,2); z0 = data(:,3);
xf = data(:,4); yf = data(:,5); zf = data(:,6);
% displacements
x = xf - x0; y = yf - y0; z = zf - z0;
r = sqrt( x.^2 + y.^2 + z.^2 );
% times
t = data(:,7)/1000; % convert ns to us
% gammas: number & total energy
gammas = data(:,8);
gamma_KE_total = data(:,9);

% now you are ready to process {x,y,z}, r, t, & gamma data however you wish
