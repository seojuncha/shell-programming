# Shell Script Programming

## Calling commands as many as you want
Simply speaking, *shell programming* is a bunch of shell commands with a control a little. You already have used a various command, like *cd*, *grep* and so on. 

If you want to print the string, "This is shell programming", in your shell, you could enter the command like below.
```shell
$ echo "This is shell programming"
```
Okay, that's very simple. Then now,  let's repeat the string 100 times. How do you do that? 

Here's other example. Now, you have to do more complex job. 
You have a linux service application and you should install and configure it to the server. There's a lot of works to do. 
For instance, copying a execution file and resource files from a local computer to a runnig server, setting or getting some environment variables, print error messages if there is an error... What's your plan to do those jobs?

## Create a script file
The shell script file is runable by shell itself. 
Normally, a file extension of shell script is '.sh'. However, it is not mandantory.
Let's begin with very simple shell script.
```shell
$ touch run.sh
$ sh run.sh     # or "bash run.sh"
```
Great. You have created the first shell script successfully!
In order to run a script file, there are two ways. The first one is to use bash program itself with a script file as an argument, shown in before and the second one is to run the script file alone.
Let me show you the second method.
```shell
$ chmod +x run.sh
$ ./run.sh
```
Note that the script file must have the permission to be run.

Until now, our script file do nothing. right? Eventhough we run the script, there is no output.
Let's put echo command into the run.sh file.
```shell
$ echo "echo hello" > run.sh
$ ./run.sh
hello
```
I have used the redirection, '>', to insert the command, "echo hello" into the run.sh file.

## Variables
Let's talk about ***variables***. What is variables? In programming, the variables is some kinds of a storage that is able to save a data. It might be allocated in computer memory. It means that you are able to keep results of any commands or any values for later use.

```shell
#!/bin/sh
my_var=123
```
That's the first part of using variables.
You should have a variable name with an initialization value, '123' in the above example.
It means that 
```
+----my_var----+
|     123      |
+--------------+
```

<!-- TODO: Formatting rules! -->

At now, how do we know the variable, my_var, has the value, 123, exactly? 
The best simplest way to prove that is to print out the variable.
Let me show you this in the command prompt. We can also use a variable in shell.

```shell
$ my_var=123
$ echo my_var
my_var
```
Above commands are not working as our intution. Why?
The command, 'echo', shows it's arguments by itself as a string literal.

```shell
$ my_var=123
$ echo $my_var
```
Here is the rule to use a shell variable.

```shell
$variable_name     # get a value stored in variable_name
```

### Shadowing variables

__shadow_var.sh__
```shell
#!/bin/sh

var=23
echo "Before shadowing..."
echo $var

var=42
echo "After shadowing..."
echo $var
```
```
Before shadowing...
23
After shadowing...
42
```
## Combine commands with variables
In the previous example, we used a command, echo. We also call any other commands through a script file! Now, let's save the result of the command into a variable.

__commands.sh__
```shell
#!/bin/sh

list_file=`ls`
echo $list_file
```


### (Advanced) echo, quotation marks, and variables


### (Advanced) Variable Scope
Let's see what happens when you're running a infinit loop shell script.
The point of this example is that a new shell is created from a current shell.

```shell
$ ./infinite.sh &
$ ps -auf | grep bash
sjc      204765  0.0  0.0   9392  5548 pts/4    Ss   14:34   0:00 -bash
sjc      219497  0.0  0.0   7896  3728 pts/4    S    15:53   0:00  \_ /bin/bash ./infinite.sh
sjc      219630  0.0  0.0   7008  2144 pts/4    S+   15:54   0:00  \_ grep --color=auto bash
$ sudo kill -9 219497    # Terminate the infinite loop
```

### Environment Variables
Let me show you already defined environment variables in your shell session.<br>

```shell
$ printenv
SHELL=/bin/bash
NAME=AAAA-AAA
LOGNAME=sjc
...
```
Each ouput format is *NAME*=*VALUE* per line. *NAME* is an environment variable name as you expected. 
Environment variables are a kind of special variables widely used in your system.

## (Optional) Operator
As I know, operators in Shell programming are not used commonly.

___arithmetic operators___
```
+, -, *, /, %
```



### (Advanced) Standard Input, Standard Output, Standard Error

## Control (Important!)
Shell scripting supports control statements also like other programming languages. Control statement means that you could control which commands should be executed upon your condition, true or false. The important thing is to use control statements 

__if-then statements format__
```
if [ condition ]               if [ condition ]; then
then                   or          {body}
    {body}                     fi
fi
```

Three things you have to keep in mind.
1. an white space between each of '__[__' and '__]__' characters is needed to be interpreted by shell correctly.
2. If you want to use _then_ in the same line with _if_ statements, semicolon(;) must be added.
3. _fi_ must be added at the end of the condition block.


```
if [condition]    # illegal
if[ condition ]   # illegal
if[condition]     # illegal
if [ condition ]  # legal
```

