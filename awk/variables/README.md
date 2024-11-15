# Variables
A ***variable*** is one of the most important element in programming.

## Assignment
```shell
$ awk 'BEGIN {a=5; print a}'
5
$ awk 'BEGIN {w="world"; print w}'
world
```
To assign a value to a variable is like other C-style languages.
> {variable name}={value}

## Use variables with operators
Here is a command to add two integer variables.
```shell
$ awk 'BEGIN {a=5;b=2; print "(a+b)="(a+b)}'
(a+b)=7
```
> [!NOTE]
> Multiple statements in one line SHOULD be seperated by semicolon, ','.



## Predefined Variables
There are huge pre-defined variables in 'awk'. Don't and Can't remember all the variables in my memory. The important thing I think is how to use it and what does it mean. Let me show you examples a little.

#### ARGC and ARGV
***ARGC*** indicates the number of command-line arguments including 'awk' execution name. Note that I use the variable, ARGC, with BEGIN operator because ARGC is not part of command rule so it isn't evaluated from input data.
```shell
$ awk 'BEGIN {print "arguments count =", ARGC}' one two three
arguments count = 4
```

#### ENVIRON
***ENVIRON*** is for an environment variable.
```shell
$ awk 'BEGIN {print ENVIRON["USER"]}'
eddie
```
> [!TIP]
> All environment variables are shown by ***env*** or ***printenv*** command.

#### FS and RS
***FS*** is for field seperator and ***RS*** is for record seperator. 
```shell
$ awk 'BEGIN {print "FS=" FS}' | cat -A
FS= $
$ awk -F, 'BEGIN {print "FS=" FS}' | cat -A
FS=,$

$ awk 'BEGIN {print "RS=" RS}' | cat -A
RS=$
$
```

#### NF and NR
***NF*** is th number of fields and ***NR*** is the number or records.
```shell
```


## Resources
https://www.gnu.org/software/gawk/manual/html_node/All-Operators.html