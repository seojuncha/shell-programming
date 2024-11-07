# Pattern Matching with grep
grep is a command-line utility program running on linux and unux system. Is is basically pattern-matching system to retrieve a spcific string. The first questiong to do that is how grep finds a pattern. The most commonly used pattern matching sytax is a ***regular expression***

> g/re/p : global regular expression search and print


If there is one thing you have to keep in mind, grep is just trying to find and return strings only. To be clear, grep doesn't do modification of a original source text or file contents. You want a editable or a more powerful text processing? Use [***sed***](../sed/README.md) or [***awk***](../awk/README.md).

## Regular Expression (regex)
The special characters is used for regex. 

    . ? * + { | ( ) [ \ ^ $

Let's quick tour with simple examples per each character, then we would categorize. Note that, '$' sign in an example is for the shell command prompt. If you don't know what is *pipeline* in Linux and how to use it, [this site]() will be helpful for you.

### .
one by one matching of previous character(or group)
```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca.t"
caat
```

### ?
**zero or one** matching of previous character(or group)
```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca?t"
ct
cat

```

### *
**zero or more** matching of previous character(or group)

```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca*t"
ct
cat
caat
caaat
```

### +
**one or more** matching of previous character(or group)
```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca+t"
cat
caat
caaat
```

### { }
Define how many times the previous charater is matched.
```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca{1}t"
cat

$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca{2}t"
caat
```

The format is inclusive {start,end} if it means a range.
```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca{1,}"
cat
caat
caaat

$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "ca{2,3}"
caat
caaat
```

### |
```shell
$ printf "ct\ncat\ncaat\ncaaat\n" | grep -E "cat|caaat"
cat
caaat
```

### ( )

### \

### ^

### $


## Online Practice
You can practice all of regex syntax in [here](https://regex101.com)

## Basic Syntax of grep
> grep [options] patterns [files]

## Common Options
- -E
- -n
- -r
- -v
- -c
- -H
- -A
- -B
- -C

```shell
$ grep --help
$ man grep
```
## Select outputs


## Conjunction with to perform AND operation
Use pipe!
```shell
```

## Resources
GNU Manual: https://www.gnu.org/software/grep/manual/grep.html
