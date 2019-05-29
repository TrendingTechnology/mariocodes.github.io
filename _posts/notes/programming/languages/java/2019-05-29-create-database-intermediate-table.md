---
layout: post
title: Databases, link an intermediary table in Java
date:   2019-05-28 7:25:00 +0100
categories: programming java hibernate
permalink: /notes/languages/java/link-intermediary-table
---  
_(This was done with MySQL, Hibernate and Lombok)_  

**Setting:** We have two Entities, `Category` and `Code`. Some _categories_ must contain x _codes_, others cannot contain y _codes_ and we want to leave open the possibility to "must contain z but not p" at the same time.

**How:** At database level we'll have 4 tables with the following structure

#### client_category  

|   FIELD_NAME   	|  FIELD_TYPE  	|    CONSTRAINTS   	|
|:--------------:	|:------------:	|:----------------:	|
| id             	| bigint(19)   	| PK (primary key) 	|
| example_string 	| varchar(255) 	|                  	|
| example_bool   	| tinyint(1)   	|                  	|  

<!--more-->  

#### client_code  

| FIELD_NAME 	|  FIELD_TYPE  	|    CONSTRAINTS   	|
|:----------:	|:------------:	|:----------------:	|
| id         	| bigint(19)   	| PK              	|
| value      	| varchar(255) 	|                  	|

#### client_category_contains_code

|     FIELD_NAME     	| FIELD_TYPE 	|            CONSTRAINTS           	|
|:------------------:	|:----------:	|:--------------------------------:	|
| id                 	| bigint(19) 	| PK                              	|
| client_category_pk 	| bigint(19) 	| FK_client_category_contains_code 	|
| client_code_pk     	| bigint(19) 	| FK_client_code_contains_code     	|

#### client_category_does_not_contain_code

|     FIELD_NAME     	| FIELD_TYPE 	|                CONSTRAINTS               	|
|:------------------:	|:----------:	|:----------------------------------------:	|
| id                 	| bigint(19) 	| PK                                      	|
| client_category_pk 	| bigint(19) 	| FK_client_category_does_not_contain_code 	|
| client_code_pk     	| bigint(19) 	| FK_client_code_does_not_contain_code     	|  

The FKs (foreign keys) of the last two tables point to the PKs of *client_category* and *client_code* respectively. Important to be able to create this constraints is that they are the same type and have the same length.  

This are the Java classes, representation of our Entities:  

~~~ java
@Entity
@Getter
@Setter
@Table(name = "client_code")
public class ClientCode {

  @Id
  @GeneratedValue(strategy =
    GenerationType.IDENTITY)
  private Long id;

  @Column(name = "value")
  private String value;

}
~~~

~~~ java
@Entity
@Getter
@Setter
@Table(name = "client_category")
public class ClientCategory {

  @Id
  @GeneratedValue(strategy =
    GenerationType.IDENTITY)
  private Long id;

  @Column(name = "example_string")
  private String exampleString;

  @Column(name = "example_bool")
  private Boolean exampleBool;

  @OneToMany(fetch = FetchType.EAGER)
  @JoinTable(name =
    "client_category_contains_code",
    joinColumns =
      @JoinColumn(name = "client_category_pk",
                  referencedColumnName = "id"),
    inverseJoinColumns =
      @JoinColumn(name = "client_code_pk",
                  referencedColumnName = "id"))
  private Set<ClientCode> containsCode;

  @OneToMany(fetch = FetchType.EAGER)
  @JoinTable(name =
    "client_category_does_not_contain_code",
    joinColumns =
      @JoinColumn(name = "client_category_pk",
                  referencedColumnName = "id"),
    inverseJoinColumns =
      @JoinColumn(name = "client_code_pk",
                  referencedColumnName = "id"))  
  private Set<ClientCode> doesNotContainCode;

}
~~~  

The connection between tables at Java is built through _javax annotations_. This way, when we use our DAOs to retrieve a `ClientCategory`, _Hibernate_ will automatically retrieve all the `ClientCode` and populate them into the appropiate `Set<ClientCode>`.
