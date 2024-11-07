#!/bin/bash

echo -en "Enter my name: [`whoami`] "
read myname
echo "your name1: ${myname:-`whoami`}"

if [ -z $myname ]; then
  myname=`whoami`
fi
echo "your name: $myname"
