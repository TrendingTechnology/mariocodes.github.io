---
layout: post
title: Kotlin - null safety
date:   2019-05-06 14:57:00 +0100
categories: programming kotlin
permalink: /notes/languages/kotlin/null-safety
---
Kotlin differences between nullable and non-nullable references
~~~ java
var nonNullable: String = "Hello World"
nonNullable = null // compilation error

var nullable: String? = "This is nullable!"
nullable = null // okay
~~~

As this is the case, you cannot assign a nullable variable to a non-nullable variable directly. You have to assign first a default value which will be used in case the nullable variable is null. This is done through the **_Elvis operator_**.

~~~ java
var nullable: String? = "This is nullable"
var newNonNullable: String = nullable ?: "default value"
~~~
<!--more-->
It also has a **_safe call operator_** to avoid methods being called on _null_ references.

~~~ java
var nullable: String? = "This is nullable"
var parsed: Int? = nullable?.length // 16

nullable = null
parsed = nullable?.length // nullable.length is never called, and parsed is set to null
~~~

### Reference(s)
[https://blog.scottlogic.com/2019/04/29/kotlin-vs-java.html](https://blog.scottlogic.com/2019/04/29/kotlin-vs-java.html)
