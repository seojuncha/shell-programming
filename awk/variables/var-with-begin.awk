BEGIN {
  num = 10
}

{
  if (num < 100) {
    print num,"is less than 100"
    num+=1
  }
}
