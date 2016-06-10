% neutron_generator -- script to generate sea-level fast-neutron background
% -- output to HEPEVT-style format for use with RAT-PAC
% -- works together with function neutron_spectrum.m
% -- spectrum as defined in JEDEC standard JESD89a
% ~ by Mark J. Duvall ~ mjduvall@hawaii.edu ~ February 2016 ~

%% USAGE
% 1) If desired, specify a name for the output file:
%    >> savefile = 'filename';
% 2) If desired, specify the number of neutrons to generate (default is 10k):
%    >> NHEP = #;
% 3) Run the script (modify the path if needed):
%    >> run ./neutron_generator.m


%% init

% constants
neutron_mass = 0.9395654133; % neutron mass in GeV/c^2
neutron_id = 2112; % PDG particle ID code for neutron

% number of events
if ~exist('NHEP')
	NHEP = 10^4; % default is 10k events
else
end %if


%% neutron parameters

% generate energies from spectrum
neutron_energies = neutron_spectrum ( NHEP ) / 1000; % convert MeV to GeV for HEPEVT format
% combine energies & directions to express them as momenta in {x,y,z} for HEPEVT format
% -- relevant kinematics: p^2 = E^2 - m^2, E = K + m --> p^2 = K^2 + 2Km, or p = sqrt( K*(K+2m) )
neutron_momenta_magnitudes = sqrt( neutron_energies .* (neutron_energies+2*neutron_mass) );% .* neutron_directions;

% generate random directions -- an n-by-3 matrix of random numbers in the range [-1,1]
% neutron_directions = hat(2*rand([NHEP,3])-1); % unfortunately doesn't work this way; need to loop
neutron_directions = zeros(NHEP,3); % initialize
for k_neutrons = 1:NHEP
  neutron_directions(k_neutrons,:) = hat( 2 * rand(3,1) - 1 );
  neutron_momenta(k_neutrons,:) = neutron_momenta_magnitudes(k_neutrons) .* neutron_directions(k_neutrons,:);
end %for
% -- would be more computationally efficient to calculate this when needed below (HEPEVT definition line),
%      but is clearer this way and can be revised if needed
% -- also, this utilizes hat.m, which simply takes a 3-component vector and scales its components to have a norm of 1


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


%% write HEPEVT block out to text file
%save( 'hepevt.txt', 'HEPEVT', '-ascii' )
if isempty(savefile)
  dlmwrite( 'hepevt.txt', HEPEVT, ' ' ); % default output filename
else
  dlmwrite( savefile, HEPEVT, ' ' );
  savefile2 = sprintf( '%s_energies', savefile ); dlmwrite( savefile2, neutron_energies*1000, ' ' ); %debugging
end %if
%% all pau!   )
