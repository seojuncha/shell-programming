# Linux & Unix Shell

## What is Shell?
We have been heard 'Shell' a lot in the IT field, specifically linux or unix system. However, what is the Shell exactly meaning about? 

### Interface Hirarchy
There are a lot of interfaces in a computer system. To put the text in here, I use my keyboard. When I push a single keycap again and again, a signal is sent to the computer. Then, the computer prints the text I typed.  

Shell is one of the interfaces in computer system.

As you know, there is an operating system in a modern computer system.


## Common Usage of Commands
Quick tour of basic commands before next step. Most commands are used frequently.<br>
<!-- TODO: add exercises for each command! -->

### Nagivation
1. **P**rint a current **w**orking **d**irectory.
```shell
$ pwd
```
2. **C**hange **d**irectory
```shell
$ cd dest
$ cd ~
$ cd ..
```
3. **L**i**s**t files
```shell
$ ls 
$ ls -al
$ ls path
```

### File Operation
1. **C**o**p**y
```shell
$ cp source dest
```
2. **M**o**v**e file or change name
```shell
$ mv source dest
$ mv old new
```
3. **R**e**m**ove file or directory
```shell
$ rm path
```
4. **M**a**k**e **dir**ectory
```shell
$ mkdir newdirectory
$ mkdir -p direcory_path_recursively
```
5. Create a empty file or update a acces date
```shell
$ touch
```
6. Get file information
```shell
$ file path
```
7. Change permission(change mode)
```shell
$ chmod 755 file
$ chmod +x file
$ chmod u+x file
```

### Process Management
1. Process List
```shell
$ ps
```
2. Send a signal to a process
```shell
$ kill -9 PID
```
Signal number with a name is in  'Signal numbering for standard signals' of [here](https://man7.org/linux/man-pages/man7/signal.7.html)

### System Information
1. Print system information
```shell
$ uname -a
```
2. Print disk usage
```shell
$ df -h
```
3. Print memory usage
```shell
$ free -h
```
4. Print open files
```shell
$ lsof
```
5. Print network information
```shell
$ netstat -anp
```
If netstat is not found, install the package, 'net-tools'
```shell
$ sudo apt install net-tools
```

6. Print resource usage[^1]
```shell
$ top
```
[^1]: You can use 'htop' also for more graphical printing. 'sudo apt install htop'

### Text Processing
1. Count the number of words or lines
```shell
$ echo "shell programming" | wc -w     # word count
2

$ echo "shell programming" | wc -m     # character count
18                                     # the number of characters + 1(\0)

$ printf "a\nb\nc\nd\n" | wc -l        # line count
4
```

2. Sort lines
```shell
$ printf "b\nd\nc\na\n" | sort
a
b
c
d
```

3. Print unique line, remove duplication
```shell
$ printf "a\na\na\nb\n" | uniq
a
b
```

4. Advanced text processing
- [grep](../grep/README.md)
- [sed](../sed/README.md)
- [awk](../awk/README.md)

### Input/Ouput & Redirection & Pipeline
1. Input/Output<br>

```shell
# Put the result of the left side command to a file, right side.
$ echo "hello world" > hello-world.txt
$ cat hello-world.txt
hello world

# Append contents to a file
$ echo "bye world" >> hello-world.txt
$ cat hello-world.txt
hello world
bye world

# Right side source is used as an input for a left side command
$ wc -l < hello-world.txt
1
```
2. Redirection<br>
Redireciton change an input or an output to the other. Note that below things.
- standard input (0)
- standard output (1)
- standard error (2)
```shell
$ ls /none 2> error.log  # An error message is redirected to error.log. 
$ cat error.log
ls: cannot access '/none': No such file or directory
```
3. Pipeline<br>
If pipeline, '|', is used, the output of command1, left side, is taken as the input of command2, right side.
```shell
$ command1 | command2
$ ls /home | grep `whoami`
```

### Others
```shell
$ history
```
```shell
$ !!
```
```shell
$ !$
```
---
By now, we have completed to start talking about shell itself. Let's begin with ***shell*** in a real linux/unix system.

## Current Shell
To begin with what is your current shell.

```shell
$ echo $SHELL
/bin/zsh    # default shell on Mac
```

## Shell Profiles
 When starting a shell session, various configuration files are loaded. That configuration file is called a Shell profile.

For example, if the Shell is Bash,
- /etc/profile
- /etc/profile.d/*.sh
- ~/.bash_profile
- ~/.bash_login
- ~/.profile
- ~/.bashrc
- ...

The purpose of Shell profile is to load environment variables and run scripts for the session. Before we step forward, look around the Shell session.

### What's in profiles?
Actually, '/etc/profile' is not a configuration file but a shell script when running through a shell.
If you are familiar with a shell script, you could understand what it means easily.
The shell profiles contains only a few things to configure the shell session. The important thing that is done by a profile is to prepare a shell environment, for instance, ~~.

### The order of loading profiles


## Shell Sessions
There are two kinds of Shell sessions, ***Login Session*** and ***Non-Login Session***. What's difference between them? Let's talk about *session* first. The terminology, *session*, is commonly appeared in computer programming world. What is *session*?

### Session
1. *Session* is from connection between an user and a system or systems.
2. *Session* is stateful.
3. *Session* has time limit and scope.



### Login Shell Session
```shell
$ echo $0
-bash         # start with '-'
```

### Non-Login Shell Session
```shell
$ bash      # start a new shell session
$ echo $0
bash
```

## Psuedo Temrminal Slave devices: PTS
```shell
$ who
user   pts/0   2024-11-11 12:00 (192.168.0.4)
```
Imaagine two users are loged in via ssh. Then, the first user was starting new shell session.
```shell
$ ps -aux | grep "pts/" | grep -E -v "pts/[0-9]$" | grep -E -v "color|ps -aux"
user1  ... pts/0 ... -bash
user1  ... pts/0 ... bash
user2  ... pts/1 ... -bash
```

## (Option) Setup various shells on MacOS
Use a package manager, brew, to install various shells on MacOS.

```shell
# Install C Shell
$ brew install tcsh
$ man csh

# Install Korn Shell
$ brew install ksh93
$ man ksh
```

## Resources
- vim: https://vim.rtorr.com/
- tmux: https://github.com/tmux/tmux/wiki

