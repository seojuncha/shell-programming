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


### ^
Find a string starting with a next character(or group)
```shell
$ printf "cat\ndog\npig\n" | grep -E "^d"
dog
$ printf "cat\ndog\npig\n" | grep -E "^c"
cat

```

### $
Find a string ending with a previsous character(or group)
```shell
$ printf "cat\ndog\npig\n" | grep -E "g$"
dog
pig

```

### [ and ]
A bracket expression is a set of characters. The file, samples/zoo.log, is used for this expression since it's not quite simple. Please check it out.

#### Basic

one of character
```shell
$ printf "cat\nca1t\nca12t\nca?t" | grep -E "ca[12]t"
ca1t
ca2t
$ printf "cat\nca1t\nca2t\nca12t\nca?t" | grep -E "ca[45]t"
$ printf "cat\ndog\n" | grep -E "[abc]"
cat
```
range of characters

```shell
$ printf "cat\nca1t\nca2t\nca12t\nca?t" | grep -E "ca[0-9]t"
ca1t
ca2t
$ printf "10\n11\n12\n13\n21\n23" | grep -E "[0-9][23]"
12
13
23
$ printf "cat\ndog\n" | grep -E "[a-c].."
cat
$ printf "cat\ndog\n" | grep -E "[a-d].."
cat
dog
```
negation
```shell
$ printf "10\n11\n12\n13\n21\n23\n24" | grep -E ".[^23]"
10
11
21
24
```

#### Predefined classes

[:digit:] : it is same with range expression of [0-9].
```shell
$ printf "cat\nca1t\nca2t\nca12t\nca?t" | grep -E "ca[[:digit:]]t"
ca1t
ca2t
```
[:alpha:] : it is same with range expression of [a-zA-Z].
```shell
$ printf "cat\ncaat\nca1t\nca2t\nca12t\nca?t" | grep -E "ca[[:alpha:]]t"
caat
```
[:alnum:] : [:alpha:] + [:digit:]
```shell
$ printf "cat\ncaat\nca1t\nca2t\nca12t\nca?t" | grep -E "ca[[:alnum:]]t"
caat
ca1t
ca2t
```
[:punct:] : includes '?', '!', '#', and so on.
```shell
$ printf "cat\nca1t\nca2t\nca12t\nca?t" | grep -E "ca[[:punct:]]t"
ca?t
```
[:blank:] : includes space or tab
```shell
$ printf "oh\no  h\n  oh\n" | grep -E "o[[:blank:]]"
o  h
$ printf "oh\no  h\n  oh\n" | grep -E "[[:blank:]]o"
  oh
```
More predefined classes are also there, [:space:], [:cntrl:], [:graph:], [:lower:], [:upper:], [:print:], [:xdigit:]. See more details in the [reference manual](https://www.gnu.org/software/grep/manual/grep.html#Character-Classes-and-Bracket-Expressions-1).


### \
Backslash is used for special characters. Why is it needed? For which special characters? Assume that you make a string patttern matching system. How do you make a expression for non-alphabet or non-numeric? : Backslash is for you!

In case the option, '-E', only.

### Basic
```shell
$ printf "\$100\n\100\n" | grep -E "^\\$"
$100
```

#### Spacial Expressions
A lower case is a positive case, but a upper case is netagive case.

Boundary Define
- \b : boundary word
- \B : non-boundary word
```shell
$ printf "world\nhello world\nhelloworld\n" | grep -E "\bworld"
world
hello world

$ printf "world\nhello world\nhelloworld\n" | grep -E "\Bworld"
helloworld
```

Word 
- \w : consecutive word
- \W : non-consecutive word
```shell
$ printf "world\nhello world\nhelloworld\n" | grep -E "\wworld"
helloworld
$ printf "world\nhello world\nhelloworld\n" | grep -E "\Wworld"
hello world
```

Space
- \s : with space
- \S : without space
```shell
$ printf "world\nhello world\nhelloworld\n" | grep -E "\sworld"
hello world
$ printf "world\nhello world\nhelloworld\n" | grep -E "\Sworld"
helloworld
```

## Online Practice
You can practice all of regex syntax in [here](https://regex101.com)

## Basic Syntax of grep
> grep [options] patterns [files]

## Common Options
- -E : ***e***xtended regular expression
- -n : print a line ***n***umber
- -r : ***r***ecursive search through files and directories
- -v : re***v***ert match
- -c : print only a ***c***ount of matching lines
- -H : print ***h***ead(filename)
- -A : ***a***fter lines
- -B : ***b***efore lines
- -C : after & before(***c***ontext) lines

If you want more information, below will be helpful. Note that almost linux commands 
```shell
$ grep --help
$ man grep
```

## Conjunction with to perform AND operation
There is no AND operation as options. Use pipe to combine with multiple grep commands!
```shell
printf "cat\ndog\npig\n" | grep -E "g$" | grep -E "^p"
pig

```


## Resources
GNU Manual: https://www.gnu.org/software/grep/manual/grep.html
