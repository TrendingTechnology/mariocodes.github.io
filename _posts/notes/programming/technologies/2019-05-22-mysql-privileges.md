---
layout: post
title: MySQL User Privileges
date:   2019-05-22 09:22:00 +0100
categories: technologies sql
permalink: /notes/technologies/sql/privileges
---
How to grant privileges for a database to a user, when both already exist.  

In this case the database name will be `project_node1`, the user `project_user` and the password `project_pass`. All the following commands have to be executed as `root` or with a user with enough privileges.  

~~~ sql
-- list system users
SELECT user, host FROM mysql.user;

-- see current privileges
SHOW GRANTS FOR 'project_user'@'%';

-- delete all previous privileges (if needed)
-- REVOKE ALL PRIVILEGES ON `project_node1`.* FROM 'project_user'@'%';

-- grant new privileges and flush
GRANT ALL PRIVILEGES ON `project_node1`.* TO 'project_user'@'%';
FLUSH PRIVILEGES;
~~~

#### Reference(s)  
[https://serverfault.com/questions/115950/how-do-i-change-the-privileges-for-mysql-user-that-is-already-created](https://serverfault.com/questions/115950/how-do-i-change-the-privileges-for-mysql-user-that-is-already-created)
