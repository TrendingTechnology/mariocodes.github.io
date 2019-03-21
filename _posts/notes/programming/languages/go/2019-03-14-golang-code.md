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

## Reference
[https://golangbot.com/learn-golang-series/](https://golangbot.com/learn-golang-series/)
