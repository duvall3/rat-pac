function showfunc(NAME)
% -- showfunc NAME
%     Display the first line of the definition file for function NAME.

% ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ 02/2023 ~ %

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

S = "";
% printf("NAME = \"%s\"\n", NAME); %debug
% typeinfo(NAME) %debug
FILE = sprintf("%s.m", NAME);
FILENAME = file_in_loadpath(FILE);
S = fileread(FILENAME);
S = S( 1 : index(S,"\n") );
S = regexprep(S, "function ", "");
S = regexprep(S, "\n", "");
% coldisp(NAME, FILENAME, FILE, S); %debug
disp(S)

% all pau!   )
endfunction
