#!/usr/bin/vim -Esc:source%
" change_subfigures.vim -- vimscript to (hopefully) fix conflict between
"   revtex and various (sub)figure/caption pkgs

" init
let s:texfiles=globpath( getcwd(), '*.tex', 1, 1 )
let s:orig_string='subfigure'
let s:new_string='subfloat'

" loop over files
" set viminfo=""
" set verbose=1
for s:filename in s:texfiles 
  " open file
  exe printf("e %s", s:filename)
  " make substitution
  let s:subst_command=printf('%%s/%s/%s/eg', s:orig_string, s:new_string)
  exe s:subst_command
  " save
  w
endfor
" set verbose=0
qall

" all pau!   )
