#!/bin/sh


echo "simple echo" | grep "a"

if [ $? -eq 0 ]; then
  echo "success command before"
else
  echo "failed command: $?"
fi
