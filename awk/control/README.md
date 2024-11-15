# Control


## if
```
if(condition) then-body

or

if(condition) {
    then-body
}
```

if-then
```shell
$ awk 'BEGIN {num=4; if(num%2 == 0) {print "even number"}}'
even number
```

if-else
```
if(condition) then-body; else else-body

or

if(condition) {
    then-body
} else {
    else-body
}
```

```shell
$ awk 'BEGIN {
    num=3
    if(num == 2) print "num is two"
    else print "num is not two"
}'
num is not two
```

if-else if-else
```
if(condition1) then-body; else-if(condition2) elsethen-body; else else-body

or

if(condition1) {
    then-body
} else-if(condition2) {
    elsethen-body
} else {
    else-body
}
```

```shell
$ awk 'BEGIN {
    num=3
    if(num == 1) print "num is one"
    else if(num == 2) print "num is two"
    else print "num is not one or two"
}'
num is not one or two
```


## while
```
while(continue-condition) statements
```

```shell
$ awk 'BEGIN {
    i = 0
    while(i < 5) {
        print i
        ++i
    }
}'
0
1
2
3
4
```

## do-while
```
do statements while(continue-condition)
```

```shell
$ awk 'BEGIN {
    i = 0
    do {
        print i
        ++i
    }while(i<5)
}'
0
1
2
3
4
```

## for
```
for (initialize; continue-condition; update) statements
```

```shell
$ awk 'BEGIN {
    for (i=0; i < 5; ++i) {
        print i
    }
}'
0
1
2
3
4
```

## switch
```
```

```shell

```

## break and continue

## next and nextfile

## exit
```shell
$ awk 'BEGIN {exit(10)}'
$ echo $?
10
```