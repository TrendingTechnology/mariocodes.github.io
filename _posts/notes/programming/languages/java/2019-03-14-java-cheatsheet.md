---
layout: post
title: Java - experience cheat sheet
date:   2019-03-14 17:27:00 +0100
categories: programming java cheat-sheet
permalink: /notes/languages/java
---
## Convert checked into unchecked exception
_(Test example in private Repo)_  

Use `Unchecked.consumer()`  

``` java
private OrderRepo repo;

public File exportFile(String fileName) {
  File file = new File("export/" + fileName);
  try (Writer writer = new FileWriter(file)) {
    writer.write("ID;Date\n");
    repo.findByActiveTrue()
    .map(o -> o.getId() + ";"
    	+ o.getCreationDate())
    .forEach(Unchecked.consumer(writer::write));
  }
}
```

### Reference
[Conference (18:45)](https://www.youtube.com/watch?v=YnzisJh-ZNI)

<!--more-->
## Time
### Obtain last day of a month
_(This uses Java8 Time API)_

``` java
final LocalDate invoiceDate =  
		position.getReferenceDate();
final int month = invoiceDate.getMonthValue();
final int year = invoiceDate.getYear();
final YearMonth yearMonth =   
		YearMonth.of(year, month);
final int lastDayOfMonth =   
		yearMonth.lengthOfMonth();
```

## Read file sequentially  
This reads big files _(>200 MBs)_ without loading the whole File in memory. This way we're able to read text files on the Gigabyte level. This example was done reading from a remote SFTP server.  

~~~ java
final ChannelSftp sftpClient = this.connect();
final InputStream is = sftpClient.get(file);
final InputStreamReader isReader
      = new InputStreamReader(is);  

try (final BufferedReader bffReader  
      = new BufferedReader(isReader)) {
  bffReader.lines()
        .forEach(this::doAction);
} catch(final IOException ex) {
  log.error("bla", ex);
}
~~~

## Testing
### Inject SpringContext into IT _(JUnit)_

To inject Spring's context into an Integration-Test. Instead of @RunWith(...) [JUnit]

``` java
@ContextConfiguration(classes = { SpringConfig.class })
public class testIT extends AbstractTestNGSpringContextTests {

	@Autowired
	private Object whatever;

	...
}
```

### BDDAssertions
_(This uses BDDCatchException, Mockito and AssertJ)_  

Mock an exception, which will be thrown and caught

``` java
// Given
BDDMockito.given(mock.method())  
		.willThrow(Exception.class);

// When
BDDCatchException.when(mainTestedClass).method();

// Then
BDDAssertions  
.assertThat(BDDCatchException.caughtException())  
.isNull();
```

Test an exception is thrown:

``` java
// Given
CrudService service = new CrudService() {};
String userName = "admin";

// When
BDDCatchException.when(service)  
.methodToExecute(userName);

// Then
BDDAssertions  
.then(BDDCatchException.caughtException())  
.isInstanceOf(NameOfExpectedException.class);
```

Test no exception is thrown:

``` java
...
// Then  
BDDAssertions  
.then(BDDCatchException.caughtException())  
.isNull();
```

### Inject mock into 'new' operator

``` java
// Real class  
protected JSch createStubInstance() {
	neturn new JSch();
}

// Test class  
@Test
public void testWhatever() {  
  JSch jschMock = Mockito.mock(JSch.class);  

  BDDMockito.given(realClass.createStubInstance())  
	.willReturn(jschMock);
}
```

## Javadoc
Link javadoc to a method of the same class

``` java
/*
* This method does the same as
* {@link #escape(Parameters) escape}
* but with lists
*/
```

## Spring
### Clean Dirty context
When we use Spring's DI in an integration test, the context may be dirty between every test and must be cleaned. This is done with `@DirtiesContext` tag.

``` java
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(classes =  
	{ CoreConfig.class })  
@DirtiesContext(classMode = ClassMode.BEFORE_EACH_TEST_METHOD)  
public class ASCIISystemIT { ... }  
```
