% IBDDataset -- class for analyzing data from IBD runs
%   -- input properties: event, {positron,neutron} * {ke_0, x0, y0, z0, x1, y1, z1, xf, yf, zf, t, scatters(neutron only), gammas, gamma_energies}, alphas (neutron only), alpha_energies (neutron only)
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
    neutron_T
    neutron_Scatters
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
    
    total_KE0
    
    positron_X
    positron_Y
    positron_Z    
    positron_R
    positron_mu_X
    positron_mu_Y
    positron_mu_Z
    positron_sigma_X
    positron_sigma_Y
    positron_sigma_Z
    
    neutron_X
    neutron_Y
    neutron_Z
    neutron_R
    neutron_mu_X
    neutron_mu_Y
    neutron_mu_Z
    neutron_sigma_X
    neutron_sigma_Y
    neutron_sigma_Z

    neutron_L
    
    neutron_P
    
    Theta_neutron
    mu_Theta_neutron
%   D_Theta_neutron
    
%   Theta_both
%   mu_Theta_both
%   D_Theta_both

  end %properties -- outputs


  %% Methods

  methods
    
    %% constructor
    
    function ibddata = IBDDataset( event, pos_ke0, pos_x0, pos_y0, pos_z0, pos_x1, pos_y1, pos_z1, pos_xf, pos_yf, pos_zf, pos_t, pos_gam, pos_gamke, n0_ke0, n0_x0, n0_y0, n0_z0, n0_x1, n0_y1, n0_z1, n0_xf, n0_yf, n0_zf, n0_t, n0_scat, n0_gam, n0_gamke, n0_alph, n0_alphke )
      
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
        ibddata.neutron_T = n0_t;
        ibddata.neutron_Scatters = n0_scat;
        ibddata.neutron_Gammas = n0_gam;
        ibddata.neutron_Gamma_Energies = n0_gamke;
        ibddata.neutron_Alphas = n0_alph;
        ibddata.neutron_Alpha_Energies = n0_alphke;
      
      else end %if nargin
  
    end %function


%   %% constructor -- vararg version
%   function ibddata = IBDDataset( x, y, z, varargin ) %t, sc, g, gke, alph, alphke )
%     if nargin > 0 % support calling w/o arguments
%       ibddata.X = x;
%       ibddata.Y = y;
%       ibddata.Z = z;
%       varargs = length(varargin);
%       if varargs >= 1; ibddata.T = varargin{1};
%         if varargs >= 2; ibddata.Scatters = varargin{2};
%           if varargs >= 3; ibddata.Gammas = varargin{3};
%             if varargs >= 4; ibddata.Gamma_Energies = varargin{4};
%               if varargs >= 5; ibddata.Alphas = varargin{5};
%                 if varargs == 6; ibddata.Alpha_Energies = varargin{6};
%                 elseif varargs >= 7; error 'Error: Too many input arguments.'
%                 else end
%               else end
%             else end
%           else end
%         else end
%       end %if -- varargs
%     else end %if -- nargin
%   end %function
   
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
    function ke0 = get.total_KE0(ibddata)
      ke0 = ibddata.positron_KE0 + ibddata.neutron_KE0;
    end
   
    % positrons
    
    % positions
    function x = get.positron_X(ibddata)
      x = ibddata.positron_Xf - ibddata.positron_X0;
    end
    function y = get.positron_Y(ibddata)
      y = ibddata.positron_Yf - ibddata.positron_Y0;
    end
    function z = get.positron_Z(ibddata)
      z = ibddata.positron_Zf - ibddata.positron_Z0;
    end

    % distance(s) between track endpoints
    function r = get.positron_R(ibddata)
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

        
    % neutrons
    
    % positions
    function x = get.neutron_X(ibddata)
      x = ibddata.neutron_Xf - ibddata.neutron_X0;
    end
    function y = get.neutron_Y(ibddata)
      y = ibddata.neutron_Yf - ibddata.neutron_Y0;
    end
    function z = get.neutron_Z(ibddata)
      z = ibddata.neutron_Zf - ibddata.neutron_Z0;
    end

    % distance(s) between track endpoints
    function r = get.neutron_R(ibddata)
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


   % length of mean displacement
    function l = get.neutron_L(ibddata)
      l = sqrt( ibddata.neutron_mu_X^2 + ibddata.neutron_mu_Y^2 + ibddata.neutron_mu_Z^2 );
    end
    
    % position resolution
    function p = get.neutron_P(ibddata)
      p = mean( [ ibddata.neutron_sigma_X ibddata.neutron_sigma_Y ibddata.neutron_sigma_Z ] );
    end
    
    % angle to/from source
    function th = get.Theta_neutron(ibddata)
      th = atan( ibddata.neutron_Z ./ ibddata.neutron_X ) * 180/pi;
    end
    
