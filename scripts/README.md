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

The other way to save the result of a command,
```shell
#!/bin/sh
list_file=$(ls)
echo $list_files
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


### Use logical operators
How to use logical operators, like AND or OR in Shell programming?
Firstly, let's combine commands with a logical operator.

__&&__

If the **$$** operator is used between two commands, the second command would be executed only if the first command is done successfully, which means the return, exit value should be zero.

```shell
$ ehco "print file list" && ls
print file list
# ls
```
The other operator, **||** provides the opposite way of && operator. 
The condition to execute the second command is that the first command should be failed. 
It means that the most common case of using _||_ operator is the error check.

```shell
$ ee "print file list" || ls
# show ls
```

You can also use logical operators in the _test_ command with _if_ statement. 

| AND | OR |
| -- | -- |
| -a | -o |

That's a very intuitive character. Isn't it? Let me show you a simple example to present how to use.

```shell
$ num1=10
$ num2=9
$ test $num1 -gt $num2 -a $num1 -eq 10
$ echo $?
0
$ test $num1 -gt $num2 -a $num1 -eq 9
$ echo $?
1
```

### Other ways to compare numbers and strings

> sample files: comp-str.sh, comp-num.sh


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

__GLOB Pattern__
| pattern | description | example |
| -- | -- | --|
| * | |
| ? | |
| [] | |
| {} | |


## Loop

### Using for loop

__for-basic.sh__
```shell
#!/bin/sh
for i in 1 2 3; do
  echo $i
done
```

**for** _variable_ **in** _value1_ _value2_ ... _valueN_**;** **do**<br>
: _variable_ will be assigned by from _value1_ to _valueN_ sequentially. For instance, in the first loop, _variable_ has _value1_, then in the second loop, _variable_ has _value2_, and so on.
Note that the defualt variable scope is global so _variable_ assigned in the for loop could be used out of the loop block.

**done** <br>
: Indicate the end of the for loop

Uset the for loop with the shell command, ls to list files in the current directory.
```shell
#!/bin/sh
for file in $(ls); do
  echo "--- $file"
done
```
The result of __$(ls)__ is all of the name of files. For instance, file1.txt, file2.txt. so this sentence, ___for file in $(ls)___ is same with ___for file in file1.txt file2.txt___. As the result, the variable, file, has file1.txt then file2.txt.


### Using while loop
```shell
#!/bin/sh
num=1
while [ $num -le 10 ]; do
  echo $num
  num=$(($num + 1))
done
```
**while** *condition*;  **do**
: The *condition* is same expression used in if-then statements.
**done**


> [!TIP]
> In order to indicate the start and the end of the loop, ___do-done___ is used. Don't be confused with if-then-fi.

### break
```shell
#!/bin/sh
num=1
while [ $num -le 10 ]; do
  echo $num
  num=$(($num + 1))

  [ $num -eq 5 ] && break
done
```

### continue
```shell
#!/bin/sh
num=1                           # assign 1 to the variable, num.
while [ $num -le 10 ]; do       # Check the variable, num, is less than or equal to 10.
  num=$(($num + 1))             # Increate the num by 1.
  if [ $num -le 5 ]; then       # If the variable, num is less than or equal to 5, 
    continue                    # back to the condition statements of while loop.
  fi
  echo $num                     # Print the variable, num.
done                            # End of the loop block
```

| loop count | num before while | while condition | num before if | if condition | echo? |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 1 | 1 | true | 2 | true | no |
| 2 | 2 | true | 3 | true | no |
| 3 | 3 | true | 4 | true | no |
| 4 | 4 | true | 5 | true | no |
| 5 | 5 | true | 6 | false | yes |
| 6 | 6 | true | 7 | false | yes |
| 7 | 7 | true | 8 | false | yes |
| 9 | 9 | true | 10 | false | yes |
| 10 | 10 | true | 11 | false | yes |
| 11 | 11 | false | - | - | - |


### Infinite Loop
```shell
#!/bin/sh
while :; do
  echo "Press [Ctrl-C] to exit"
