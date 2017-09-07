function [ pxl ] = drawpixel ( P, N, S, C )

% draw a square on the current axes, centered at P, normal to direction N, having size S & color C

% Details:
% -- P is a 3-element vector, [ X Y Z ]
% -- N is a string, 'x' | 'y' | 'z', indicating which axis is normal to the plane of the pixel
% -- S is a scalar indicating the side length of the pixel in ??UNITS??
% -- C is a color specification: a short string 'c', a long string 'color', a 3-element vector [ R G B ], or a scaled index for the current colormap
% -- Planned fixes/improvements: set units for pixel size (& location); determine normal vector from location P, based on mTC
%
% ~ Author: Mark Duvall ~ mjduvall@hawaii.edu ~ Univ. of Hawai'i Dept. of Physics ~ miniTimeCube project ~ April 2014 ~ Last updated: 5/7/'14


% get center
X = P(1);
Y = P(2);
Z = P(3);


% define unit vectors
%i = [ 1 0 0 ]; j = [ 0 1 0 ]; k = [ 0 0 1 ];
% create unit-vector matrix
A = eye(3);

% get orientation
if 	strcmpi( N, 'x' );	n = 1;
elseif 	strcmpi( N, 'y' );	n = 2;
elseif 	strcmpi( N, 'z' );	n = 3;
else 	error('Invalid argument: N must be one of "x","y","z".');
end

% set which spatial index {1,2,3} will correspond to {i,j,k}
index_i = 1 + mod( n-1, 3 );
index_j = 1 + mod( n , 3 );
index_k = 1 + mod( n+1, 3);

% define unit vectors
unit_i = A(index_i,:);
unit_j = A(index_j,:);
unit_k = A(index_k,:);

% generate vertices; each vertex is located S/2 away from P in the j & k directions:
% vertex = P +/- (S/2) unit_j +/- (S/2) unit_k
%% 	-- for RH rotation, expand in order -- +- ++ -+  (not that it matters)
verts = [   P + (S/2) * ( -unit_j - unit_k )  ;  P + (S/2) * ( unit_j - unit_k )  ;  P + (S/2) * ( unit_j + unit_k )  ;  P + (S/2) * ( -unit_j + unit_k )   ];

% draw the pixel using the "patch" function
pxl = patch ( verts(:,1), verts(:,2), verts(:,3), C, 'LineStyle', 'none' );


%endfunction
