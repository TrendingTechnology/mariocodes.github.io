---
layout: post
title: From Java8 to Java11
date:   2019-03-04 17:57:00 +0100
categories: programming java java9 java10 java11 quickguide
permalink: /notes/languages/java/java8-to-java11
---

## Java 9

### Java REPL (JShell)
It stands for _Java Shell_. It's used to easily execute and test any Java construction like a class, interface, enum, etc.

### Module System
The way we deploy Java-Based applications using jars has a lot of limitations & drawbacks. Some of these are: The JRE & JDK are too big; JAR files are too big to use in small devices and applications; There's no strong encapsulation, _public_ is open to everyone.

The new Module System introduces new features to avoid all this. [More information here.](https://www.journaldev.com/13106/java-9-modules)

### Factory Methods for Inmutable Collections (List, Map, Set & Map.Entry)
_(I'll use Lists as an example in this file, but this is valid for Maps and Sets too)_

Until Java8 we could use `Collections.unmodifiableList()` to achieve this, but this is really verbose. Now we can do the same with
``` java
List inmutableList = List.of("bla", "ble", "bli");
```
<!--more-->
### Private methods in Interfaces
To avoid redundant code and more re-usability we can use _private_ and _private static_ methods directly in interfaces now. Their behaviour is the same as in a normal class
``` java
public interface Card {

	private Long createcardID() {
		// calculate and return ID
	}

	private static void displayCardDetails() {
		// implement
	}

}
```


### Try-with resources improvements
The new version improves the one which was implemented in Java SE 7 with better automatic resource management.

Java SE 7 Example
``` java
BufferedReader reader1 = new BufferedReader(new FileReader("file.txt"));
try(BufferedReader reader2 = reader1) {
	// do something
}
```

Java 9 Example
``` java
BufferedReader reader1 = new BufferedReader(new FileReader("file.txt"));
try(reader1) {
	// do something
}
```

### Reactive Streams
With the popularity of reactive programming, Java is adding support to it too with the implementation of: _Publisher_, _Subscriber_ & _Processor_. [More information.](https://www.baeldung.com/java-9-reactive-streams)

### API Improvements

#### HTTP 2 Client Protocol
_(Improved in Java11 again)_

There's a new HTTP 2 Client API to support HTTP/2 protocol and WebSocket features. It also supports HTTP/1.1 and may be used sync. or async.
~~~ java
Uri uri = new URI("http://example_request");
HttpResponse response = HttpRequest.create(uri)  
	.body(HttpRequest.noBody())  
	.GET()  
	.response();
~~~

#### Optionals
##### Optional#stream()
If a value is present in the given Optional object, stream returns a sequential Stream with that value. Otherwise, it returns an empty Stream.
``` java
Stream<Optional> employee = this.getEmployee(id);
Stream employeeStream = employee  
	.flatMap(Optional::stream);
```

##### Optional#ifPresentOrElse(Consumer<? super Tl> action, Runnable emptyAction)
If a value is present, performs the given action with the value, otherwise performs the given empty-based action.
``` java
Optional<Integer> opt = Optional.of(4);
opt.ifPresentOrElse(System.out::println,  
	() -> System.out.println("Not found"));
```

##### Optional#or(Supplier<? extends Optional<? extends T>> supplier)
Returns the value contained by the Optional if it has one, or the value given by the supplier if empty.
``` java
Optional<String> opt = Optional.of("bla");
Supplier<Optional<String>> supplier =  
	() -> Optional.of("ble");
System.out.println(opt.or(supplier)); // bla
```

``` java
Optional<String> opt = Optional.empty()
Supplier<Optional<String>> supplier =  
	() -> Optional.of("ble");
System.out.println(opt.or(supplier)); // ble
```

#### Streams
There are 4 new methods on Stream's API

##### Stream#takeWhile(Predicate) / #dropWhile(Predicate)
Takes a predicate as an argument and returns a Stream of the subset **until the predicate returns _false_ for the first time**. If the first value is _false_, it gives an empty Stream back.
``` java
Stream.of(1, 2, 3, 4, 5)
	  .takeWhile(i -> i < 4)
	  .forEach(System.out::println); // 1  
					 // 2  
					 // 3  
```

##### Stream#iterate(T seed, Predicate<? super T> hasNext, UnaryOperator<T> next)
It's similar to the _for loop_. First parameter is init value, second is the condition and third is to generate the next element.
``` java
// start value = 2; while value < 20;   
// then value *= value  
IntStream.iterate(2, x -> x < 20, x -> x * x)
		 .forEach(System.out::println);
```


##### Stream#ofNullable()
Returns a sequential Stream containing a single element, or an empty Stream if null.
``` java
Stream<Integer> i = Stream.ofNullable(9);
i.forEach(System.out::println); // 9
```

``` java
Stream<Integer> i = Stream.ofNullable(null);
i.forEach(System.out::println); //
```

### References
[https://www.journaldev.com/13121/java-9-features-with-examples](https://www.journaldev.com/13121/java-9-features-with-examples)

## Java 10

### Local-variable Type Inference
It adds type inference to declarations of local variables with initializers. It can only be used in the following scenarios:

* Limited only to local variable with initializer
``` java
var numbers = List.of(1, 2, 3, 4);
```

* Indexes of foreach loops
``` java
for(var number : numbers) {
	// do something
}
```

* Local declared in for loop
``` java
for(var i = 0; i < numbers.size(); i++) {
	// do something
}
```

### API Improvements

#### List, Map & Set
##### Collection#copyOf(Collection)
Returns an **unmodifiable list, map or set** containing the entries provided. For a List, if the original list is subsequently modified, the returned List will not reflect this modifications.
``` java
List<String> strings = new ArrayList<>();
strings.add("bla");
strings.add("ble");

List<String> copy = List.copyOf(strings);
strings.add("bli");

System.out.println(strings); // bla, ble, bli
System.out.println(copy); // bla, ble
```

##### Collectors#toUnmodifiable...()
Different methods to collect into a unmodifiable collection.
``` java
List<String> strings = new ArrayList<>();
strings.add("bla");
strings.add("ble");

List<String> unmodifiableStrings =  
   strings.stream()  
  .collect(Collectors.toUnmodifiableList());
```

#### Optional#orElseThrow()
Is the same as _Optional#get()_ but the doc states that this is a preferred alternative.
``` java
String name = "bla";
Optional<String> optionalName = Optional.ofNullable(name);
String s = optionalName.orElseThrow(); // bla
```
``` java
Optional<String> empty = Optional.empty();
// throws java.util.NoSuchElementException  
String s = empty.orElseThrow();  
```

### References
[https://www.journaldev.com/20395/java-10-features#local-variable-type-inference-jep-286](https://www.journaldev.com/20395/java-10-features#local-variable-type-inference-jep-286)
[https://howtodoinjava.com/java10/java10-features/](https://howtodoinjava.com/java10/java10-features/)

## Java 11

### Single-file Applications
Now it's possible to run single-file applications without the need to compile. It really simplifies the process to test new features.

In the file we have to write the following shebang
``` bash
#!/usr/bin/java --source11
```

To run
``` bash
java HelloWorld.java
```

Parameters _before_ the name of the source file are passed as parameters to the java launcher. Parameters _after_ are passed as parameters to the program.
``` bash
java -classpath /home/bla/java HelloWorld.java Param1
```

### Type inference for lambdas
var was introduced in Java10. The ability to use it in lambdas has been introduced in Java11.

``` java
list.stream()
	.map((var s) -> s.toLowerCase())
	.collect(Collectors.toList());
```
We already had type inference in lambdas, the difference is that with var we can use now type annotations to Lambda parameters.

``` java
lists.stream()
	.map((@Notnull var s) -> s.toLowerCase())
	.collect(Collectors.toList());
```

[More info on type annotations.](https://www.logicbig.com/tutorials/core-java-tutorial/java-8-enhancements/type-annotations.html)

### Async HTTP Client Protocol API
It was included in _Java9_ as an _incubator module_. In Java11 it was moved to be a part of _Java SE Standard_.
The new classes are:

* HttpClient
* HttpRequest
* HttpResponse
* WebSocket

This API can be used sync. or async. This last one makes use of:

* CompletableFutures
* CompletionStages

### String API improvements
#### String#Repeat
Allows concatenating a String with itself a number x of times
``` java
String s = "bla ";
String result = s.repeat(2); // bla bla
```

#### String#isBlank
Checks wether a String is empty or contains a whitespace
``` java
String s = "";
boolean result = s.isBlank(); // true
```

#### String#strip
Deletes whitespace on the start & end of a String. The difference with String#trim is that **this is unicode aware.** It relies on the same definition of whitespace as String#isBlank. This is a preparation for *raw strings* that will be implemented in Java12.
``` java
String s = " bla ";
String result = s.strip(); // bla (without spaces)
```

#### String#lines
To easily split a String into a Stream<String> of separate lines.
``` java
String s = "bla\nble";
List<String> lines = s.lines()  
	.collect(Collectors.toList()); // bla  
  				       // ble
```

### Misc
JavaEE and CORBA modules were removed.

### References
[https://www.azul.com/90-new-features-and-apis-in-jdk-11/](https://www.azul.com/90-new-features-and-apis-in-jdk-11/)  
[https://4comprehension.com/java-11-string-api-updates/](https://4comprehension.com/java-11-string-api-updates/)
