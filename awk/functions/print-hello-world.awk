#!/usr/bin/awk -f

function print_hello_world()
{
    print "hello world"
}

BEGIN {
    print_hello_world()
}