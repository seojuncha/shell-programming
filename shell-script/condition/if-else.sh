#!/bin/sh

num=14

echo "-- Using if-else --"
if [ $num -lt 10 ]; then
  echo "num is less than 10"
else
  echo "num is grater than or equal to 10"
fi
echo "End of if-else statement"


echo "-- Using if only --"
if [ $num -lt 10 ]; then
  echo "num is less than 10"
fi
echo "End of if statement"

