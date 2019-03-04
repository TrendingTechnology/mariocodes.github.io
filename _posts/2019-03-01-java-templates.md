---
layout: post
title: Java templates
date:   2019-03-01 17:16:00 +0100
categories: programming java templates
permalink: /templates/java
---

Configurated out-of-the-box templates to start a project directly out of the box.  
All of them contain all the common Frameworks that I use to develop. The difference resides in the big Frameworks which modify the project's structure.  

### Full template
#### Main frameworks
* Maven
* Spring
* Vertx

#### How-to execute
```  
mvn clean install  
java -jar [name]-fat.jar -cluster
```  

### Spring Boot template
#### How-to execute
```  
mvn clean install
java -jar [name].jar  
```

### Shared Frameworks  
Frameworks I always use:
* Slf4j w. logback  
* Lombok  
* JUnit / TestNG
* Mockito / Powermock
* AssertJ
* BDDCatchException
* Google common
