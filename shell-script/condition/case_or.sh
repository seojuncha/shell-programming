#!/bin/sh

country=korea

case $country in 
  korea|japan)
    echo "country is korea or japan"
    ;;
  us)
    echo "country is us"
    ;;
  *)
    echo "unknown country"
    ;;
esac
