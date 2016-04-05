% NeutronDataset -- class for analyzing data from Neutron runs
%   -- input properties: event, ke_0, x0, y0, z0, x1, y1, z1, xf, yf, zf, scatters, start_t_sec, start_t_nanosec, t, gammas, gamma_energies, alphas, alpha_energies
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %



classdef NeutronDataset


  %% Properties

  properties % inputs

    Event
    
%   neutron_KE0
    neutron_X0
    neutron_Y0
    neutron_Z0
    neutron_X1
    neutron_Y1
    neutron_Z1
    neutron_Xf
    neutron_Yf
    neutron_Zf
    neutron_Scatters
    neutron_start_T_Sec
    neutron_start_T_Nanosec
    neutron_T
%   neutron_Agents
    neutron_Gammas
    neutron_Gamma_Energies
%   neutron_Alphas
%   neutron_Alpha_Energies
    
    Actual_Theta
    D_Theta_neutron

  end %properties -- inputs
  
  properties (Dependent=true, SetAccess=private) % derived from inputs
    
    N
    
%   total_KE0
    
%   neutron_X
%   neutron_Y
%   neutron_Z
%   neutron_R
    neutron_mu_X
    neutron_mu_Y
    neutron_mu_Z
    neutron_sigma_X
    neutron_sigma_Y
    neutron_sigma_Z
    
    neutron_start_Experiment_T
    neutron_end_Experiment_T
    neutron_Experiment_T_separation
    
    neutron_L
    
    neutron_P
    
%   Theta_neutron
    mu_Theta_neutron
    
    % initial momenta & angular distributions
    positron_P_init
    neutron_P_init
    
    
%   D_Theta_neutron
    
%   Theta_both
%   mu_Theta_both
%   D_Theta_both

  end %properties -- outputs


  %% Methods

  methods
    
    %% constructor
    
%   function neutrondata = NeutronDataset( event, n0_ke0, n0_x0, n0_y0, n0_z0, n0_x1, n0_y1, n0_z1, n0_xf, n0_yf, n0_zf, n0_scat, n0_t, n0_gam, n0_gamke, n0_alph, n0_alphke )
%   function neutrondata = NeutronDataset( event, n0_x0, n0_y0, n0_z0, n0_xf, n0_yf, n0_zf, n0_t, n0_gam, n0_gamke, n0_scat )
    function neutrondata = NeutronDataset( event, n0_x0, n0_y0, n0_z0, n0_xf, n0_yf, n0_zf, n0_start_t_sec, n0_start_t_nanosec, n0_delta_t, n0_gam, n0_gamke, n0_scat )
      
      if nargin > 0 % support calling w/o arguments
        
        neutrondata.Event = event;
        
%       neutrondata.neutron_KE0 = n0_ke0;
        neutrondata.neutron_X0 = n0_x0;
        neutrondata.neutron_Y0 = n0_y0;
        neutrondata.neutron_Z0 = n0_z0;
%       neutrondata.neutron_X1 = n0_x1;
%       neutrondata.neutron_Y1 = n0_y1;
%       neutrondata.neutron_Z1 = n0_z1;
        neutrondata.neutron_Xf = n0_xf;
        neutrondata.neutron_Yf = n0_yf;
        neutrondata.neutron_Zf = n0_zf;
	neutrondata.neutron_start_T_Sec = n0_start_t_sec;
	neutrondata.neutron_start_T_Nanosec = n0_start_t_nanosec;
        neutrondata.neutron_T = n0_delta_t;
        neutrondata.neutron_Gammas = n0_gam;
        neutrondata.neutron_Gamma_Energies = n0_gamke;
        neutrondata.neutron_Scatters = n0_scat;
