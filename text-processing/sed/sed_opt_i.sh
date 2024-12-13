#!/bin/bash

echo "-i option with backup"
sed -i.bak 's/old/new/g' file.txt

echo "-i option with other extension"
sed -i.backup 's/old/new/g' file.txt

echo "-i optino without backup"
sed -i 's/old/new/g' file.txt
