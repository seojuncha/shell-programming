#!/bin/bash

i=0

## Version 1
while [ $i -lt 10 ]
do
    echo "i = $i"
    i=$(($i + 1))
done

i=0
## Version 2
while (($i < 10))
do
    echo "i = $i"
    i=$(($i + 1))
done