%       neutrondata.neutron_Alphas = n0_alph;
%       neutrondata.neutron_Alpha_Energies = n0_alphke;
      
      else end %if nargin
  
    end %function


   
    %% dependent properties
     
    % number of events
    function n = get.N(neutrondata)
      if ( length(neutrondata.neutron_X0)==length(neutrondata.neutron_Y0) && length(neutrondata.neutron_Y0)==length(neutrondata.neutron_Z0) )
        n = length(neutrondata.neutron_X0);
      else
        error 'Input vectors must all have the same length.'
      end %if
    end %function
    
    % total initial KE
    function ke0 = total_KE0(neutrondata)
      ke0 = neutrondata.neutron_KE0;
    end
   
        
    % neutrons
    
    % positions
    function x = neutron_X(neutrondata)
      x = neutrondata.neutron_Xf - neutrondata.neutron_X0;
    end
    function y = neutron_Y(neutrondata)
      y = neutrondata.neutron_Yf - neutrondata.neutron_Y0;
    end
    function z = neutron_Z(neutrondata)
      z = neutrondata.neutron_Zf - neutrondata.neutron_Z0;
    end

    % distance(s) between track endpoints
    function r = neutron_R(neutrondata)
      r = sqrt( neutrondata.neutron_X.^2 + neutrondata.neutron_Y.^2 + neutrondata.neutron_Z.^2 );
    end

    % means
    function mux = get.neutron_mu_X(neutrondata)
      mux = mean(neutrondata.neutron_X);
    end
    function muy = get.neutron_mu_Y(neutrondata)
      muy = mean(neutrondata.neutron_Y);
    end
    function muz = get.neutron_mu_Z(neutrondata)
      muz = mean(neutrondata.neutron_Z);
    end

    % stdevs
    function sigx = get.neutron_sigma_X(neutrondata)
      sigx = std(neutrondata.neutron_X);
    end
    function sigy = get.neutron_sigma_Y(neutrondata)
      sigy = std(neutrondata.neutron_Y);
    end
    function sigz = get.neutron_sigma_Z(neutrondata)
      sigz = std(neutrondata.neutron_Z);
    end
    
    % start time
    function t_init = get.neutron_start_Experiment_T(neutrondata)
      t_getSec = neutrondata.neutron_start_T_Sec; %%* 1000000; % convert s to us -- now done in n0_data.m%
      t_getNanoSec = neutrondata.neutron_start_T_Nanosec * 1e-9; % convert ns to s %-- now done in n0_data.m
      t_init = (t_getSec + t_getNanoSec) - (t_getSec(1) + t_getNanoSec(1)); % combine & shift to beginning of experiment instead of UTC epoch
    end
    
    % end time
    function t_end = get.neutron_end_Experiment_T(neutrondata)
      t_end = neutrondata.neutron_start_Experiment_T + neutrondata.neutron_T*1e-6; % convert us to s
    end

    % interevent time
    function t_sep = get.neutron_Experiment_T_separation(neutrondata)
      t_end = neutrondata.neutron_end_Experiment_T;
      t_sep = t_end(2:end) - t_end(1:end-1);
    end

    % initial momentum: magnitudes, unit vectors, momentum vectors
    function p_init = get.neutron_P_init(neutrondata)
      p0_mag = zeros(neutrondata.N, 1);
      p0_dirn = zeros(neutrondata.N, 3);
      p0_hat = zeros(neutrondata.N, 3);
      p0 = zeros(neutrondata.N, 3);
      for k = 1:neutrondata.N
        p0_mag(k) = sqrt( neutrondata.neutron_KE0(k)^2 + 2*neutrondata.neutron_KE0(k)*939.5654113 ); % in MeV
        p0_dirn(k,:) = [ neutrondata.neutron_X1(k)-neutrondata.neutron_X0(k) neutrondata.neutron_Y1(k)-neutrondata.neutron_Y0(k) neutrondata.neutron_Z1(k)-neutrondata.neutron_Z0(k) ];
        p0_hat(k,:) = p0_dirn(k,:) / sqrt(sum(p0_dirn(k,:).^2));
        p0(k,:) = p0_mag(k) * p0_hat(k,:);
      end
      p_init = {p0_mag; p0_hat; p0};
    end

   % length of mean displacement
    function l = get.neutron_L(neutrondata)
      l = sqrt( neutrondata.neutron_mu_X^2 + neutrondata.neutron_mu_Y^2 + neutrondata.neutron_mu_Z^2 );
    end
    
    % position resolution
    function p = get.neutron_P(neutrondata)
      p = mean( [ neutrondata.neutron_sigma_X neutrondata.neutron_sigma_Y neutrondata.neutron_sigma_Z ] );
    end
    
    % angle to/from source
    function th = Theta_neutron(neutrondata)
      th = atan( neutrondata.neutron_X ./ neutrondata.neutron_Z ) * 180/pi;
    end
    
%   % angular resolution
%   function d_th = get.D_Theta_neutron(neutrondata)
%     d_th = atan( (neutrondata.P/neutrondata.L) / sqrt(neutrondata.N) ) * 180/pi;
%   end

    
    %% other methods
    
    % initial total momentum
    function P0 = P0( neutrondata )
      P0 = neutrondata.neutron_P_init{3};
    end
    
    % initial angle cosines
    % neutron
    function ct = neutron_Cos_Theta( neutrondata )
      ct = zeros(neutrondata.N);
      for k = 1:neutrondata.N
        ct(k) = neutrondata.neutron_P_init{2}(k,:) * neutrondata.P0(k,:)';
      end
    end
    
    % data cuts:
    % cut the events falling outside a certain range
    function neutrondata_cut = CutOutsideRange( neutrondata, qty_to_cut, datamin, datamax )
      evalstr = sprintf( 'neutrondata.%s', qty_to_cut );
      data_to_cut = eval(evalstr);
      inds = find( datamin < data_to_cut & data_to_cut < datamax );
