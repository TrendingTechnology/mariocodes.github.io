---
layout: post
title: Spring in Action (1/5) - Foundational Spring
date:   2019-04-03 12:10:00 +0100
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
<!--more-->

## Project structure
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

## Main's config
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

## Web requests
The basic structure is an application which will be started with the embedded tomcat. A controller marked with `@Controller` tag and a `@GetMapping("/")` tag, which returns the name of the _Thymeleaf_ view to give to the browser.  

Controller class. It handles HTTP Requests and either gives it to a view to return HTML or writes data directly to the body (RESTful)  

### basic controller
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

### view controller
For a `@Controller` which is used just to redirect a _path_ to a _view_ and it doesn't adds any kind of input to the Model, we may implement it with just a single a line at a `WebConfig` file.  
The example implemented on top would be better as the following
~~~ java
@Configuration
public class WebConfig implements WebMvcConfig {

  @Override
  public void addViewControllers(final
            ViewControllerRegistry registry) {
    registry.addViewController("/")
            .setViewName("home");
  }

}
~~~

### request mapping tags
* `@RequestMapping(method = RequestMethod.GET)` general tag prior to Spring 4.3
* `@GetMapping` handles `HTTP GET` request
* `@PostMapping` handles `HTTP POST` request
* `@PutMapping` handles ...
* `@DeleteMapping`
* `@PatchMapping`

### thymeleaf
_(See thymeleaf notes)_

## Full Validation Example
Java's validation API works with Spring and Hibernate, this last adds a bunch of annotations to use and may work together between Model, View and Controller.

### declare validation rules
This is done at the model.
~~~ java
@Data
public class Taco {

  @NotNull
  @Size(min=5,
        message="must be at least 5 chars long")
  private String name;

  @Size(min=1,
        message="must choose at least 1 ing")
  private List<String> ingredients;

}
~~~

We also have other tags such as
~~~ java
@NotBlank(message="name is required")
private String name;

@CreditCardNumber(message="card not valid")
private String ccNumber;

@Pattern(regexp="here comes the regex",
         message="must be MM/YY")
private String ccExpiration;

@Digits(integer=3, fraction=0,
        message="invalid CVV")
private String ccCVV;
~~~

### activate validation
This is done at the controller w. `@Valid`.
~~~ java
@PostMapping
public String process(@Valid
@ModelAttribute("design") final Taco design,
                          final Errors errors)
{
  if(errors.hasErrors()) {
    return "design";
  }
  // do something
  return "viewX";
}
~~~
If an error is found, the details of this error will be loaded into the `Errors` object

### access the errors
This is done at the view.
~~~ html
<form method="POST" th:object="${design}">

<div th:if="${#fields.hasErrors()}">
    <p class="validationError">
      Please, correct following problems
    </p>
</div>

<div>
  <h3>Name your Taco creation:</h3>

  <span class="validationError"
        th:if="${#fields.hasErrors('name')}"
        th:errors="*{name}">Placeholder</span>
  <br/>
  <input type="text" th:field="*{name}"/>

  <button>Submit your taco</button>
</div>
</form>
~~~

### all broken together
1. The tags `@NotNull` declare what's wrong and when an Error should be thrown.  
2. At the controller with the line `@Valid @ModelAttribute("design") final Taco design` we declare what the model is and we assign it an `id = design`.  
3. At the view form:
* we access this model with `th:object="${design}"`
* we check if the form has any error(s) with `th:if="${#fields.hasErrors()}"` to show a general error
* we check a specific field with `th:if="${#fields.hasErrors('name')}"` and access the error message with `th:errors="*{name}"` to overwrite the placeholder.  
  This `name` is a field of the model we gave. At this example `Taco` has a `private String name` field which is the one we're checking here.

## Databases
### JDBC (Java DataBase Connection)
Its support is rooted at `JdbcTemplate.java`. It provides a mean for developers to perform SQL operations against a relation database without boilerplate code.

Generally it's a good idea to add an `id` field and a `createdAt` field to your beans, to know at which date and time the object was created and persisted.

**(Add link to Github where this was implemented)**

#### Working with JdbcTemplate
Dependencies to add:
~~~ xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
~~~
**(WIP)**
