#!/bin/bash

VAR=""

test $VAR
echo $?

test -z $VAR
echo $?

test -n $VAR
echo $?
