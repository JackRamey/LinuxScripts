#! /bin/bash
#Author: Jack Ramey
#This shell script creates a basic Makefile for coding with OpenGL
#It does not use -Wall or -ansi so no warnings will pop up, you're
#on your own for those.

if [ $# -gt 0 ]  #check for input, if there is, start making Makefile
then
  executableName=$1
  shift
  args=$@
  echo -n "$executableName: "
  for filename in *.cpp; do  #gathering all the .cpp files in current directory and changing the extension to .o
    leftname=`basename $filename .cpp`
    echo -n "${leftname}.o "
  done
  echo -en "\n\tg++ -lGL -lglut -g -o $executableName $args "
  for filename in *.cpp; do  #gathering all the .cpp files in current directory and changing the extension to .o
    leftname=`basename $filename .cpp`
    echo -n "${leftname}.o "
  done
  echo
  for filename in *.cpp; do
    leftname=`basename $filename .cpp`
    echo -en "\n${leftname}.o: $filename "
    headers=`awk '/^#include  *\"/ {print $2}' $filename | sed s/\"//g` 
    echo $headers
    echo -e "\tg++ -g -c $args $filename"
  done
  echo
  echo "clean: "
  echo -en "\trm -f $executableName "
    for filename in *.cpp; do  #gathering all the .cpp files in current directory and changing the extension to .o
    leftname=`basename $filename .cpp`
    echo -n "${leftname}.o "
  done
  echo
  echo "remake: clean "$executableName
  echo
else  #if no input, display usage statement in standard error output
  echo "Executable name required." >&2
  echo "usage: makemake.sh executable_name" >&2
fi > Makefile

