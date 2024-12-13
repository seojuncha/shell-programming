#!/bin/bash


STR="hi"

test $STR
echo $?

test -z $STR
echo $?

test -n $STR
echo $?
