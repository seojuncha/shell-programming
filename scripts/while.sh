#!/bin/sh


INPUT_STRING=hello
while [ "$INPUT_STRING" != "bye" ]
do
  echo "Type something(bye to quit)"
  read INPUT_STRING
  echo "typed: $INPUT_STRING"
done

# infinite loop
# while :
# do
#   something
# done
