# awk
***awk*** is a programming language as well as a utility program. *awk* is data-driven language. You have to describe the data you want to work, then do action you want when awk find the data. For that reason, *awk* syntax makes sense. There is a pattern to find a matching line, and also actions what do you want. Until now, it may be similar with *sed*. However, *awk* provides more flexible way to process text lines, input and output.

## Syntax
> awk 'pattern {action}' filename

'pattern {action}' is a small program. 

*pattern* part is similart with 'sed'.

> ### What is programming?
> 'awk' is more close to real programming than sed or grep. The fundamental process of programming is the calculation box through input to output. If I push a proper input a program would give me a proper output. As I said 'awk' is not only a utility program for text processing, but it has a kind of programming language which defines their own syntax. <...> For that reason, you should keep in mind the logical thinking while writing a 'awk' program.

## Getting Started

How 'awk' works if there is no input files? Compare these two simple examples.

```shell
$ awk '{ print "Hello~" }'
a            # push the keyboard 'a' as user input
Hello~       # prints 'Hello~'
b
Hello~
c
Hello~

$ awk 'BEGIN { print "Hello~" }'
Hello~
```


*BEGIN* : do action before reading input

'awk' run a script file itself writting in awk with '-f' option.
```awk
#!/usr/bin/awk -f

BEGIN {print "hello world!"}
```
Above is saved to the file named 'print'. Then, is able to run that script like othe shell script file. Note that 'awk' script includes '-f' option in shebang line.

```shell
$ chmod +x print.awk
$ ./print.awk
hello world!
```

## Understand Data: data-driven language
```shell
$ ls /usr/share/doc/gawk/examples/data/
class_data1        class_data2        guide-mellow.po    guide.po           inventory-shipped  mail-list
```
Sample files provided from the awk library would be able to used in practice. However, the path is quite long.
Are there a more effortless way to use those? Moreover, All sample files look similar, like a table data.

### Tabular Data
***Tabular data*** is composed of rows(records) and columns(fields). This structure could be shown in Excel easily.
Let's see a sample file, mail-list.
```shell
$ cat /usr/share/doc/gawk/examples/data/mail-list
Amelia       555-5553     amelia.zodiacusque@gmail.com    F
Anthony      555-3412     anthony.asserturo@hotmail.com   A
Becky        555-7685     becky.algebrarum@gmail.com      A
Bill         555-1675     bill.drowning@hotmail.com       A
Broderick    555-0542     broderick.aliquotiens@yahoo.com R
Camilla      555-2912     camilla.infusarum@skynet.be     R
Fabius       555-1234     fabius.undevicesimus@ucb.edu    F
Julie        555-6699     julie.perscrutabor@skeeve.com   F
Martin       555-6480     martin.codicibus@hotmail.com    A
Samuel       555-3430     samuel.lanceolis@shu.edu        A
Jean-Paul    555-2127     jeanpaul.campanorum@nyu.edu     R
```
Each row describes a person with a mobile number, email address, and single character. So, rows are divided by an each person's information. However, as a view of column, each column represents different data category. For example, the first column is for name, the second column is for a mobile number, and so on. Look at the real word example below.

```shell
$ ls -al /sys
total 4
dr-xr-xr-x  11 root root    0 Nov 11 08:40 .
drwxr-xr-x  22 root root 4096 Nov 11 08:40 ..
drwxr-xr-x   2 root root    0 Nov 11 08:51 block
drwxr-xr-x  26 root root    0 Nov 11 08:40 bus
drwxr-xr-x  35 root root    0 Nov 11 08:40 class
drwxr-xr-x   4 root root    0 Nov 11 08:40 dev
drwxr-xr-x  14 root root    0 Nov 11 08:40 devices
drwxr-xr-x   4 root root    0 Nov 11 08:40 firmware
drwxr-xr-x  10 root root    0 Nov 11 08:40 fs
drwxr-xr-x  15 root root    0 Nov 11 08:40 kernel
drwxr-xr-x 116 root root    0 Nov 11 08:40 module
```
Like a previous example, mail-list, the result of 'ls' command is combined with rows and columns. Each row is for a directory, but each column is for others, the first is file permission, the last is a directory.

Why is it important for 'awk' programming? 'awk' uses *pattern-action* structure to process text per one line. 

