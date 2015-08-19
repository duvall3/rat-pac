% smear.m -- smear out the MC Truth {x,y,z} data according to DC pos. res.
%   -- position resolution P ==== (1/3) (sig_x+sig_y+sig_z),
%        according to Erica's talk/thesis
% !! "data = dlmread( 'DATARUN.txt', '', 1, 0 );" must be run first

% P = mean(sigma{x,y,z})
P = 15.15; % cm; from data

% generate normally-distributed random values for {x,y,z}
L = length(data); % should be 5000, but coded for applying to *.gam, etc.
xyz_smear = P * randn( L, 3 );

% apply smearing to {x,y,z}
x = x + xyz_smear(:,1);
y = y + xyz_smear(:,2);
z = z + xyz_smear(:,3);