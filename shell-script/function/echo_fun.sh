#!/bin/sh

my_echo()
{
  echo "This is my echo function"
}

my_echo_param()
{
  echo "called with $1"
}

my_echo
my_echo_param "hello wordl"
