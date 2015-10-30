function theta = atan_full( opp, adj )
% atan_full -- arctangent(opp/adj) that tests inputs & adjusts for quadrant to return answer in [-180 +180]
% Mark J. Duvall ~ mjduvall@hawaii.edu ~ October 2015 ~ %

% opp = "opposite" (perpendicular); adj = "adjacent" (parallel)

if adj >= 0
  theta = atan( opp / adj );
else
  if opp >= 0
    theta = atan( opp / adj ) + pi;
  else
    theta = atan( opp / adj ) - pi;
  end
end

end %function
