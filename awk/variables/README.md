## Predefined Variables

### Control

### Information

#### ARGC and ARGV

```shell
$ echo a b c d | awk '{print $0; print NR}'
a b c d
1

$ echo a b c d | awk '{print $0; print NF}'
a b c d
4

$ echo a b c d | awk '{print $0; print FNR}'
a b c d
1
```

***FNR*** indicates how many records have been read from the current input file.<br>
***NR*** indicates how many records have been read in total.

