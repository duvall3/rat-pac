" #!/usr/bin/vim
" set IBD source angle in gen/ibd.mac
" ~ Mark J. Duvall ~ duvall3@github.com ~ 09/2022 ~ "

"Copyright (C) 2022 Mark J. Duvall
"
"    This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 3 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.

" init
let s:phi_new = g:phi
let s:re_all = "neutrinos angled [[:digit:]]\+ deg"
let s:re_new = printf("neutrinos angled %02d deg", s:phi_new)
let s:errstr = "ERROR: Parameters for requested angle not found. Exiting without changes."
let s:errcmd = printf("!echo %s 1>&2", s:errstr)

" main
%s_^\(\s*\/generator\/vtx\/set\)_#\1_
let s:N_new = search(s:re_new)
if s:N_new == 0
  echoerr s:errstr
  exe s:errcmd
  q!
else
  s_^\s*#\+\s*__
endif

" all pau!   )
wq
