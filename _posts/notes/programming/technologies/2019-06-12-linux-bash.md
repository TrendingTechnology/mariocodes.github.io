---
layout: post
title: Advanced Bash / Zsh
date:   2019-06-12 10:25:00 +0100
categories: programming technologies linux bash zsh
permalink: /notes/technologies/linux-bash-zsh
---
### Basics
#### Get a command's cheat-sheet with examples
~~~ bash
curl cheat.sh/command_to_search
~~~

#### Processing files and data
* `find . -iname "*file_to_search*"` at the current directory  
* `locate file_to_search` whole computer
* `rg` general searching through data files. Better than `grep -r`

##### Analyze logs in real time
With `less +F` we can inspect the file, stop to read and resume in real time.
The advantage over `tail -f` is, with the former we can inspect the logs, but if there's an error or something we want to stop and see, we have to exit and `cat` or `vim` the file.  
~~~ bash
less +F file_to_inspect # real time
ctrl + c # stops
shift + F # resumes
~~~
<!--more-->
#### Discard normal & error output of a command
`> /dev/null` Redirects standard output to /dev/null  
`2>&1` redirects error output to same as standard output
~~~ bash
command_to_execute > /dev/null 2>&1
~~~

### Reference(s)
[https://github.com/jlevy/the-art-of-command-line?utm_campaign=explore-email&utm_medium=email&utm_source=newsletter&utm_term=weekly](https://github.com/jlevy/the-art-of-command-line?utm_campaign=explore-email&utm_medium=email&utm_source=newsletter&utm_term=weekly)
