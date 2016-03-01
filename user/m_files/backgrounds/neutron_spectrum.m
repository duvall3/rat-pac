function [ energies ] = neutron_spectrum( n )
% -- neutron_spectrum -- script to generate a fast-netron background according to JEDEC standard JESD89a
% -- spectrum is for fast neutrons, at sea level, as recorded in New York
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ February 2016 ~

%% prep / init
% settings check

% energy vector
En = 10.^(0:.001:4); % sampling resolution: 4000 exponentially-spaced points

%% define fit as in JESD89a
% parameters
A1 = 1.006e-6; b1 = 0.35; c1 = 2.1451;
A2 = 1.011e-3; b2 = 0.4106; c2 = -0.667;
% spectrum
phi1 = A1 * exp( -b1 * (log(En)).^2 + c1 * log(En) );
phi2 = A2 * exp( -b2 * (log(En)).^2 + c2 * log(En) );
phi = phi1 + phi2;

%% sample from spectrum
energies = randsample( En, n, true, phi );

%% all pau!   )
end %function
