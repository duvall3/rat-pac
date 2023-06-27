#!/usr/bin/vim -Esc:source%
" change_subfigures.vim -- vimscript to (hopefully) fix conflict between
"   revtex and various (sub)figure/caption pkgs

" init
let s:texfiles=globpath( getcwd(), '*.tex', 1, 1 )
let s:begin_old='begin{subfigure}'
let s:begin_new='subfloat{'
let s:end_old='\\end{subfigure}'
let s:end_new='}'

" loop over files
" set viminfo=""
" set verbose=1
for s:filename in s:texfiles 
  " open file
  exe printf("e %s", s:filename)
  " make substitution
  let s:subst_begin=printf('%%s/%s/%s/eg', s:begin_old, s:begin_new)
  let s:subst_end=printf('%%s/%s/%s/eg', s:end_old, s:end_new)
  exe s:subst_begin
  exe s:subst_end
  " save
  w
endfor
" set verbose=0
qall

" all pau!   )
