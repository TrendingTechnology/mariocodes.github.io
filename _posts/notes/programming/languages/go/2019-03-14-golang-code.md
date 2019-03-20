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
## Variables declaration
Semicolons are **not** needed.

~~~ go
var age int // assigned to 0 by default
var footSize = 45 // type inference
var headSize, waistSize = 200, 70 // multiple variables of same type

var ( // multiple variables of different type
  name     = "Mario"
  myAge    = 5
  lastName = "nope"
)

heartSize, country := 100, "Italia" // shorthand declaration

// the space btw. variables is automatically given
fmt.Println("my age is:", age,
  "and my foot size: ", footSize)
~~~
