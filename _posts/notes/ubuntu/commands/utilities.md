# Utilities
## gvfs-trash
Like `rm`, but moves the item to the trash instead of delete it forever.

* `gvfs-trash ${filename}` delete something
* `gvfs-ls trash://` see contents of trash
* `gvfs-trash --empty` empty the trash

## nmap
Mapping of current Net

* `nmap -sn 192.168.10.0/24` IP ping. Disable ports scan.
* `nmap -sT -O {$target_ip}` List target open ports

## nohup
Run commands truly in background.  
The difference with `{$any_command} &` is that you can close the terminal and it'll not close the process. By default it writes all the output to a `nohup.out` file.

	nohup {$command} &

Running without nohup.out file

	nohup {$command} >/dev/null 2>&1 &

* `>/dev/null` sends standard output to /dev/null _(throw it away)_.
* `2>&1` send standard error wherever standard output goes _(/dev/null is this case)_.

## scp
Remotely uploads / downloads files through `ssh`.  

Remote __download__ the contents of a folder to local

	scp -r user@host:path/to/file local/folder/file

Remote __upload__ from local to a server

	scp local/folder/file user@host:path/to/file

### modifiers
* `-v` verbose
