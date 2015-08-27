% NeutronDataset -- class for analyzing data from neutron captures
%   -- input properties: x, y, z, t, scatters, gammas, gamma_energies, alphas, alpha_energies
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %



classdef NeutronDataset


  %% Properties

  properties % inputs -- just {x,y,z} for now

    X
    Y
    Z
    T
    Scatters
%   Agents
    Gammas
    Gamma_Energies
    Alphas
    Alpha_Energies

  end %properties -- inputs
  
  properties (Dependent=true, SetAccess=private) % derived from inputs
    
    N
    R
    mu_X
    mu_Y
    mu_Z
    sigma_X
    sigma_Y
    sigma_Z
    L
    P
    Theta
    D_Theta

  end %properties -- outputs


  %% Methods

  methods

    %% constructor
    function ndata = NeutronDataset( x, y, z, varargin ) %t, sc, g, gke, alph, alphke )
      if nargin > 0 % support calling w/o arguments
        ndata.X = x;
        ndata.Y = y;
        ndata.Z = z;
        varargs = length(varargin);
        if varargs >= 1; ndata.T = varargin{1};
          if varargs >= 2; ndata.Scatters = varargin{2};
            if varargs >= 3; ndata.Gammas = varargin{3};
              if varargs >= 4; ndata.Gamma_Energies = varargin{4};
                if varargs >= 5; ndata.Alphas = varargin{5};
                  if varargs == 6; ndata.Alpha_Energies = varargin{6};
                  elseif varargs >= 7; error 'Error: Too many input arguments.'
                  else end
                else end
              else end
            else end
          else end
        end %if -- varargs
      else end %if -- nargin
    end %function
   
    %% dependent properties
     
    % number of events
    function n = get.N(ndata)
      if ( length(ndata.X)==length(ndata.Y) && length(ndata.Y)==length(ndata.Z) )
        n = length(ndata.X);
      else
        error 'Vectors x, y, z must all have the same length.'
      end %if
    end %function
   
    % distance(s) between track endpoints
    function r = get.R(ndata)
      r = sqrt( ndata.X.^2 + ndata.Y.^2 + ndata.Z.^2 );
    end
     
    % means
    function mux = get.mu_X(ndata)
      mux = mean(ndata.X);
    end
    function muy = get.mu_Y(ndata)
      muy = mean(ndata.Y);
    end
    function muz = get.mu_Z(ndata)
      muz = mean(ndata.Z);
    end
    
    % stdevs
    function sigx = get.sigma_X(ndata)
      sigx = std(ndata.X);
    end
    function sigy = get.sigma_Y(ndata)
      sigy = std(ndata.Y);
    end
    function sigz = get.sigma_Z(ndata)
      sigz = std(ndata.Z);
    end
    
    % length of mean displacement
    function l = get.L(ndata)
      l = sqrt( ndata.mu_X^2 + ndata.mu_Y^2 + ndata.mu_Z^2 );
    end
    
    % position resolution
    function p = get.P(ndata)
      p = mean( [ ndata.sigma_X ndata.sigma_Y ndata.sigma_Z ] );
    end
    
    % angle to/from source
    function th = get.Theta(ndata)
      th = atan( ndata.mu_Z / ndata.mu_X ) * 180/pi;
    end
    
    % angular resolution
    function d_th = get.D_Theta(ndata)
      d_th = atan( (ndata.P/ndata.L) / sqrt(ndata.N) ) * 180/pi;
    end

    
    %% other methods
    
    % data cuts:
    
    % cut on x
    function ndata_xcut = XCut(ndata, x_min, x_max)
      inds = find( x_min < ndata.X  &  ndata.X < x_max );
      % make cuts to data
        if isempty(ndata.T); inds_T = [];
          else inds_T = inds;
            if isempty(ndata.Scatters); inds_S = [];
              else inds_S = inds;
                if isempty(ndata.Gammas); inds_G = [];
                  else inds_G = inds;
                    if isempty(ndata.Gamma_Energies); inds_GE = [];
                      else inds_GE = inds;
                        if isempty(ndata.Alphas); inds_A = [];
                          else inds_A = inds;
                            if isempty(ndata.Alpha_Energies); inds_AE = [];
                              else inds_AE = inds;
                            end
                        end
                    end
                end
            end
        end
      % make cuts to data
      ndata_xcut = NeutronDataset( ndata.X(inds), ndata.Y(inds), ndata.Z(inds), ndata.T(inds_T), ndata.Scatters(inds_S), ndata.Gammas(inds_G), ndata.Gamma_Energies(inds_GE), ndata.Alphas(inds_A), ndata.Alpha_Energies(inds_AE) );
    end %function
    
    % cut on y
    function ndata_ycut = YCut(ndata, y_min, y_max)                                                                                                                                                                                   
      inds = find( y_min < ndata.Y  &  ndata.Y < y_max );                                                                                                                                                                             
      % make cuts to data                                                                                                                                                                                                             
        if isempty(ndata.T); inds_T = [];                                                                                                                                                                                             
          else inds_T = inds;                                                                                                                                                                                                         
            if isempty(ndata.Scatters); inds_S = [];                                                                                                                                                                                  
              else inds_S = inds;                                                                                                                                                                                                     
                if isempty(ndata.Gammas); inds_G = [];                                                                                                                                                                                
                  else inds_G = inds;                                                                                                                                                                                                 
                    if isempty(ndata.Gamma_Energies); inds_GE = [];                                                                                                                                                                   
                      else inds_GE = inds;                                                                                                                                                                                            
                        if isempty(ndata.Alphas); inds_A = [];                                                                                                                                                                        
                          else inds_A = inds;                                                                                                                                                                                         
                            if isempty(ndata.Alpha_Energies); inds_AE = [];                                                                                                                                                           
                              else inds_AE = inds;                                                                                                                                                                                    
                            end                                                                                                                                                                                                       
                        end                                                                                                                                                                                                           
                    end                                                                                                                                                                                                               
                end                                                                                                                                                                                                                   
            end                                                                                                                                                                                                                       
        end                                                                                                                                                                                                                           
      % make cuts to data                                                                                                                                                                                                             
      ndata_ycut = NeutronDataset( ndata.X(inds), ndata.Y(inds), ndata.Z(inds), ndata.T(inds_T), ndata.Scatters(inds_S), ndata.Gammas(inds_G), ndata.Gamma_Energies(inds_GE), ndata.Alphas(inds_A), ndata.Alpha_Energies(inds_AE) );
    end %function                                                                                                                                                                                                                     
    
    % cut on z
    function ndata_zcut = ZCut(ndata, z_min, z_max)                                                                                                                                                                                   
      inds = find( z_min < ndata.Z  &  ndata.Z < z_max );                                                                                                                                                                              
      % make cuts to data                                                                                                                                                                                                             
        if isempty(ndata.T); inds_T = [];                                                                                                                                                                                             
          else inds_T = inds;                                                                                                                                                                                                         
            if isempty(ndata.Scatters); inds_S = [];                                                                                                                                                                                  
              else inds_S = inds;                                                                                                                                                                                                     
                if isempty(ndata.Gammas); inds_G = [];                                                                                                                                                                                
                  else inds_G = inds;                                                                                                                                                                                                 
                    if isempty(ndata.Gamma_Energies); inds_GE = [];                                                                                                                                                                   
                      else inds_GE = inds;                                                                                                                                                                                            
                        if isempty(ndata.Alphas); inds_A = [];                                                                                                                                                                        
                          else inds_A = inds;                                                                                                                                                                                         
                            if isempty(ndata.Alpha_Energies); inds_AE = [];                                                                                                                                                           
                              else inds_AE = inds;                                                                                                                                                                                    
                            end                                                                                                                                                                                                       
                        end                                                                                                                                                                                                           
                    end                                                                                                                                                                                                               
                end                                                                                                                                                                                                                   
            end                                                                                                                                                                                                                       
        end                                                                                                                                                                                                                           
      % make cuts to data                                                                                                                                                                                                             
      ndata_zcut = NeutronDataset( ndata.X(inds), ndata.Y(inds), ndata.Z(inds), ndata.T(inds_T), ndata.Scatters(inds_S), ndata.Gammas(inds_G), ndata.Gamma_Energies(inds_GE), ndata.Alphas(inds_A), ndata.Alpha_Energies(inds_AE) );
    end %function                                                                                                                                                                                                                     
 
    % cut on t                                                                                                                                                                                                                          
     function ndata_tcut = TCut(ndata, t_min, t_max)                                                                                                                                                                                     
       inds = find( t_min < ndata.T  &  ndata.T < t_max );                                                                                                                                                                               
       % make cuts to data                                                                                                                                                                                                               
         if isempty(ndata.T); error 'Cannot cut on T: no T vector.'
           else inds_T = inds;                                                                                                                                                                                                           
             if isempty(ndata.Scatters); inds_S = [];                                                                                                                                                                                    
               else inds_S = inds;                                                                                                                                                                                                       
                 if isempty(ndata.Gammas); inds_G = [];                                                                                                                                                                                  
                   else inds_G = inds;                                                                                                                                                                                                   
                     if isempty(ndata.Gamma_Energies); inds_GE = [];                                                                                                                                                                     
                       else inds_GE = inds;                                                                                                                                                                                              
                         if isempty(ndata.Alphas); inds_A = [];                                                                                                                                                                          
                           else inds_A = inds;                                                                                                                                                                                           
                             if isempty(ndata.Alpha_Energies); inds_AE = [];                                                                                                                                                             
                               else inds_AE = inds;                                                                                                                                                                                      
                             end                                                                                                                                                                                                         
                         end                                                                                                                                                                                                             
                     end                                                                                                                                                                                                                 
                 end                                                                                                                                                                                                                     
             end                                                                                                                                                                                                                         
         end                                                                                                                                                                                                                             
       % make cuts to data                                                                                                                                                                                                               
       ndata_tcut = NeutronDataset( ndata.X(inds), ndata.Y(inds), ndata.Z(inds), ndata.T(inds_T), ndata.Scatters(inds_S), ndata.Gammas(inds_G), ndata.Gamma_Energies(inds_GE), ndata.Alphas(inds_A), ndata.Alpha_Energies(inds_AE) );    
     end %function                                                                                                                                                                                                                       

     % cut on sc                                                                                                                                                                                                                             
      function ndata_scut = ScattersCut(ndata, sc_min, sc_max)                                                                                                                                                                                     
        inds = find( sc_min < ndata.Scatters  &  ndata.Scatters < sc_max );                                                                                                                                                                               
        % make cuts to data                                                                                                                                                                                                               
          if isempty(ndata.T); error 'T values missing.'
            else inds_T = inds;                                                                                                                                                                                                           
              if isempty(ndata.Scatters); 'Cannot cut on Scatters: no Scatters vector.'                                                                                                                                                                                    
                else inds_S = inds;                                                                                                                                                                                                       
                  if isempty(ndata.Gammas); inds_G = [];                                                                                                                                                                                  
                    else inds_G = inds;                                                                                                                                                                                                   
                      if isempty(ndata.Gamma_Energies); inds_GE = [];                                                                                                                                                                     
                        else inds_GE = inds;                                                                                                                                                                                              
                          if isempty(ndata.Alphas); inds_A = [];                                                                                                                                                                          
                            else inds_A = inds;                                                                                                                                                                                           
                              if isempty(ndata.Alpha_Energies); inds_AE = [];                                                                                                                                                             
                                else inds_AE = inds;                                                                                                                                                                                      
                              end                                                                                                                                                                                                         
                          end                                                                                                                                                                                                             
                      end                                                                                                                                                                                                                 
                  end                                                                                                                                                                                                                     
              end                                                                                                                                                                                                                         
          end                                                                                                                                                                                                                             
        % make cuts to data                                                                                                                                                                                                               
        ndata_scut = NeutronDataset( ndata.X(inds), ndata.Y(inds), ndata.Z(inds), ndata.T(inds_T), ndata.Scatters(inds_S), ndata.Gammas(inds_G), ndata.Gamma_Energies(inds_GE), ndata.Alphas(inds_A), ndata.Alpha_Energies(inds_AE) );    
      end %function                                                                                                                                                                                                                       
    


  
  end %methods


end %classdef






