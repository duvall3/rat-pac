#!/bin/bash
# conflog -- brief script to record experiment & run configurations
# ~ Mark J. Duvall ~ mjduvall@hawaii.edu ~ July 2015 ~ #

cat ./*.geo
echo -e "\n\n# # # # #\n\n"
cat ./setup.mac
echo -e "\n\n# # # # #\n\n"
cat ./init.mac

exit 0
