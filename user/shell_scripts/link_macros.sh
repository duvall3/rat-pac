#!/bin/bash
# link_macros.sh -- because I want this to be even easier

if [[ $# -lt 1 ]]; then
  echo "USAGE: link_macro.sh <MACRONAME>"
  exit 2
fi

for FILE in $@; do
  ln -s $(pwd -P)/$FILE $ROOTSYS/macros
done

# all pau!   )
exit $?
