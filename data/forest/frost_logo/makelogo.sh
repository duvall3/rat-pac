#!/bin/bash
# makelogo.sh -- EWISotT
ASYFILE=frost_logo.asy
asy $ASYFILE
EXIT_STATUS=$?
if grep -E "bool\s+kOutputPNG\s*=\s*true" $ASYFILE | grep "^\s*/[/\*]" > /dev/null; then
  exit $EXIT_STATUS
fi
convert -resize '256x256' frost_logo.png frost_logo_256x256.png
convert -resize '100x100' frost_logo.png frost_logo_100x100.png
convert -resize '64x64' frost_logo.png frost_logo_64x64.png
convert -resize '32x32' frost_logo.png frost_logo_32x32.png
/usr/bin/cp frost_logo_32x32.png favicon.png
eog frost_logo*.png &
exit $EXIT_STATUS
