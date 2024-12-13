# Stream Editor: sed



## Syntax
> sed *options* 'script' *files*

### script
***script*** is enclosed by single-quotes. *script* defines what have to do with a text.<br>
Synopsis of script is below.<br>
> [address]command[options]

Here's the various commands.
- print
- delete
- substitute
- insert
- append

Take a quick look with a few examples. Note that the sample file is in the *samples* directory.
```shell
$ sed '1,2p' zoo.log 
```

***address*** can be

- single line number
- regular expression
- range of lines

Let's use the commend, ***p***, at now, which is just to print a line.

```shell
$ sed -n  '1p' samples/zoo.log
"# There are a few animals in my zoo! Let's pick up them."

$ sed -E -n '/[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}/p' samples/zoo.log
2024-11-11
2024-11-10
2024-11-09
2024-11-08
2024-11-07

$ sed -n '1,4p' samples/zoo.log
"# There are a few animals in my zoo! Let's pick up them."

2024-11-11
1 elephant
```

Usage of a single line and a range of lines might be simple. However, a form of the regular expression is weird a little. Here's formatting.

> sed -E '{/regex/command}' inputfile

In the previous example, **/regex/** have matched with **/[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}/** to search all date.

***command*** can be
- d : deleting a line
- p : printing
- s : substitution

#### Deleting
```shell
$ printf "cat\ndog\npig\n" | sed '2d'
cat
pig

$ printf "cat\ndog\npig\n" | sed '1,2d'
pig

$ printf "cat\ndog\npig\n" | sed '/cat/d'
dog
pig
```

#### Printing
```shell
$ printf "cat\ndog\npig\n" | sed -n '3p'
pig

$ printf "cat\ndog\npig\n" | sed -n '1,2p'
cat
dog

$ printf "cat\ndog\npig\n" | sed -n '/dog/p'
dog
```

#### Substitution
```shell
$ echo cat dog | sed 's/dog/woman/'
cat woman
```

Please refer to [here](https://www.gnu.org/software/sed/manual/sed.html#Other-Commands) for less frequent commands.

## Use multiple scripts


## Resources
GNU Manual: https://www.gnu.org/software/sed/manual/sed.html