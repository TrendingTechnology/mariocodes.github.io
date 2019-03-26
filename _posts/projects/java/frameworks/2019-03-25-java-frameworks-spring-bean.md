---
layout: post
title: Spring Beans
date:   2019-03-25 13:09:00 +0100
categories: programming java frameworks spring
permalink: /notes/frameworks/java/spring/spring-bean
---
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
* `.xml` config. file _(old way)_
<!--more-->

### @Component
This is the most common way if you own the source code and it hasn't any special dependency. It has to be used together with component scanning.

It includes the following 3 derivatives. The difference is purely informative.
* `@Service`
* `@Repository`
* `@Controller`

~~~ java
@Service
public class MyService {
  // code
}
~~~

### @Bean
For classes you don't own, you have to declare them with `@Bean` at a configuration class. Also for your own classes which have weird dependencies and Spring cannot auto-inject them.

~~~ java
@Configuration
public class MySpringConfig {

  @Bean(name = "notMyService") // name optional
  public NotMyService notMyService() {
    return new NotMyService();
  }

}
~~~

## Bean Properties

* class
* name
* dependencies
* scope
* initialization mode
* initialization / destruction callback

### Name
Spring automatically gives a name to your beans. It uses it to identify each one. Mostly, it's common to set your own bean name when you have more than one different instance for a class and you need to differentiate them.

### Dependencies
We inject them with `@Autowired` annotation at the constructor.

~~~ java
@Component
public class MyComponent {

  private final MyDependency myDep;

  @Autowired
  public MyComponent(final MyDependency myDep) {
    this.myDep = myDep;
  }

}
~~~

The tag it's not needed if we only have 1 constructor. If we have more, we have to mark
one of them so Springs knows which one to auto-inject.

### Scope
It defines how many instances of a class the framework creates at runtime.  
**The default behaviour is singleton!**  

* singleton - just one instance
* prototype - a new one on every inject

~~~ java
@Bean
@Scope("prototype")
public NotMyService notMyService() {
  return new NotMyService();
}
~~~

~~~ java
@Component
@Scope("prototype")
public class MyComponent {
  // code
}
~~~

### Initialization Mode
When the application starts, Spring creates all singleton beans at startup. This detects errors in the beans, but makes the startup slow. `@lazy` delays the creation
of a Bean to when it's first needed.  

~~~ java
@Lazy
@Component
public class MyComponent {
  // Code
}
~~~

### Initialization / destruction Callback
This is to execute some logic, after the bean was fully built and its dependencies
were injected or before the bean is destroyed.

#### own bean
* Make the class implement the interface `InitializingBean` / `DisposableBean` and implement the method which comes with it.  
* Or create our own method and tag it with javax `@PostContruct` / `@PreDestroy`

#### external bean
Implement a method _(it may be private)_ and do the following at the declaration of the bean:
~~~ java
@Bean(initMethod="methodName", destroyMethod="name")
public NotMyService notMyService() {
  return new NotMyService();
}
~~~

## Reference
[http://dolszewski.com/spring/spring-bean/](http://dolszewski.com/spring/spring-bean/)
