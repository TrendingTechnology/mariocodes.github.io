# System

## Files size
Estimate file space usage

		du -hs *

output

		94M	catalina.out
		4.1M	intellij-logs
		1.8M	jekyll
		1.2G	mongodump
		780M	sftp
		28M	sql

#### modifiers
* `du --apparent-size -hs * | sort -rh` see size of files in current directory, order by size desc.


* `--apparent-size` shows size of file instead of disc usage
* `-hs` human readable » summarize
* `(sort) -rh` - reverse » compares human readable numbers

## Java processes
* `jps -m` Obtain running Java Names from PID
* `top -p {$pid}` Obtain PID and check resource usage from single java programme.

## Processes
Find a process by name

	pgrep {$name_of_process}

 output (PID)

		19223
		19233
		19263
		19274


## Services
See a list of all the services status in your computer.

	service --status-all

output

		[ + ]  ssh
		[ - ]  sslh
		[ + ]  thermald
		[ + ]  udev

		## Sym links
		To create a new symbolic link

			ln -s ${target} ${links_name}

## Sym-links
Folder shortcut _(soft link)_.

* `ln -s ${target_location} ${where_we_want_the_link}`

## System's Info
* `uname -a` Find the bits of the system
* `lsb_release -a` Know my version of Ubuntu


## System Packages
* `dpkg --get-selections | grep {$to_search}` Search for installed packages
* `dpkg -l "{$string_to_search*}"` See versions of installed packages

## (Un)mount pendrive
### mount
To mount it into sda1

		sudo mount /dev/sda1 /media/usb

### unmount
* To know in which drive is the pendrive `lsblk`  

Once known, unmount and power off pendrive:
* `udisksctl unmount -b /dev/${partition_found}`  
* `udisksctl power-off -b /dev/${partition_found}`

If target is busy `sudo umount -l /dev/sda1`
