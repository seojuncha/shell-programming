#!/bin/bash

HOME_DIR=/Users/csj

if [[ $HOME_DIR = $HOME ]]; then
  echo "same home dir"
fi

if [[ $HOME_DIR == $HOME ]]; then
  echo "also same home dir"
fi
