#!/bin/sh

num=2

[ $num -eq 1 ] && echo "num is one!"


if [ $num -eq 1 ]; then 
  echo "num is 1"
elif [ $num -eq 2 ]; then
  echo "num is 2"
else
  echo "num is : $num"
fi


echo "$X is a file"

[ $X = "/etc/hosts" ] && echo "matched!"
[ -f $X ] && echo "is a file"
[ -d $X ] && echo "is a directory"
