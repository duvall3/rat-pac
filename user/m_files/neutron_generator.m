% neutron_generator -- script to generate sea-level fast-neutron background
% -- output to HEPEVT-style format for use with RAT-PAC
% -- works together with function neutron_spectrum.m
% -- spectrum as defined in JEDEC standard JESD89a
% ~ by Mark J. Duvall ~ mjduvall@hawaii.edu ~ February 2016 ~



%% init

% constants
neutron_mass = 0.9395654133; % neutron mass in GeV/c^2
neutron_id = 2112; % PDG particle ID code for neutron

% number of events
if ~exist('NHEP')
	n = 10^4; % default is 10k events
else
end %if



%% neutron parameters

% generate energies from spectrum
neutron_energies = neutron_generator( n ) / 1000; % convert MeV to GeV for HEPEVT format

% generate random directions -- an n-by-3 matrix of random numbers in the range [-1,1]
neutron_directions = hat(2*rand([NHEP,3])-1);
% -- would be more computationally efficient to calculate this when needed below (HEPEVT definition line),
%      but is clearer this way and can be revised if needed
% -- also, this utilizes hat.m, which simply takes a 3-component vector and scales its components to have a norm of 1

% combine energies & directions to express them as momenta in {x,y,z} for HEPEVT format
% -- relevant kinematics: p^2 = E^2 - m^2, E = K + m --> p^2 = K^2 + 2Km, or p = sqrt( K*(K+2m) )
neutron_momenta = sqrt( neutron_energies .* (neutron_energies+2*neutron_mass^2) ) * neutron_directions;



%% prepare & create HEPEVT block
% individual quantities:
% ISTHEP = ones(NHEP,1); % set all particle status codes to 1
% IDHEP = 2112 * ones(NHEP,1); % set all particle IDs to "neutron"
% JDAHEP1 = zeros(NHEP,1); % set all "first daughter" entries to 0
% JDAHEP2 = zeros(NHEP,1); % set all "second daughter" entries to 0
% PHEP{1,2,3} = neutron_momenta(:,{1,2,3}); % momentum components
% aggregate block
% HEPEVT = [ISTHEP IDHEP JDAHEP1 JDAHEP2 PHEP1 PHEP2 PHEP3]; % PHEP5 DT X Y Z PLX PLY PLZ]; % optional components
HEPEVT = [ones(NHEP,1), 2112*ones(NHEP,1), zeros(NHEP,1), zeros(NHEP,1), neutron_momenta(:,1), neutron_momenta(:,2), neutron_momenta(:,3) ];



%% save HEPEVT block as text file
save( 'hepevt.txt', 'HEPEVT', '-ascii' )




%% all pau!   )
%return 0
