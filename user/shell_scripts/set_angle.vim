#!/usr/bin/vim -Esc:source%
" set IBD source angle in gen/ibd.mac
" -- Call directly from the shell prompt as follows:
"      set_angle.vim <FILE> <ANGLE>
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

" arg check
let s:usage = 'Usage: set_angle.vim \<FILE\> \<ANGLE\>'
let s:shellusg = printf("!echo %s 1>&2", s:usage)
if ( argc() != 3 )
  echon s:usage
  exe s:shellusg
  qall!
else
  let s:filename = argv(1)
  let s:phi = str2nr(argv(2))
endif

" file check
let s:FileWriteCheck = filewritable(printf("%s", s:filename))
if ( s:FileWriteCheck != 1 )
  let s:NotFoundMsg = printf("Error: File \"%s\" not found.", s:filename)
  echoerr s:NotFoundMsg
  exe printf("!echo '%s' 1>&2", s:NotFoundMsg)
  q!
endif

" define function
" function SetAngle( file = "gen/ibd.mac", phi = 0 )
" ^ removing default arguments for compatibility with the mtc server
function SetAngle( file, phi )
  " init
  let l:re_new = printf("neutrinos angled 0*%d deg", a:phi)
  let l:errstr = "ERROR: Parameters for requested angle not found. Exiting without changes."
  let l:errcmd = printf("!echo %s 1>&2", l:errstr)
  " main
  " open file:
  exe printf("edit %s", a:file)
  " turn off all /generator/vtx/set lines:
  %s_^\(\s*\/generator\/vtx\/set\)_#\1_
  " find line containing requested angle:
  let l:N_new = search(l:re_new)
  " if desired line is not found, exit without modifying file:
  if l:N_new == 0
    echoerr l:errstr
    exe l:errcmd
    q!
  " if desired line is found, uncomment it:
  else
    s_^\s*#\+\s*__
  endif
  " save and exit:
  wq
endfunction

" call function
call SetAngle( s:filename, s:phi )

" all pau!   )
q!
