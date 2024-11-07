#!/bin/sh

F="functi"

case $F in
  "function") echo "function" ;;
  "variable") echo "variable" ;;
  *) echo "nothing: $F" ;;
esac

