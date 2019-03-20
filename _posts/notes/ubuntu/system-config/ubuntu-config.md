# Ubuntu config
## System variables

* `printenv` - see all of them

To add a new one, append it to `~/.bashrc`.  

~~~ bash
# maven
if [[ ! -d "M2_HOME" ]]; then
	export M2_HOME=/home/msanchez/Programs/apache-maven-3.5.0
	export MAVEN_OPTS=-DapplicationEnvironment=local_linux
	export PATH=$PATH:$M2_HOME/bin
fi
~~~

**If this does not work** Append it to `~/.profile`

~~~ bash
# Sublime
export SUBLIME_HOME=/home/msanchez/Programs/sublime_text_3
export PATH=$PATH:$SUBLIME_HOME
~~~

## Custom aliases
Append it at `~/.bash_aliases`

~~~ bash
# general aliases
alias google="google-chrome-stable --disable-gpu &"

# maven general
alias mavenbuild="mvn clean install -Dmaven.test.skip=true"
alias mavenrefresh="mvn clean install -U -Dmaven.test.skip=true"
alias mavencomplete="mvn clean install"

# move to trash instead of delete something
alias trash="gvfs-trash"
alias trash-ls="gvfs-ls trash://"
alias trash-empty="gvfs-trash --empty"
~~~

## Desktop-entries
They're saved at `cd ~/.local/share/applications`  

_intellij.desktop_

~~~ bash
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=IntelliJ
Path=/home/msanchez/Programs/intellij
Exec=/home/msanchez/Programs/intellij/bin/idea.sh
Icon=/home/msanchez/Programs/intellij/bin/idea.png
~~~

## Sotware repositories
Add a new repository through cli

~~~ bash
cd /etc/apt
vim sources.list
apt-get update
~~~
