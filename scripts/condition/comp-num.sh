#!/bin/bash

num1=9
num2=99

# Using 'test' command
if [[ ! $num1 -eq $num2 ]]; then
  echo "not same number"
fi

if (($num1!=$num2)); then
  echo "also not same number"
fi
