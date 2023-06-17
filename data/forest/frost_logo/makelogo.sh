#!/bin/bash
asy frost_logo.asy
EXIT_STATUS=$?
convert -resize '256x256' frost_logo.png frost_logo_256x256.png
convert -resize '100x100' frost_logo.png frost_logo_100x100.png
eog frost_logo*.png
exit $EXIT_STATUS
