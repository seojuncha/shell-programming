#!/bin/bash


NUM=9
MAN=10
VAR="hello"

test \( $NUM -eq 10 -a "$MAN -eq 10" \) -a -n "$VAR"
echo $?

# \( $NUM -eq 10 -a "$MAN -eq 10" \)  -> false
# $NUM -eq 10 -> false
# $MAN -eq 10 -> true

# test false -a -n "$VAR" -> false -a true -> false
# -n "$VAR" -> true
