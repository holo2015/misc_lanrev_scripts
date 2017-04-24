#!/bin/sh
for PRINTER in `lpstat -v | cut -d ' ' -f 3 | tr -d ':'`
do
  lpadmin -x $PRINTER
  echo "Deleted $PRINTER"
done


lpstat -v | cut -d ' ' -f 3 | tr -d ':'
