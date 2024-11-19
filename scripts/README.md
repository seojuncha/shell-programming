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

### Variable Scope
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

### Environment Variable
Let me show you already defined environment variables in your shell session.
```shell
$ printenv
SHELL=/bin/bash
NAME=AAAA-AAA
LOGNAME=sjc
...
```
Each ouput format is *NAME*=*VALUE* per line. *NAME* is an environment variable name as you expected. 
Environment variables are a kind of special variables widely used in your system.

## Operator

## Input and Output
We have seen a few examples about output. 

### Standard Input, Standard Output, Standard Error

## Control

## Loop

## Function