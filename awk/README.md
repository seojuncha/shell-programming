# awk
***awk*** is a programming language as well as a utility program. *awk* is data-driven language. You have to describe the data you want to work, then do action you want when awk find the data. For that reason, *awk* syntax makes sense. There is a pattern to find a matching line, and also actions what do you want. Until now, it may be similar with *sed*. However, *awk* provides more flexible way as a programming language.

## Syntax
> awk 'pattern {action}' filename

'pattern {action}' is a small program. 

*pattern* part is similart with 'sed'.


## Input & Output

Compare these two examples.
```shell
$ awk '{ print "Hello~" }'

$ awk 'BEGIN { print "Hello~" }'
Hello~
```


## Operators

## Control statements

## Built-in Variables

## Functions

## Resources
GNU Manual: https://www.gnu.org/software/gawk/manual/gawk.html