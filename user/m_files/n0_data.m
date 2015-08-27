% n0_data -- read in text data & create object of NeutronDataset class
%  -- intended for use with the output from duvall3/rat-pac/user/shell_scripts/n0_dat_to_txt.sh,
%        in which case you should read in the data with this command:  data = dlmread( 'FILENAME.dat.txt', '', 1, 0 );
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ #


%% partial read, with conversions
data(:,1:6) = data(:,1:6)/10; % mm to cm
data(:,7) = data(:,7)/1000; % ns to us
% positions
x0 = data(:,1); y0 = data(:,2); z0 = data(:,3);
xf = data(:,4); yf = data(:,5); zf = data(:,6);

%% create NeutronDataset object & read remaining data -- 10 comes early because of 'scatters' order in data
% for NeutronDataset: x, y, z, t, scatters, gammas, gamma_total_KE, alphas, alpha_total_KE
nds_all = NeutronDataset( xf-x0, yf-y0, zf-z0, data(:,7), data(:,10), data(:,8), data(:,9) );
% alpha energies, if applicable
datasize = size(data);
if datasize(2) > 10
  nds_all.Alphas = data(:,11);
  if datasize(2) > 11
    alpha_KE_padded = data(:,12);
    nds_all.Alpha_Energies = alpha_KE_padded(alpha_KE_padded~=0);
  end
end %if

% now you are ready to process {x,y,z}, r, t, & gamma data however you wish
disp 'Data read & NeutronDataset object created. If cuts are desired, see function run_analysis.m.'

disp(nds_all);