done
```


```shell
#!/bin/bash
for (( ; ; )); do
  echo "Press [Ctrl-C] to exit"
done
```

Note that the infinite loop using _for_ can be run only by __bash__ shell. So I recommend using the while-style infinite loop for compatibility.

## Function
Definition and usage

```
funcion_name()
{
    {statements}
}
```

## Exit
___Exit___ command is to terminate the running script itself. 
You can write the _exit_ command as zero at the end of the script if that script was doing all well or else you should use the _exit_ command with non-zero value.

```shell
#!/bin/bash
check_home_dir() {
  # If there is no HOME directory, which means 'test' command has returned false(non-zero value), exit the script with 1.
  test -d $HOME || exit 1
}
my_func $1
exit 0
```

## (Advanced) Source (.)
___Dot(.)___ command is for loading a script into the current script. 

```shell
#!/bin/bash
cd ~
cd ..
pwd
```

Let's compare betwen two execution ways.
```shell
# Run the script only
$ ./dot-test.sh
# Use dot command
$ . dot-test.sh
```
The terminal output will be same with two cases, your home directory path.
However, your current directory wouldn't be same. Because if you run a script, a subshell is created.
Which means that if you run a script as an ordinary way like the first case, the current directory is moved to '/home' and also print '/home' in the subshell. So that after the termination of the subshell, the original shell that runs dot-test.sh is remaining on the current directory where the script was run.

The command case of usage for this sourcing mechanism is to use variables and functions in other scripts, like a library.

```shell
```

## (Advanced) Commands within two blocks, () and {}
```shell
```

## (Appendix) Test Command Operators Summary

__string compare__

| format | description |
|--------|-------------|
| -n _STRING_ | length is non-zero |
| -z _STRING_ | length is zero |
| _STRING1_ = _STRING2_ | same string |
| _STRING1_ != _STRING2_ | not same string |

__number(integer) compare__

| format | symbolic | note |
|--------|-------------|----------------|
| _NUMBER1_ -eq _NUMBER2_ | _NUMBER1_ == _NUMBER2_ | **eq**ual|
| _NUMBER1_ -ne _NUMBER2_ | _NUMBER1_ != _NUMBER2_ | **n**ot **e**qual|
| _NUMBER1_ -gt _NUMBER2_ | _NUMBER1_ > _NUMBER2_ | **g**reater **t**han|
| _NUMBER1_ -ge _NUMBER2_ | _NUMBER1_ >= _NUMBER2_ | **g**reater than & **e**qual to|
| _NUMBER1_ -lt _NUMBER2_ | _NUMBER1_ < _NUMBER2_ | **l**ess **t**han|
| _NUMBER1_ -le _NUMBER2_ | _NUMBER1_ <= _NUMBER2_ | **l**ess than & **e**qual to|

__file or directory existence__

| format | description | note |
|--------|-------------|----------------|
| -e _FILE_ | _FILE_ exists? | **e**xists |
| -d _FILE_ | _FILE_ exists? and directory? | **d**irectory exists |
| -r _FILE_ | _FILE_ exists? and regular file? | **r**egular file |
| -s _FILE_ | _FILE_ exists? and size > 0? | has **s**ize |

__file or directory permission__

| format | description |
|--------|-------------|
| -r _FILE_ | _FILE_ exists? and readable?|
| -w _FILE_ | _FILE_ exists? and writeable? |
| -x _FILE_ | _FILE_ exists? and executable? |

__file or directory compare__

| format | description |
|--------|-------------|
| _FILE1_ -ef _FILE2_ | _FILE1_ is equal to _FILE2_? |
| _FILE1_ -nt _FILE2_ | _FILE1_ is newer than _FILE2_? |
| _FILE1_ -ot _FILE2_ | _FILE1_ is older than _FILE2_? |