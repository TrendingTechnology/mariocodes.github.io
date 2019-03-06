---
layout: post
title: Java frameworks - Testing notes
date:   2019-03-06 13:28:00 +0100
categories: programming java frameworks testing assertj codearte
permalink: /frameworks/java/testing
---

## Codearte's Catch exception
The only thing it does, it's to do a bit easier to test and assert for exceptions in a Test Driven Development-like way. **To use together with AssertJ.** It only has two methods which are useful to me:
```
// When
BDDCatchException.when(this.instance).methodWhichThrowsException();

// Then
Assertions.assertThat(BDDCatchException.caughtException())
            .isNotNull()
            .isExactlyInstanceOf(IndexOutOfBoundsException.class);
```

#### Reference
https://github.com/Codearte/catch-exception
<!--more-->
## AssertJ  
Outside of the basic `Assertions.assertThat(x).isEqualTo(y);` there is:

### Soft Assertions  
Used to assert DTOs. With the basic Assertion when the first fails, it stops there and only shows that error. With soft assertions it executes all and shows all where there was an error.
```
SoftAssertions.assertSoftly(soft -> {
    soft.assertThat(dto.getName()).isEqualTo("nme");
    soft.assertThat(dto.getAge()).isEqualTo(90);
    soft.assertThat(dto.getRace()).isEqualTo(Race.HUMAN);
});
```

### Assert Collections
Assertions if the original Beans are accessible to compare against
```
// Given
final TolkienCharacter aragorn = new TolkienCharacter("aragon", 200, Race.HUMAN);
final TolkienCharacter frodo = new TolkienCharacter("frodo", 30, Race.HOBBIT);
final TolkienCharacter sam = new TolkienCharacter("sam", 30, Race.HOBBIT);
final List<TolkienCharacter> fellowship = Lists.newArrayList(aragorn, frodo, sam);

// When

// Then
Assertions.assertThat(fellowship)
        .filteredOn(character -> character.getName().contains("a"))
        .hasSize(2)
        .containsOnly(aragorn, sam);
```  

Assertions if the original Beans are not accessible, or it woul be too much work to create them.
```
// Given
final List<TolkienCharacter> fellowship = this.prepareFellowship();

// When

// Then
Assertions.assertThat(fellowship)
        .extracting("name", String.class)
        .contains("aragorn", "frodo", "sam")
        .doesNotContain("sauron");
```
#### Reference
https://joel-costigliola.github.io/assertj/assertj-core-features-highlight.html
