% IBDDataset -- class for analyzing data from IBD runs
%   -- input properties: event, {positron,neutron} * {ke_0, x0, y0, z0, x1, y1, z1, xf, yf, zf, scatters(neutron only), t, gammas, gamma_energies}, alphas (neutron only), alpha_energies (neutron only)
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ September 2015 ~ %



classdef IBDDataset


  %% Properties

  properties % inputs

    Event
    
    positron_KE0
    positron_X0
    positron_Y0
    positron_Z0
    positron_X1
    positron_Y1
    positron_Z1
    positron_Xf
    positron_Yf
    positron_Zf
    positron_T
    positron_Gammas
    positron_Gamma_Energies
    
    neutron_KE0
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
    neutron_T
%   neutron_Agents
    neutron_Gammas
    neutron_Gamma_Energies
    neutron_Alphas
    neutron_Alpha_Energies
    
    Actual_Theta
    D_Theta_neutron

  end %properties -- inputs
  
  properties (Dependent=true, SetAccess=private) % derived from inputs
    
    N
    
%   total_KE0
    
%   positron_X
%   positron_Y
%   positron_Z    
%   positron_R
    positron_mu_X
    positron_mu_Y
    positron_mu_Z
    positron_sigma_X
    positron_sigma_Y
    positron_sigma_Z
    
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
    
    function ibddata = IBDDataset( event, pos_ke0, pos_x0, pos_y0, pos_z0, pos_x1, pos_y1, pos_z1, pos_xf, pos_yf, pos_zf, pos_t, pos_gam, pos_gamke, n0_ke0, n0_x0, n0_y0, n0_z0, n0_x1, n0_y1, n0_z1, n0_xf, n0_yf, n0_zf, n0_scat, n0_t, n0_gam, n0_gamke, n0_alph, n0_alphke )
      
      if nargin > 0 % support calling w/o arguments
        
        ibddata.Event = event;
        
        ibddata.positron_KE0 = pos_ke0;
        ibddata.positron_X0 = pos_x0;
        ibddata.positron_Y0 = pos_y0;
        ibddata.positron_Z0 = pos_z0;
        ibddata.positron_X1 = pos_x1;
        ibddata.positron_Y1 = pos_y1;
        ibddata.positron_Z1 = pos_z1;
        ibddata.positron_Xf = pos_xf;
        ibddata.positron_Yf = pos_yf;
        ibddata.positron_Zf = pos_zf;
        ibddata.positron_T = pos_t;
        ibddata.positron_Gammas = pos_gam;
        ibddata.positron_Gamma_Energies = pos_gamke;
        
        ibddata.neutron_KE0 = n0_ke0;
        ibddata.neutron_X0 = n0_x0;
        ibddata.neutron_Y0 = n0_y0;
        ibddata.neutron_Z0 = n0_z0;
        ibddata.neutron_X1 = n0_x1;
        ibddata.neutron_Y1 = n0_y1;
        ibddata.neutron_Z1 = n0_z1;
        ibddata.neutron_Xf = n0_xf;
        ibddata.neutron_Yf = n0_yf;
        ibddata.neutron_Zf = n0_zf;
        ibddata.neutron_Scatters = n0_scat;
        ibddata.neutron_T = n0_t;
        ibddata.neutron_Gammas = n0_gam;
        ibddata.neutron_Gamma_Energies = n0_gamke;
        ibddata.neutron_Alphas = n0_alph;
        ibddata.neutron_Alpha_Energies = n0_alphke;
      
      else end %if nargin
  
    end %function


   
    %% dependent properties
     
    % number of events
    function n = get.N(ibddata)
      if ( length(ibddata.positron_X0)==length(ibddata.positron_Y0) && length(ibddata.positron_Y0)==length(ibddata.positron_Z0) )
        n = length(ibddata.positron_X0);
      else
        error 'Input vectors must all have the same length.'
      end %if
    end %function
    
    % total initial KE
    function ke0 = total_KE0(ibddata)
      ke0 = ibddata.positron_KE0 + ibddata.neutron_KE0;
    end
   
    % positrons
    
    % positions
    function x = positron_X(ibddata)
      x = ibddata.positron_Xf - ibddata.positron_X0;
    end
    function y = positron_Y(ibddata)
      y = ibddata.positron_Yf - ibddata.positron_Y0;
    end
    function z = positron_Z(ibddata)
      z = ibddata.positron_Zf - ibddata.positron_Z0;
    end

    % distance(s) between track endpoints
    function r = positron_R(ibddata)
      r = sqrt( ibddata.positron_X.^2 + ibddata.positron_Y.^2 + ibddata.positron_Z.^2 );
    end
     
    % means
    function mux = get.positron_mu_X(ibddata)
      mux = mean(ibddata.positron_X);
    end
    function muy = get.positron_mu_Y(ibddata)
      muy = mean(ibddata.positron_Y);
    end
    function muz = get.positron_mu_Z(ibddata)
      muz = mean(ibddata.positron_Z);
    end
    
    % stdevs
    function sigx = get.positron_sigma_X(ibddata)
      sigx = std(ibddata.positron_X);
    end
    function sigy = get.positron_sigma_Y(ibddata)
      sigy = std(ibddata.positron_Y);
    end
    function sigz = get.positron_sigma_Z(ibddata)
      sigz = std(ibddata.positron_Z);
    end
    
    % initial momentum: magnitudes, unit vectors, momentum vectors, and angle cosines
    function p_init = get.positron_P_init(ibddata)
      p0_mag = zeros(ibddata.N, 1);
      p0_dirn = zeros(ibddata.N, 3);
      p0_hat = zeros(ibddata.N, 3);
      p0 = zeros(ibddata.N, 3);
      for k = 1:ibddata.N
        p0_mag(k) = sqrt( ibddata.positron_KE0(k)^2 + 2*ibddata.positron_KE0(k)*0.5109989461 ); % in MeV
        p0_dirn(k,:) = [ ibddata.positron_X1(k)-ibddata.positron_X0(k) ibddata.positron_Y1(k)-ibddata.positron_Y0(k) ibddata.positron_Z1(k)-ibddata.positron_Z0(k) ];
        p0_hat(k,:) = p0_dirn(k,:) / sqrt(sum(p0_dirn(k,:).^2));
        p0(k,:) = p0_mag(k) * p0_hat(k,:);
      end
      p_init = {p0_mag; p0_hat; p0};
    end

        
    % neutrons
    
    % positions
    function x = neutron_X(ibddata)
      x = ibddata.neutron_Xf - ibddata.neutron_X0;
    end
    function y = neutron_Y(ibddata)
      y = ibddata.neutron_Yf - ibddata.neutron_Y0;
    end
    function z = neutron_Z(ibddata)
      z = ibddata.neutron_Zf - ibddata.neutron_Z0;
    end

    % distance(s) between track endpoints
    function r = neutron_R(ibddata)
      r = sqrt( ibddata.neutron_X.^2 + ibddata.neutron_Y.^2 + ibddata.neutron_Z.^2 );
    end

    % means
    function mux = get.neutron_mu_X(ibddata)
      mux = mean(ibddata.neutron_X);
    end
    function muy = get.neutron_mu_Y(ibddata)
      muy = mean(ibddata.neutron_Y);
    end
    function muz = get.neutron_mu_Z(ibddata)
      muz = mean(ibddata.neutron_Z);
    end

    % stdevs
    function sigx = get.neutron_sigma_X(ibddata)
      sigx = std(ibddata.neutron_X);
    end
    function sigy = get.neutron_sigma_Y(ibddata)
      sigy = std(ibddata.neutron_Y);
    end
    function sigz = get.neutron_sigma_Z(ibddata)
      sigz = std(ibddata.neutron_Z);
    end

    % initial momentum: magnitudes, unit vectors, momentum vectors, and angle cosines
    function p_init = get.neutron_P_init(ibddata)
      p0_mag = zeros(ibddata.N, 1);
      p0_dirn = zeros(ibddata.N, 3);
      p0_hat = zeros(ibddata.N, 3);
      p0 = zeros(ibddata.N, 3);
      for k = 1:ibddata.N
        p0_mag(k) = sqrt( ibddata.neutron_KE0(k)^2 + 2*ibddata.neutron_KE0(k)*939.5654113 ); % in MeV
        p0_dirn(k,:) = [ ibddata.neutron_X1(k)-ibddata.neutron_X0(k) ibddata.neutron_Y1(k)-ibddata.neutron_Y0(k) ibddata.neutron_Z1(k)-ibddata.neutron_Z0(k) ];
        p0_hat(k,:) = p0_dirn(k,:) / sqrt(sum(p0_dirn(k,:).^2));
        p0(k,:) = p0_mag(k) * p0_hat(k,:);
      end
      p_init = {p0_mag; p0_hat; p0};
    end

   % length of mean displacement
    function l = get.neutron_L(ibddata)
      l = sqrt( ibddata.neutron_mu_X^2 + ibddata.neutron_mu_Y^2 + ibddata.neutron_mu_Z^2 );
    end
    
    % position resolution
    function p = get.neutron_P(ibddata)
      p = mean( [ ibddata.neutron_sigma_X ibddata.neutron_sigma_Y ibddata.neutron_sigma_Z ] );
    end
    
    % angle to/from source
    function th = Theta_neutron(ibddata)
      th = atan( ibddata.neutron_Z ./ ibddata.neutron_X ) * 180/pi;
    end
    
