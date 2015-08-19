% smear.m -- smear out the MC Truth {x,y,z} data according to DC pos. res.
%   -- position resolution P ==== (1/3) (sig_x+sig_y+sig_z),
%        according to Erica's talk/thesis
% !! "data = dlmread( 'DATARUN.txt', '', 1, 0 );" must be run first

P_Tr = 3.2570; % cm; from MC Truth data
P_DC = 15.67; % cm; from DC data

% Gaussian widths add in quadrature, so:
% sigma_Truth^2 + sigma_smear^2 = sigma_DC^2, or:
P_smear = sqrt( P_DC^2 - P_Tr^2 );

% generate normally-distributed random values for {x,y,z}
L = length(data); % should be 5000, but coded for applying to *.gam, etc.
xyz_smear = P_smear * randn( L, 3 );

% apply smearing to {x,y,z}
x = x + xyz_smear(:,1);
y = y + xyz_smear(:,2);
z = z + xyz_smear(:,3);

r = sqrt( x.^2 + y.^2 + z.^2 );