# Linux & Unix Shell

## What is Shell?
We have been heard 'Shell' a lot in the IT field, specifically linux or unix system. However, what is the Shell exactly meaning about? 

### Interface Hirarchy
There are a lot of interfaces in a computer system. To put the text in here, I use my keyboard. When I push a single keycap again and again, a signal is sent to the computer. Then, the computer prints the text I typed.  

Shell is one of the interfaces in computer system.

As you know, there is an operating system in a modern computer system.



## Common Usage of Commands
Quick tour of basic commands before next step. Most commands are used frequently.<br>
TODO: add exercises for each command!

### Nagivation

### File Operation

### Process Management

### System Information

### Text Processing

### Input/Ouput & Redirection

### User Management

### Others

## Current Shell
To begin with what is your current shell.

```shell
$ echo $SHELL
/bin/zsh    # default shell on Mac
```

## Shell Profiles
Let's begin with Shell. When starting a shell session, various configuration files are loaded. That configuration file is called a Shell profile.

If the Shell is Bash,
- /etc/profile
- /etc/profile.d/*.sh
- ~/.bash_profile
- ~/.bash_login
- ~/.profile
- ~/.bashrc

The purpose of Shell profile is to load environment variables and run scripts for the session. Before we step forward, look around the Shell session.

## Shell Sessions
There are two kinds of Shell sessions, ***Login Session*** and ***Non-Login Session***. What's difference between them? 

### Login Shell

### Non-Login Shell

## Psuedo Temrminal Slave devices: PTS

## (Option) Setup the kinds of shell on MacOS
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
Vim:
