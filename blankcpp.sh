#!/bin/bash
if [ $# -gt 0 ]  #check for input, if there is, start making Makefile
then
  filename=$1
  author='Jack Ramey'
  email='jtramey@ucdavis.edu'
  thedate=`date +"%B %d, %Y, %I:%M %p"`
  echo '// File:   '$filename                                    > $filename
  echo '// Author: '$author                                     >> $filename
  echo '// Created on '$thedate                                 >> $filename
  echo '// University of California, Davis'                     >> $filename
  echo '// Any use of this code without the permission of the'  >> $filename
  echo '// author is prohibited. If you would like to use the'  >> $filename
  echo '// code in full or in part, please contact '$author     >> $filename
  echo '// at '$email                                           >> $filename
  echo >> $filename
  echo >> $filename
else  #if no input, display usage statement in standard error output
  echo "File name required." >&2
  echo "usage: blankcpp.sh filename.cpp" >&2
fi

