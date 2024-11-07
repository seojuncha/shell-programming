#!/bin/bash

print_hello()
{
  echo "Hello~"
}

add()
{
  echo "input number: $1 $2"
  #sum=$1+$2   # Have know why it is not working as we expected.
  sum=`expr $1 + $2`
  echo "sum: $sum"
}

advanced_add()
{ 
  echo "input number: $1 $2"
  echo "number count: $#"
  num_param=$#
  if [ $num_param -lt 2 ]; then
    echo "Need more number."
    exit
  elif [ $num_param -ge 3 ]; then
    echo "Two numbers are allowed at most."
    exit
  fi

  sum=`expr $1 + $2`
  echo "sum: $sum"
}


print_hello
add 3 4

advanced_add 1 2
#advanced_add 1 
#advanced_add 1 2 3

echo "$num_param"
