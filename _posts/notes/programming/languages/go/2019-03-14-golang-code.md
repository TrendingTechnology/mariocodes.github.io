---
layout: post
title: Golang - code cheat sheet
date:   2019-03-14 17:20:00 +0100
categories: programming go code cheat-sheet
permalink: /notes/languages/go/code
---

# Compile
To compile / build / run in Sublime
1. `ctrl + shift + P`
2. `go run`

# Code
## Template
This is all needed to test.

~~~ go
package main

func main() {

}
~~~

## Variables
Semicolons are **not** needed.

~~~ go
var age int // assigned to 0 by default
var footSize = 45 // type inference
// multiple variables of same type
var headSize, waistSize = 200, 70
// constant declaration
const  height = 180

var ( // multiple variables of different type
  name     = "Mario"
  myAge    = 5
  lastName = "nope"
)

// shorthand declaration
heartSize, country := 100, "Italia"

// the space btw. variables is automatically given
fmt.Println("my age is:", age,
  "and my foot size: ", footSize)
~~~

## Functions
### declaration
The basic structure for a Function is

~~~ go
func functionName(parameterName type) returnType {
  // code
}
~~~  

The parameters and the return type are optional. So the following is also valid go
~~~ go
func functionName() {
  // code
}
~~~

For consecutive parameters with the same type, it is only needed to declare it once
~~~ go
// param1 is an int too
func functionName(param1, param2 int) {

}
~~~

Multiple return values
~~~ go
func functionName(param1, param2 int)(int, int) {
  return param1, param2
}

func main() {
  param1, param2 := functionName(12, 64)
}
~~~

Named, multiple return values
~~~ go
func functionName(param1, param2 int)(result1, result2 int) {
  result1 = param1
  result2 = param2
  return // no explicit return value
}
~~~

### blank identifier
`_` is known as the blank identifier. It can be used in place of any value of any type to discard it.  
~~~ go
// what happens if I only need result1 and want to discard result2?
func functionName(param1, param2 int)(result1, result2 int) {
  result1 = param1
  result2 = param2
  return // no explicit return value
}

func main() {
  param1, _ := functionName(12, 64)
}
~~~
## Reference
[https://golangbot.com/learn-golang-series/](https://golangbot.com/learn-golang-series/)
