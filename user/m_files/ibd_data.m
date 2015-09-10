function ibdds = ibd_data( data )
% ibd_data = read in text data & create object of IBDDataset class
%  -- intended for use with the output from duvall3/rat-pac/user/shell_scripts/ibd_dat_to_txt.sh,
%        in which case you should read in the data with this command:  data = dlmread( 'FILENAME.txt', '', 1, 0 );
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ #

% basic argcheck
[~, width ] = size(data);
if width ~= 30; error('\nBad data size or format.\n'); else end

ibd_data = data;
%% convert
ibd_data(:,3:11) = ibd_data(:,3:11)/10; ibd_data(:,16:24) = ibd_data(:,16:24)/10; % mm to cm
ibd_data(:,12) = ibd_data(:,12)/1000; ibd_data(:,25) = ibd_data(:,25)/1000; % ns to us

%% create IBDDataset object from 'data'
% see heading IBDDataset class or header in '.txt' file for argument list
ibdds = IBDDataset( ibd_data(:,1), ibd_data(:,2), ibd_data(:,3), ibd_data(:,4), ibd_data(:,5), ibd_data(:,6), ibd_data(:,7), ibd_data(:,8), ibd_data(:,9), ibd_data(:,10), ibd_data(:,11), ibd_data(:,12), ibd_data(:,13), ibd_data(:,14), ibd_data(:,15), ibd_data(:,16), ibd_data(:,17), ibd_data(:,18), ibd_data(:,19), ibd_data(:,20), ibd_data(:,21), ibd_data(:,22), ibd_data(:,23), ibd_data(:,24), ibd_data(:,25), ibd_data(:,26), ibd_data(:,27), ibd_data(:,28), ibd_data(:,29), ibd_data(:,30) );
