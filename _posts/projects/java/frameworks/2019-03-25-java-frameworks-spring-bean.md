---
layout: post
title: Spring Beans
date:   2019-03-25 13:09:00 +0100
categories: programming java frameworks spring
permalink: /notes/frameworks/java/spring/spring-bean
---

# Spring Bean
A spring bean is the basic building block of a Spring App. In its basis, it's an Object which Spring Framework manages at runtime.  

This management includes:  
* Creating an Object
* Filling dependencies
* Intercepting method calls
* Destroying the Object

## Define a Spring Bean
There're 3 ways:

* declare it with `@Component` annotation
* `@Bean` annotation at a Bean Factory
* XML Config. File

### @Component
This is the most common way if you own the source code and it hasn't any special dependency.  

It includes the following 3 derivatives. The difference is purely informative.
* `@Service`
* `@Repository`
* `@Controller`



## References
[http://dolszewski.com/spring/spring-bean/](http://dolszewski.com/spring/spring-bean/)
