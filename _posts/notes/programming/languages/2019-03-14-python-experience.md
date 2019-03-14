---
layout: post
title: Python - Cheat sheet
date:   2019-03-14 17:53:00 +0100
categories: programming python web_scrapper cheatsheet
permalink: /notes/languages/python
---
## Pip
Usage to install a package

``` bash
python -m pip install flask
```
## BeautifulSoup
### Find all elements of tag
``` py
def find_tag(self, tag):  
        paragraphs = self.soup.find_all(tag)  
        paragraph = paragraphs[0]  
        text = paragraph.get_text()
```
<!--more-->
### Find first element of tag
``` py
def find_first_tag(self, tag):
        paragraph = self.soup.find(tag)
        text = paragraph.get_text()
```

### Find elements of a class        
``` py
def find_by_class(self, wanted_class):
        tags = self.soup.find_all(class_=wanted_class)
```

### Find element with id
``` py
def find_by_id(self, wanted_id):
        tag = self.soup.find_all(id=wanted_id)
```

### Find element of tag with class
``` py
def find_tag_by_class(self, tag, wanted_class):
        tags = self.soup.find_all(tag, class_=wanted_class)
```

### Find elements with CSS selectors
``` py
def search_by_css_selectors(self, selector):
        tags = self.soup.select(selector)
```
