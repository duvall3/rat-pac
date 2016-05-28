% songs_an.m -- simple script to analyze a NeutronDataset object from a (pseudo-)SONGS run
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ April 2016 ~ %

% assuming 'data = dlmread(...)' and 'n0_data' have already been run

% cut on edges of target cube at +/- 38.2 cm
ds_cut = ds_all.CutOutsideRange( 'neutron_Xf', -38.2, 38.2 );
ds_cut = ds_cut.CutOutsideRange( 'neutron_Yf', -38.2, 38.2 );
ds_cut = ds_cut.CutOutsideRange( 'neutron_Zf', -38.2, 38.2 )
% cut on inter-event time at [10μs, 800μs]
ds_cut_T = ds_cut.CutOutsideRange( 'neutron_Experiment_T_separation', 10*10^-6, 800*10^-6 )

% calculate results
nuebar_candidates = ds_cut_T.N;
experiment_duration = max( ds_cut_T.neutron_end_Experiment_T ) - min( ds_cut_T.neutron_start_Experiment_T );
nuebar_candidate_rate = nuebar_candidates / experiment_duration;

% display results
fprintf( '\n\n### RESULTS ###\n' )
fprintf( 'Events Passing Time Cuts:  %i\n', nuebar_candidates )
fprintf( 'Experiment Duration:  %f (s) = %f (days)\n', experiment_duration, experiment_duration / (3600*24) )
fprintf( 'Candidate Rate:  %f / s  =  %f / day\n\n', nuebar_candidate_rate, nuebar_candidate_rate * (3600*24) )

% all pau!   )