What is the ___condition___? How do we check it? The _condition_ is actually an expression which is able to evaluated by Shell. Normally, _condition_ contains the expression to compare something. For instance, the expression could compare two numbers, the expression could check the existence of a file or a directory.

You can find a various expresison operators by using below command.

```shell
$ man test
```

It might be hard to remember all operators.



Let's do with a little more complex scenarios. 

__if-then-else statements format__
```shell
if [ condition ]; then
    {if-body}
else
    {else-body}
fi
```

__if-then-elif-else statements format__
```shell
if [ conditon1 ]; then
    {if-body}
elif [ condition2 ]; then
    {elif-body}
else
    {else-body}
fi
```

### (Optional) test vs []
__condition/test.sh__ and __condition/if.sh__


### Use a logical operator within test

### Various type of expressions


## Taking an argument as an variable
We have seen a few examples about output. 

By now, we assign and use a variable in the shell script file. The problem is,
> How do we change a compareble value at running a shell script?

To do that, Shell provides the method to take an user input by the command prompt.

__io/argv.sh__
```shell
echo "The command name: $0"
echo "The first argument: $1"
echo "The second argument: $2"
```
```shell
$ sh argv.sh
The command name: argv.sh
The first argument:
The second argument:

$ sh argv.sh 123
The command name: argv.sh
The first argument: 123
The second argument:

$ sh argv.sh 123 "zoo"
The command name: argv.sh
The first argument: 123
The second argument: zoo
```

### (Advanced) Special argument variables
__io/argv2.sh__
```shell
#!/bin/sh

echo -n "The number of arguments: "
echo $#

echo -n "All of arguments: "
echo $*

echo -n "Run 'whoamyou': "
whoamyou
echo $?

echo -n "Run 'whoami': "
whoami
echo $?
```
Run this script with two arguments.
```shell
$ ./argv2.sh 123 56
The number of arguments: 2
All of arguments: 123 56
Run 'whoamyou': ./argv2.sh: 10: whoamyou: not found
127
Run 'whoami': yourname
0
```

__case statements format__

```
case {variable} in
    {pattern-1})
        {statements-1}
        ;;
    {pattern-2})
        {statements-2}
        ;;
    *)
        {statements-3}
        ;;
esac
```

First, try to find {pattern-1} in {variable}. If there is a matched pattern in the variable, 


## Loop

__for loop format__
```
for {var} in {array}; do
    {statements}
done
```
Note that, _var_ is a variable which is alive out of the for loop also.



## Function
Definition and usage

```
funcion_name()
{
    {statements}
}
```

## Exit



## (Advanced) Source (.)



## (Optional) sh vs dash vs bash

## (Appendix) Test Operators Summary

__string compare__
> condition/compare_string.sh

| format | description |
|--------|-------------|
| -n _STRING_ |  |
| -z _STRING_ |  |
| _STRING1_ == _STRING2_ |  |
| _STRING1_ != _STRING2_ |  |

__number(integer) compare__
> condition/compare_number.sh

| format | symbolic | note |
|--------|-------------|----------------|
| _NUMBER1_ -eq _NUMBER2_ | _NUMBER1_ == _NUMBER2_ | **eq**ual|
| _NUMBER1_ -ne _NUMBER2_ | _NUMBER1_ != _NUMBER2_ | **n**ot **e**qual|
| _NUMBER1_ -gt _NUMBER2_ | _NUMBER1_ > _NUMBER2_ | **g**reater **t**han|
| _NUMBER1_ -ge _NUMBER2_ | _NUMBER1_ >= _NUMBER2_ | **g**reater than & **e**qual to|
| _NUMBER1_ -lt _NUMBER2_ | _NUMBER1_ < _NUMBER2_ | **l**ess **t**han|
| _NUMBER1_ -le _NUMBER2_ | _NUMBER1_ <= _NUMBER2_ | **l**ess than & **e**qual to|

__file or directory existence__
> condition/existence_file.sh

| format | description | note |
|--------|-------------|----------------|
| -e _FILE_ | _FILE_ exists? | **e**xists |
| -d _FILE_ | _FILE_ exists? and directory? | **d**irectory exists |
| -s _FILE_ | _FILE_ exists? and size > 0? | has **s**ize |

__file or directory permission__
> condition/permission_file.sh

| format | description |
|--------|-------------|
| -r _FILE_ | _FILE_ exists? and readable?|
| -w _FILE_ | _FILE_ exists? and writeable? |
| -x _FILE_ | _FILE_ exists? and executable? |

__file or directory compare__
> condition/compare_file.sh

| format | description |
|--------|-------------|
| _FILE1_ -ef _FILE2_ | _FILE1_ is equal to _FILE2_? |
| _FILE1_ -nt _FILE2_ | _FILE1_ is newer than _FILE2_? |
| _FILE1_ -ot _FILE2_ | _FILE1_ is older than _FILE2_? |