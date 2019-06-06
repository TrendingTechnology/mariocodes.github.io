---
layout: post
title: Generate a builder with Lombok
date:   2019-06-06 13:25:00 +0100
categories: programming java lombok
permalink: /notes/languages/java/lombok/builders
---  

Is possible to auto-generate builders for a Java class using `@Builder` lombok annotation. They're really simple though and do not provide auto-filling. They just create an API to fill them with test data.  

All we need is to put the annotation into a Java class
~~~ java
@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PersonDto {

  private long id;

  private String name;
  private int age;

  @Singular
  private Set<String> hobbies;

}
~~~  

<!--more-->

This provides the basic API to use them as follows  

~~~ java
public class Whatever {

  public PersonDto buildPerson() {
    return PersonDto.builder().age(18)
                              .hobby("live")
                              .name("Sergey")
                              .id(11235434L)
                              .build();
  }

}  
~~~  

The `@Singular` annotation is given to `Collections` and it adds a couple of methods. One to add a single Object, another to add Collections of Objects and a third one to clear all.  

## Reference(s)
[https://www.projectlombok.org/features/Builder](https://www.projectlombok.org/features/Builder)
