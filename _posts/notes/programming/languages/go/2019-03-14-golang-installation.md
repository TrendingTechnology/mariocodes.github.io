---
layout: post
title: Golang - installation
date:   2019-03-14 16:48:00 +0100
categories: programming backend go environment installation 
permalink: /notes/languages/go/installation
---
## Check installation
* `go version`

## Environment variables

**GOROOT**  
Folder where go was installated. It must only be set when installing to a custom location.

**GOPATH**  
Place to get, build and install packages outside the standard Go Tree.  
<!--more-->
[Source](https://stackoverflow.com/questions/7970390/what-should-be-the-values-of-gopath-and-goroot)

~~~ bash
# golang
export GOPATH=/home/msanchez/go/packages
export GOROOT=/home/msanchez/Programs/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
~~~

## IDE preparation
I use Sublime, to get it ready:

* `ctrl + shift + p`
* `install package`  

Install the packages:
* `GoOracle`
* `All Autocomplete`

_(missing steps)_

* install [https://github.com/golang/sublime-build](https://github.com/golang/sublime-build)

To compile / build / run
* `ctrl + shift + P`
* `go install`
* `go run`
