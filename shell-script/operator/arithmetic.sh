#!/bin/bash

num1=5
num2=6

## Try below also!
# num1="5"
# num2="6"

echo -n "Addition: "
sum=$(($num1 + $num2))
echo "$num1 + $num2 = $sum"

echo -n "Subtraction: "
sub=$(($num1 - $num2))
echo "$num1 - $num2 = $sub"

echo -n "Multi: "
multi=$(($num1 * $num2))
echo "$num1 * $num2 = $multi"

echo -n "Divide: "
div=$(($num1 / $num2))
echo "$num1 / $num2 = $div"

echo -n "Mod: "
mod=$(($num1 % $num2))
echo "$num1 % $num2 = $mod"