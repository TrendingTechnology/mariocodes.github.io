---
layout: post
title: Spring in Action
date:   2019-03-26 13:42:00 +0100
categories: programming java frameworks books spring
permalink: /notes/frameworks/java/spring/spring-in-action
---
_(This are my notes taken from the book Spring in Action 5th Edition)_
## Spring parts
* `Spring core` Provides the core container, dependency injection framework, Spring MVC (Rest APIs), Spring's web framework and support for template-based JDBC and reactive programming with Spring WebFlux.  
* `Spring boot` Starter dependencies and autoconfiguration.
* `Spring data` Provides the ability to define your application's data repository as Java interfaces. Works with relational (JPA), document (Mongo) and graph (Neo4j) databases.
* `Spring security` Authentication, authorization and API security.
* `Spring integration & Batch` helps integrate with other applications
* `Spring cloud` helps with microservices

## Spring core / boot
### Project structure
    src/main/java
      ApplicationStarter.java

    src/test/java
      ApplicationStarterTest.java

    src/main/resources
      static
      templates
      application.properties

    mvnw.cmd
    pom.xml

* `mvnw.cmd` maven wrapper scripts. Used to build the project even without maven installed on your computer
* `static` folder to place images, stylesheets, js resources to serve to the browser
* `templates` folder to place template files that will be used to render content to the browser
<!--more-->

### Main's config
`@SpringBootApplication` is used at the main jar's Starter as in
~~~ java
@SpringBootApplication
public class ApplicationStarter {
    // main
}
~~~

It's a composition Tag which contains another three
* `@SpringBootConfiguration` Designates the class as a configuration one. is a specialized form of `@Configuration`
* `@EnableAutoConfiguration` Enables Spring to auto-configure any components that it thinks you may need
* `@ComponentScan` It lets you use another annotations such as `@Component` to declare Beans

### Web requests
Controller class. It handles HTTP Requests and either gives it to a view to return HTML or writes data directly to the body (RESTful)  

~~~java
@Controller
@RequestMapping("/design")
public class MyController {

    @GetMapping("/")
    public String home() {
        return "home"; // view name
    }

}
~~~

Thymeleaf will automatically search for `/templates/home.html` and return it as the view if it exists.

#### request mapping tags
* `@RequestMapping(method = RequestMethod.GET)` general tag prior to Spring 4.3
* `@GetMapping` handles `HTTP GET` request
* `@PostMapping` handles `HTTP POST` request
* `@PutMapping` handles ...
* `@DeleteMapping`
* `@PatchMapping`
