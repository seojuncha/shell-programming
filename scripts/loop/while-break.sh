#!/bin/sh
num=1
while [ $num -le 10 ]; do
  echo $num
  num=$(($num + 1)) 
  [ $num -eq 5 ] && break
done