%   % angular resolution
%   function d_th = get.D_Theta_neutron(ibddata)
%     d_th = atan( (ibddata.P/ibddata.L) / sqrt(ibddata.N) ) * 180/pi;
%   end

    
    %% other methods
    
    % initial total momentum
    function P0 = P0( ibddata )
      P0 = ibddata.positron_P_init{3} + ibddata.neutron_P_init{3};
    end
    
    % data cuts:    
    function ibddata_cut = Cut( ibddata, qty_to_cut, datamin, datamax )
      evalstr = sprintf( 'ibddata.%s', qty_to_cut );
      data_to_cut = eval(evalstr);
      inds = find( datamin < data_to_cut & data_to_cut < datamax );
      ibddata_cut = IBDDataset( ibddata.Event(inds), ibddata.positron_KE0(inds), ibddata.positron_X0(inds), ibddata.positron_Y0(inds), ibddata.positron_Z0(inds), ibddata.positron_X1(inds), ibddata.positron_Y1(inds), ibddata.positron_Z1(inds), ibddata.positron_Xf(inds), ibddata.positron_Yf(inds), ibddata.positron_Zf(inds), ibddata.positron_T(inds), ibddata.positron_Gammas(inds), ibddata.positron_Gamma_Energies(inds), ibddata.neutron_KE0(inds), ibddata.neutron_X0(inds), ibddata.neutron_Y0(inds), ibddata.neutron_Z0(inds), ibddata.neutron_X1(inds), ibddata.neutron_Y1(inds), ibddata.neutron_Z1(inds), ibddata.neutron_Xf(inds), ibddata.neutron_Yf(inds), ibddata.neutron_Zf(inds), ibddata.neutron_Scatters(inds), ibddata.neutron_T(inds), ibddata.neutron_Gammas(inds), ibddata.neutron_Gamma_Energies(inds), ibddata.neutron_Alphas(inds), ibddata.neutron_Alpha_Energies(inds) );
%     ibddata_cut = data(inds); %debugging
    end %function
    
  
  end %methods


end %classdef