%     neutrondata_cut = NeutronDataset( neutrondata.Event(inds), neutrondata.neutron_X0(inds), neutrondata.neutron_Y0(inds), neutrondata.neutron_Z0(inds), neutrondata.neutron_X1(inds), neutrondata.neutron_Y1(inds), neutrondata.neutron_Z1(inds), neutrondata.neutron_Xf(inds), neutrondata.neutron_Yf(inds), neutrondata.neutron_Zf(inds), neutrondata.neutron_T(inds), neutrondata.neutron_Gammas(inds), neutrondata.neutron_Gamma_Energies(inds), neutrondata.neutron_Scatters(inds), neutrondata.neutron_Alphas(inds), neutrondata.neutron_Alpha_Energies(inds) );
      neutrondata_cut = NeutronDataset( neutrondata.Event(inds), neutrondata.neutron_X0(inds), neutrondata.neutron_Y0(inds), neutrondata.neutron_Z0(inds), neutrondata.neutron_Xf(inds), neutrondata.neutron_Yf(inds), neutrondata.neutron_Zf(inds), neutrondata.neutron_start_T_Sec(inds), neutrondata.neutron_start_T_Nanosec(inds), neutrondata.neutron_T(inds), neutrondata.neutron_Gammas(inds), neutrondata.neutron_Gamma_Energies(inds), neutrondata.neutron_Scatters(inds) );
%     neutrondata_cut = data(inds); %debugging
    end %function
   
    % cut the events falling inside a certain range
    function neutrondata_cut = CutInsideRange( neutrondata, qty_to_cut, datamin, datamax )
      evalstr = sprintf( 'neutrondata.%s', qty_to_cut );
      data_to_cut = eval(evalstr);
      inds_low = find( data_to_cut < datamin );
      inds_high = find( data_to_cut > datamax );
      neutrondata_cut = NeutronDataset( neutrondata.Event([inds_low inds_high]), neutrondata.positron_KE0([inds_low inds_high]), neutrondata.positron_X0([inds_low inds_high]), neutrondata.positron_Y0([inds_low inds_high]), neutrondata.positron_Z0([inds_low inds_high]), neutrondata.positron_X1([inds_low inds_high]), neutrondata.positron_Y1([inds_low inds_high]), neutrondata.positron_Z1([inds_low inds_high]), neutrondata.positron_Xf([inds_low inds_high]), neutrondata.positron_Yf([inds_low inds_high]), neutrondata.positron_Zf([inds_low inds_high]), neutrondata.positron_T([inds_low inds_high]), neutrondata.positron_Gammas([inds_low inds_high]), neutrondata.positron_Gamma_Energies([inds_low inds_high]), neutrondata.neutron_KE0([inds_low inds_high]), neutrondata.neutron_X0([inds_low inds_high]), neutrondata.neutron_Y0([inds_low inds_high]), neutrondata.neutron_Z0([inds_low inds_high]), neutrondata.neutron_X1([inds_low inds_high]), neutrondata.neutron_Y1([inds_low inds_high]), neutrondata.neutron_Z1([inds_low inds_high]), neutrondata.neutron_Xf([inds_low inds_high]), neutrondata.neutron_Yf([inds_low inds_high]), neutrondata.neutron_Zf([inds_low inds_high]), neutrondata.neutron_Scatters([inds_low inds_high]), neutrondata.neutron_T([inds_low inds_high]), neutrondata.neutron_Gammas([inds_low inds_high]), neutrondata.neutron_Gamma_Energies([inds_low inds_high]), neutrondata.neutron_Alphas([inds_low inds_high]), neutrondata.neutron_Alpha_Energies([inds_low inds_high]) );
%     neutrondata_cut = data(inds); %debugging
    end %function
   
    % position resolution -- apply user-specified realistic spreading to perfect MC input
    % gaussian spreading for continuous detector elements
    function realistic_x = GSpread( neutrondata, perfect_x, sigma, xmin, xmax )
      realistic_x = perfect_x + sigma * randn(size(perfect_x));
      ind_low = find( realistic_x < xmin );
      realistic_x(ind_low) = xmin;
      ind_high = find( realistic_x > xmax );
      realistic_x(ind_high) = xmax;
    end %function
    
    % flat spreading for discrete detector elements (i.e., cell-based detectors) -- CELL TABLE REQUIRED
    function realistic_x = FSpread( neutrondata, perfect_x, cell_centers, cell_width )
      cell_edges = zeros( length(cell_centers), 2 );
      cell_edges(:,1) = cell_centers - cell_width/2;
      cell_edges(:,2) = cell_centers + cell_width/2;
      realistic_x = zeros( 1, length(perfect_x) );
      for k = 1:length(perfect_x)
        cell_number = find( cell_edges(:,1)<perfect_x(k) & perfect_x(k)<cell_edges(:,2) );
          if isempty(cell_number); error( 'Cell not found.' ); else end
        realistic_x(k) = cell_centers(cell_number); % + ( cell_width*rand(1) - cell_width/2 );  % no flat distrib., just move to center
      end %for
    end %function
  
  end %methods


end %classdef






