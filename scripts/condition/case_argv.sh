#!/bin/sh

case $1 in
  -h)
    echo "Help"
    ;;
  -r)
    echo "Run"
    ;;
  *)
    echo "Usage: ./case_argv.sh [option]"
    ;;
esac
