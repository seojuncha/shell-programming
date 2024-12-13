# Function

***Function*** is a basic building block of programming like variables.

```
function-name()
or
function-name(parameters)
```

## Built-in Functions
Let's begin with how a function is called in 'awk' programming. 

```shell
$ awk 'BEGIN { print rand() }'
0.924046
```

### String manipulation
As I think, functions to process a string is more commonly used for system administrators or programmers to manage a system.

#### Length
```shell
$ awk 'BEGIN {print length("abc")}'
3
```
See more examples in this directory.


## User-Defined Functions
Functions could be defined by myself also. 
```
function function-name(parameters)
{
    statements
}
```

```shell

```