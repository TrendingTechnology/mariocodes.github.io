---
layout: post
title: Java Patterns
date:   2019-03-01 16:57:00 +0100
categories: test post
permalink: /patterns/
---
Implementation of several patterns in Java, which may be used as future example on how to technically implement them.

(TODO: add here an anchor to the current categories).
* Database
* Structural
* Behavioural
* Creational

___
## Database

### DAO & DTO
Data Access Object & Data Transfer Object.
DAO - Design pattern, used to encapsulate the access to a persistence resource (e.g a database) and eliminate dependencies which come with the implementation of the code.
DTO is the object which representates an entity of the database, with all its own properties to be manipulated.


## Structural
### Façade
Helps with Model View Controller. Establishes a new layer to separate and encapsulate the code.

### Singleton
Limits and sets a way to access an unique object instantiation during the whole execution of a program.

## Behavioural

### State
Allows to change the behaviour of an object through its own state. Depending the state the object is at, allows to manipulate it one way or another.
Parts:
 * Context - It contains the action which will change depending on the current state. When called this action, it will delegate into the State object saved.
 * State Interface - Contains the design of the action. The context will save this raw.
 * Concrete States - Each one extends the interface and will override the action & its results.

### Memento
Allows to restore an object to a previous state. It makes snapshots of the object and saves them, allowing later to restore any of them.
Behaviour pattern. It does save snapshots of a class, to be able to recover a previous state of an object.
Parts:
 * Originator - Class from which we save its states. e.g. a DTO.
 * Memento - It's a Snapshot which saves the content of the Originator in a punctual state.
 * Caretaker - Class where we do save the several Mementos. From it we do save or load Mementos.

## Creational
### Builder
Allows to create beans easily (and fluently) for cases where we have lots of parameters (+4-5), with some of them required and others optional.


### Factory
Uses factory methods to add an abstraction layout. Allows for example to be able to connect to several databases doing the swap by just changing two parameters in a config file.
___

### Patterns to take a look into
(TODO) Remove this section. Create and sync a Glo board and add this info directly as Issues into the repo.
* flyweight
* service provider framework
* bridge
* adapter
* template method
