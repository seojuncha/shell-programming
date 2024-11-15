# Array
Not a linear memory, but an associative data structure.

#### Why it is useful?
As you have been shown in the initial section of this awk tutorial, almost data dealt by 'awk' has records and fields. In the perspective of records, a row has a few fields. The array data type is proper to save the data like this consecutive field.

## Assignment
An array-type variable is created right after a value is assigned to that. 

> array-name[key] = value


### Access an Element
An ***Array*** is not a variable itself but is a type describing how the data is stored in a memory. So you could take out an element from the array-type variable. Here's how do that.

```shell
$ awk 'BEGIN {arr[0]="zero"; print arr[0]}'
zero
```
The print statement show the element at the first place of the array which name is *arr*.
> array-name[key]

Let me show you other examples to describe 
```shell
$ awk 'BEGIN {arr[0]=1; print arr[0]}'
1
$ awk 'BEGIN {arr[0]="a"; print arr[0]}'
a

$ awk 'BEGIN {arr["1"]="a"; print arr["1"]}'
a
$ awk 'BEGIN {arr["1"]="a"; print arr[1]}'
a
```

We also check an existence of element by using if statement.
> if ({array-key} in {array-name})

```shell
$ awk 'BEGIN {arr[0]="zero"; if(0 in arr) print "there is zero"}'
there is zero
```

> [!TIP]
> The condition statement, if-else, is [here](../control/README.md)

## Loop in array
```shell
$ awk 'BEGIN { arr[0]="zero"; arr[1]="one"; for(e in arr) print e}'
0
1

$ awk 'BEGIN { arr[0]="zero"; arr[1]="one"; for(e in arr) print e,"=",arr[e]}'
0 = zero
1 = one
```