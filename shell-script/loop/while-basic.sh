#!/bin/sh

echo "Use a test command"
num=1
while [ $num -le 10 ]; do
  echo $num
  num=$(($num + 1)) 
done

echo "Use a numeric compare"
num=1
while (($num <= 10)); do
  echo $num
  num=$(($num + 1)) 
done
