function [ MOV ] = animate_frames( infilename_pattern, informat )

% [ MOV ] = animate_frames( infilename_pattern, informat ) -- function to generate an animation from a collection of image files

% -- 'MOV' is a structure array of frames, with fields "cdata" and "colormap"
% -- 'infilename_pattern' is a string describing the collection of input files, assuming numerical indices
% -- 'informat' is the image format of the input files
% -- Example, for imput files frame0.png, frame1.png, etc.: M = animate_frames( 'frame', 'png' );
% ~ Mark J. Duvall ~ duvall3.git@gmail.com ~ 05/2022 ~ %

%Copyright (C) 2022 Mark J. Duvall / T. Rocks Science
%
%    This program is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.
%
%    This program is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.
%
%    You should have received a copy of the GNU General Public License
%    along with this program.  If not, see <http://www.gnu.org/licenses/>.

% init
pkg load video
instr = sprintf("%s*.%s", infilename_pattern, informat);
filelist = ls(instr);
f = figure;
W = VideoWriter("output.avi");

% main
for k = [1:length(filelist)]
  h = imshow(filelist(k,:));
  MOV(k) = getframe();
  W.writeVideo(MOV(k));
end

% preview
clf(f);
movie(MOV, 1, 24);

% all pau!   )
endfunction
