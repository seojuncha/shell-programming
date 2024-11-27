#!/bin/sh

arr="a b c d"
echo $arr

for a in $arr; do
  echo $a
done

echo -n "Try to access the variable, a: "
echo $a
