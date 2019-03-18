---
layout: post
title: SQL - administration
date:   2019-03-18 13:59:00 +0100
categories: programming technologies sql cheat-sheet
permalink: /notes/technologies/sql/administration
---
_(All this commands are for MySQL)_  

### Connection
Connect to DB from CLI

~~~ bash
mysql -u {$user} -p    
~~~

### User
* `SELECT CURRENT_USER();` See current logged user   

##### Change password when we know the old one  
~~~ sql
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('myNewPassword');
~~~
<!--more-->
##### Create new User
~~~ sql
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
~~~

##### Grant Privileges to user
~~~ sql
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost'
	WITH GRANT OPTION;
~~~
