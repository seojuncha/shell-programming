#!/bin/sh
num=1
while [ $num -le 10 ]; do
  num=$(($num + 1)) 
  if [ $num -le 5 ]; then
    continue
  fi
  echo $num
done

