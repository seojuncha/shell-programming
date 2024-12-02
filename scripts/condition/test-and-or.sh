#!/bin/sh

# -a: and operation
test -n "abc" -a -n "def"
echo $?

test -n "abc" -a -z "def"
echo $?

# -o: or operation
test -n "abc" -o -n "def"
echo $?

test -n "abc" -o -z "def"
echo $?