%   % angular resolution
%   function d_th = get.D_Theta_neutron(ibddata)
%     d_th = atan( (ibddata.P/ibddata.L) / sqrt(ibddata.N) ) * 180/pi;
%   end

    
    %% other methods
    
    % data cuts:
    
    % ibddata
    
    function ibddata_cut = Cut( ibddata, qty_to_cut, datamin, datamax )
      evalstr = sprintf( 'ibddata.%s', qty_to_cut );
      data_to_cut = eval(evalstr);
      inds = find( datamin < data_to_cut & data_to_cut < datamax );
      ibddata_cut = IBDDataset( ibddata.Event(inds), ibddata.positron_KE0(inds), ibddata.positron_X0(inds), ibddata.positron_Y0(inds), ibddata.positron_Z0(inds), ibddata.positron_X1(inds), ibddata.positron_Y1(inds), ibddata.positron_Z1(inds), ibddata.positron_Xf(inds), ibddata.positron_Yf(inds), ibddata.positron_Zf(inds), ibddata.positron_T(inds), ibddata.positron_Gammas(inds), ibddata.positron_Gamma_Energies(inds), ibddata.neutron_KE0(inds), ibddata.neutron_X0(inds), ibddata.neutron_Y0(inds), ibddata.neutron_Z0(inds), ibddata.neutron_X1(inds), ibddata.neutron_Y1(inds), ibddata.neutron_Z1(inds), ibddata.neutron_Xf(inds), ibddata.neutron_Yf(inds), ibddata.neutron_Zf(inds), ibddata.neutron_T(inds), ibddata.neutron_Scatters(inds), ibddata.neutron_Gammas(inds), ibddata.neutron_Gamma_Energies(inds), ibddata.neutron_Alphas(inds), ibddata.neutron_Alpha_Energies(inds) );
%     ibddata_cut = data(inds); %debugging
    end %function
    
    
    
%   % cut on x
%   function ibddata_xcut = CutNeutronX(ibddata, x_min, x_max)
%     inds = find( x_min < ibddata.neutron_Xf  &  ibddata.neutron_Xf < x_max );
%     ibddata_xcut = NeutronDataset( ibddata.neutron_Xf(inds), ibddata.neutron_Yf(inds), ibddata.neutron_Zf(inds), ibddata.neutron_Tf(inds), ibddata.neutron_Scatters(inds), ibddata.neutron_Gammas(inds), ibddata.neutron_Gamma_Energies(inds), ibddata.neutron_Alphas(inds), ibddata.neutron_Alpha_Energies(inds) );
%   end %function
%   
%   % cut on y
%   function ibddata_ycut = CutNeutronY(ibddata, y_min, y_max)                                                                                                                                                                                   
%     inds = find( y_min < ibddata.neutron_Yf  &  ibddata.neutron_Yf < y_max );                                                                                                                                                                             
%     ibddata_ycut = NeutronDataset( ibddata.neutron_Xf(inds), ibddata.Y(inds), ibddata.Z(inds), ibddata.T(inds_T), ibddata.Scatters(inds_S), ibddata.Gammas(inds_G), ibddata.Gamma_Energies(inds_GE), ibddata.Alphas(inds_A), ibddata.Alpha_Energies(inds_AE) );
%   end %function                                                                                                                                                                                                                     
%   
%   % cut on z
%   function ibddata_zcut = ZCut(ibddata, z_min, z_max)                                                                                                                                                                                   
%     inds = find( z_min < ibddata.Z  &  ibddata.Z < z_max );                                                                                                                                                                              
%     % make cuts to data                                                                                                                                                                                                             
%     ibddata_zcut = NeutronDataset( ibddata.X(inds), ibddata.Y(inds), ibddata.Z(inds), ibddata.T(inds_T), ibddata.Scatters(inds_S), ibddata.Gammas(inds_G), ibddata.Gamma_Energies(inds_GE), ibddata.Alphas(inds_A), ibddata.Alpha_Energies(inds_AE) );
%   end %function                                                                                                                                                                                                                     
%
%   % cut on t                                                                                                                                                                                                                          
%    function ibddata_tcut = TCut(ibddata, t_min, t_max)                                                                                                                                                                                     
%      inds = find( t_min < ibddata.T  &  ibddata.T < t_max );                                                                                                                                                                               
%      % make cuts to data                                                                                                                                                                                                               
%      ibddata_tcut = NeutronDataset( ibddata.X(inds), ibddata.Y(inds), ibddata.Z(inds), ibddata.T(inds_T), ibddata.Scatters(inds_S), ibddata.Gammas(inds_G), ibddata.Gamma_Energies(inds_GE), ibddata.Alphas(inds_A), ibddata.Alpha_Energies(inds_AE) );    
%    end %function                                                                                                                                                                                                                       

%    % cut on sc                                                                                                                                                                                                                             
%     function ibddata_scut = ScattersCut(ibddata, sc_min, sc_max)                                                                                                                                                                                     
%       inds = find( sc_min < ibddata.Scatters  &  ibddata.Scatters < sc_max );                                                                                                                                                                               
%       % make cuts to data                                                                                                                                                                                                               
%       ibddata_scut = NeutronDataset( ibddata.X(inds), ibddata.Y(inds), ibddata.Z(inds), ibddata.T(inds_T), ibddata.Scatters(inds_S), ibddata.Gammas(inds_G), ibddata.Gamma_Energies(inds_GE), ibddata.Alphas(inds_A), ibddata.Alpha_Energies(inds_AE) );    
%     end %function                                                                                                                                                                                                                       
    


  
  end %methods


end %classdef






