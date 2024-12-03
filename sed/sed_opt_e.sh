#!/bin/bash

echo ">>> Without -e option"

# Invalid syntax
sed 's/old/new/' 's/old/new/' file.txt

echo "First call"
sed 's/old/new/' file.txt

echo "Second call"
sed 's/old/new/' file.txt

echo ">>> With -e option"
sed -e 's/old/new/' -e 's/old/new/' file.txt
