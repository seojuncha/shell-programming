#!/usr/bin/awk -f

BEGIN {
    print "Print a string variable"

    string_val = "shell"
    print length(string_val)

    print "Now, print a number variable"

    num_val = 0
    print length(num_val)

    num_val = 10*10
    print length(num_val)

    num_val = 10*100
    print length(num_val)

    num_val = 10*1000
    print length(num_val)
}