Let's print the mail-list. As you see, file path is long a little. Is there a convinient way for this long path when running 'awk'? Normally, we can use file path like this.
```shell
$ awk '{print $0}' /usr/share/doc/gawk/examples/data/mail-list
mail-list contents...
```
Let me show you another approach to do that.
```shell
$ SAMPLE=/usr/share/doc/gawk/examples/data/mail-list; awk '{ print $0 }' $SAMPLE
mail-list contents...
```
I have used an environment variable.

```shell
# Append mail-list path at the end of .bashrc.
$ echo "SAMPLE=/usr/share/doc/gawk/examples/data/mail-list" >> ~/.bashrc

# Update .bashrc file in current shell session.
$ source ~/.bashrc

# Print
$ awk '{print $0}' $SAMPLE
mail-list contents...
```
As the environment variable, SAMPLE, is written into .bashrc profile, I can use it when I log in shell session again at now. 

## Print Fields with Regular Expression
I have been used input and output in the previous examples. Keep in mind that 'awk' is following 'pattern-action' structure per one line. Moreover, this rule can be applied multiple times. Let me show you an example.
```shell
# SAMPLE is /usr/share/doc/gawk/examples/data/mail-list
$ awk '/gmail/ {print $0} /hotmail/ {print $0}' $SAMPLE
Amelia       555-5553     amelia.zodiacusque@gmail.com    F
Anthony      555-3412     anthony.asserturo@hotmail.com   A
Becky        555-7685     becky.algebrarum@gmail.com      A
Bill         555-1675     bill.drowning@hotmail.com       A
Martin       555-6480     martin.codicibus@hotmail.com    A
```
Whole fields are displayed because I use $0 as an arguments of print function. How do I print only email address? Note that the email address is on the third column.

```shell
$ awk '/gmail/ {print $3} /hotmail/ {print $3}' $SAMPLE
amelia.zodiacusque@gmail.com
anthony.asserturo@hotmail.com
becky.algebrarum@gmail.com
bill.drowning@hotmail.com
martin.codicibus@hotmail.com
```

## Define custom input seperator

### Field Seperator
As I have seen by now, each field is seperated by a space. What if I want to deal with comma(,) seperated line like a CSV file?

```shell
$ awk -F@ '/gmail/ {print $1}' $SAMPLE
Amelia       555-5553     amelia.zodiacusque
Becky        555-7685     becky.algebrarum

$ awk -F- '/gmail/ {print $1}' $SAMPLE
Amelia       555
Becky        555
```

### Record Seperator
```shell
$ awk 'BEGIN {RS=""} {print $0}' file
```

## Various Pattern Types
Before delve into an action part, talk about the pattern part of rules.

'awk' patterns are one of the below:
- /regular expression/
- dynamic regular expression
- BEGIN
- END
- BEGINFILE
- ENDFILE
- with logical operators
- (pattern)
- range

I already described regular expression enclosed by slashes. 

### BEGIN, END
Starting with both of BEGIN and END together. BEGIN operator defines a startup action, but END operator defines a cleanup action. Note that both of them have no default action, which means they should be being with an action.

```shell
$ awk 'BEGIN {print "starting.."} /gmail/ {print $0} END {print "ending..."}' $SAMPLE
starting..
Amelia       555-5553     amelia.zodiacusque@gmail.com    F
Becky        555-7685     becky.algebrarum@gmail.com      A
ending...
```
The BEGIN part, **BEGIN {print "starting.."}** is to print a string, "starting.." before reading the first record. Then pattern-action rule is run. Finally, do cleanup action described by END operator.

### BEGINFILE, ENDFILE
BEGINFILE operator and ENDFILE operator are similar operation with BEGIN, END operators. However, as the name suffix, FILE, said, the blocks with them is excuted per each file when input files of 'awk' are not only one. Simply compare BEGINFILE operator with BEGIN in below example[^1].

[^1]: Input files are *mail-list* and *inventory-shipped*.

```shell
$ awk 'BEGINFILE {print "start beginfile.."} BEGIN {print "start begin..."} /5[23]/ {print $0}' $SAMPLE $INVENTORY_SAMPLE
start begin...
start beginfile..
Amelia       555-5553     amelia.zodiacusque@gmail.com    F
start beginfile..
Apr  31  52  63 420
Oct  29  54  68 525
Feb  26  58  80 652
```

### Dynamic Regular Expression

## Command-line options
Take a look at the commonly used options.

## Resources
GNU Manual: https://www.gnu.org/software/gawk/manual/gawk.html