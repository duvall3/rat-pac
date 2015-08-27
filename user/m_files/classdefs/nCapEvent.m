% nCapEvent -- class for neutron-capture events
%  -- properties: X, Y, Z, %Volume, Time, Scatters, Agent, Gammas, Gamma_Energy, %Alphas, %Alpha_Energy

classdef nCapEvent

  properties
    X
    Y
    Z
    %Volume
    Time
    Scatters
    Agent = '';
    Gammas
    Gamma_Energy
%   Alphas
%   Alpha_Energy
  end %properties
  
  methods
    function event = nCapEvent( x, y, z, t, sc, ag, gam, gam_e )
      if nargin > 0 % support calling with zero args (create empty object)
        event.X = x;
        event.Y = y;
        event.Z = z;
%       event.Volume = vol;
        event.Time = t;
        event.Scatters = sc;
        event.Agent = ag;
        event.Gammas = gam;
        event.Gamma_Energy = gam_e;
%       event.Alphas = alph;
%       event.Alpha_Energy = alph_e;
      end %if
    end %function
  end %methods

end %classdef
