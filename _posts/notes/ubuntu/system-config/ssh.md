# SSH

## Generate new keys
First of all,  make a backup from your local `~/.ssh` in case you set wrong the path and override yours.

~~~ bash
ssh-keygen -b 2048 -t rsa
${enter_passphrase}
~~~

## Add / delete key to the system
* `ssh-add id_rsa` - adds it
* `ssh-add -d id_rsa` - deletes it
