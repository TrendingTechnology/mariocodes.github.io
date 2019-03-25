---
layout: post
title: Java11 - Run file as a script
date:   2019-03-20 18:09:00 +0100
categories: programming java java11
permalink: /notes/languages/java/java11/scripting
---
_(This uses > java11)_  

To run a file as Java, we don't need to do anything special to the `.java` file. Just write a class with a `main()` method and call it with `java --source 11 file.java`  

## Linux Shebang
To start it as a script in Linux we need to add java's shebang `#!/opt/jdk-11/bin/java --source 11` and do it executable `chmod +x file.java`. The shebang may need to be replaced if the java path is different.  

## Important
If we're starting a java file as a script, the file's name **cannot** end with `.java` or it won't work.
