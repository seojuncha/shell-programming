#!/bin/sh

echo -n "The number of arguments: "
echo $#

echo -n "All of arguments: "
echo $*

echo -n "Run 'whoamyou': "
whoamyou
echo $?

echo -n "Run 'whoami': "
whoami
echo $?
