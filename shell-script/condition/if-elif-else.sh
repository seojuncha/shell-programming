#!/bin/sh

num=9

if [ $num -lt 5 ]; then
  echo "num is less than 5"
elif [ $num -gt 5 ]; then
  echo "num is greater than 5"
else
  echo "num is 5!"
fi
