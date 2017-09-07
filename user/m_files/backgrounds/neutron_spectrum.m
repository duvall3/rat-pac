function [ energies ] = neutron_spectrum( n )
% -- neutron_spectrum -- script to generate a fast-netron background according to JEDEC standard JESD89a
% -- spectrum is for fast neutrons, at sea level, as recorded in New York
% -- calculate integral: http://www.wolframalpha.com/input/?i=integrate+[+1.006e-6+*+exp%28-.35*%28log%28x%29%29^2%2B2.1451*log%28x%29%29+%2B+1.011e-3+*+exp%28-.4106*%28log%28x%29%29^2-.667*log%28x%29%29,+x,+0.1,+1000+]
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ February 2016 ~

% NOTE: MATLAB and Octave require different versions of the last line!


%% prep / init
% settings check

% energy vector
En = 10.^(linspace(-1,4,10000))'; % sampling resolution: 10000 exponentially-spaced points across [0.1,10^4] MeV

%% define fit as in JESD89a
% parameters
A1 = 1.006e-6; b1 = 0.35; c1 = 2.1451;
A2 = 1.011e-3; b2 = 0.4106; c2 = -0.667;
% spectrum
phi1 = A1 * exp( -b1 * (log(En)).^2 + c1 * log(En) );
phi2 = A2 * exp( -b2 * (log(En)).^2 + c2 * log(En) );
phi = phi1 + phi2;

%% sample from spectrum
energies = randsample( En, n, true, phi ); % MATLAB
%energies = randsample_mod( En, n, true, phi ); % Octave (modified version of randsample)

%% all pau!   )
end %function
