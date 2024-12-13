#!/bin/sh

var=23
echo "Before shadowing..."
echo $var

var=42
echo "After shadowing..."
echo $var
