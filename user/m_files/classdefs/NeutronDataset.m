% NeutronDataset -- class for analyzing data from neutron captures
% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ August 2015 ~ %



classdef NeutronDataset


  %% Properties

  properties % inputs -- just {x,y,z} for now

    X
    Y
    Z
%   T
%   Scatters
%   Agents
%   Gammas
%   Gamma_Energies
%   Alphas
%   Alpha_Energies

  end %properties -- inputs
  
  properties (Dependent=true, SetAccess=private) % derived from inputs
    
    N
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

    % constructor
    function ndata = NeutronDataset( x, y, z )
      if nargin > 0 % support calling w/o arguments
        ndata.X = x;
        ndata.Y = y;
        ndata.Z = z;
      end %if
    end %function
    
    % number of events
    function n = get.N(ndata)
      if ( length(ndata.X)==length(ndata.Y) && length(ndata.Y)==length(ndata.Z) )
        n = length(ndata.X);
      else
        error '\nVectors x, y, z must all have the same length.\n\n'
      end %if
    end %function
    
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

  end %methods


end %classdef






