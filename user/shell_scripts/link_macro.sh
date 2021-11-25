#!/bin/bash
# link_macro.sh -- because I want this to be even easier

if [[ $# -lt 1 ]]; then
  echo "USAGE: link_macro.sh <MACRONAME>"
  exit 2
fi

ln -s $(pwd)/$1 $ROOTSYS/macros

# all pau!   )
exit 0
