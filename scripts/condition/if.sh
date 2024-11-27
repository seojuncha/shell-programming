#!/bin/sh

num=9

echo "Compare numbers using if and []."
if [ $num -lt 10 ]; then
  echo "num is less than 10"
fi
echo

echo "Compare numbers using if and test."
if test $num -lt 10; then
  echo "num is less than 10"
fi
echo

echo "Compare numbers using test."
test $num -lt 10 && echo "num is less than 10"
echo

echo "Compare numbers using []."
[ $num -lt 10 ] && echo "num is less than 10"
echo
