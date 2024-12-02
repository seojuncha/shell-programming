#!/bin/sh
VAR=123
func() {
   local VAR="abc" 
   echo $VAR
}

func
echo $VAR

