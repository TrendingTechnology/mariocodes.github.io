---
layout: post
title: Thymeleaf
date:   2019-04-02 12:54:00 +0100
categories: programming java frameworks thymeleaf
permalink: /notes/frameworks/java/spring/thymeleaf
---

Thymeleaf is an HTML template engine, which provides full Spring support.

~~~ html
<h3>Designate your wrap:<h3>
  <div th:each="ingredient: ${wrap}">
    <input name="ingredients" type="checkbox"
            th:value="${ingredient.id}" />
    <span th:text="${ingredient.name}">ING</span>
    <br/>
  </div>
~~~

## Simple Tags

* `th:src="@{images/taco.png}"` retrieves an image with relative path from `/static/`
* `th:href="@{/styles.css}"` retrieve a css file
<!--more-->

## Retrieve an attribute
`th:object="${id}"`  

I add into the Model an attribute, for exampel a Taco with id `tacoDesign`  

**DesignTacoController.java**
~~~ java
@GetMapping
public String process(final Model model) {
  model.addAttribute("tacoDesign", new Taco());
  return "design"; // return thymeleaf view
}
~~~

At the view, we retrieve it like

**design.html**
~~~ html
<form method="POST" th:object="${tacoDesign}">
  <!-- Form body -->
</form>
~~~

## Iterate lists
`th:each = ${subelement_id: list_id}`  

Same example as above. There's a list from Objects added into the _Model_ at Java and they've to be retrieved at the HTML form.
~~~ java
@GetMapping
public String process(final Model model) {
  final Ingredient ing1 =
      new Ingredient("FLTO", "Flour tortilla", Type.WRAP);
  final Ingredient ing2 =
      new Ingredient("COTO", "Corn tortilla", Type.WRAP);

  final List<Ingredient> ingredients =
                      Arrays.asList(ing1, ing2);

  /**
   * This adds a lists into the model with 2 Ingredients
   *    with id = wrap
   */
  for(final Type type : Type.values()) {
    model.addAttribute(type.toString().toLowerCase(),
      filterByType(ingredients, type));
  }

  return "design";
}
~~~

Iterate **only** the `wrap` ingredients
~~~ html
<div th:each="ingredient: ${wrap}">
  <input name="x" type="y" th:value="${ingredient.id}"/>
  <span th:text="${ingredient.name}">PLACEHOLDER</span>
</div>
~~~
