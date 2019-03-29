---
layout: post
title: Golang - code cheat sheet
date:   2019-03-14 17:20:00 +0100
categories: programming go code cheat-sheet
permalink: /notes/languages/go/code
---

# Installation
## Compile
To compile / build / run in Sublime
1. `ctrl + shift + P`
2. `go run`

## Multiple workspaces
For a custom installation, it's possible to give more than one value to `GOPATH`.
~~~ bash
export GOPATH="/home/msanchez/go/packages/bin:/home/msanchez/Documents/Personal/Github/language_testing/golang"
~~~

The first value is used as default to install packages. The second and next ones may be used as standalone workspaces. It's important for the root of the workspace to be `/src`, otherwise it will complain and not compile into `/bin`.

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

## Packages
Every go exec must have an entry point. This is a `main` function which has to reside in the `main` package.  

We have the following tree:

~~~ bash
src/
    programm/
        custom_package/
            custom.go # custom class
    programm.go # This is the main
~~~

To install the custom package from `/src` execute `go install programm`

To import the contents from `custom.go` and use it at `programm.go` we'll have to import it with a relative path

~~~ go
package main

import (
	"packages/custom"
)

func main() {
  // code
}
~~~

Only the functions which start with a capital letter at `custom.go` will be exported and accessible from the outside.

## Reference
[https://golangbot.com/learn-golang-series/](https://golangbot.com/learn-golang-series/)
