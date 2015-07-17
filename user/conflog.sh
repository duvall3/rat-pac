#!/bin/bash
# conflog -- brief script to record experiment & run configurations

cat ./*.geo
echo -e "\n\n# # # # #\n\n"
cat ./setup.mac
echo -e "\n\n# # # # #\n\n"
cat ./init.mac
