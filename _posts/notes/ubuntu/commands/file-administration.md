# File administration
## Cmp
Compares Files byte by byte to see if they're different.

### compare 2 files
I have 2 files, `file1` and `file2` with the contents `this is filex` where `x` is the number of the file.

* `cmp file1 file2`

The result will be
```
file1 file2 differ: byte 13, line 1
```

## Locate files or executables.

### executables
* `whereis {$command}` - executables

### files
#### find
Finds recursively a file in a directory, showing the full path.

* `find . -print | grep -i 'name_to_search'`

If I search for `exe` the result will be

		./bin/tomcat8.exe
		./bin/tomcat8w.exe
		./webapps/docs/config/executor.html

#### locate
Finds a file, looking at the whole system.

* `locate {$file_to_search}`

output

		/home/msanchez/.local/share/Trash/files/tomcat-feature1
		/home/msanchez/.local/share/Trash/files/tomcat-feature1.10
		/home/msanchez/.local/share/Trash/files/tomcat-feature1.11
		/home/msanchez/.local/share/Trash/files/tomcat-feature1.12
		/home/msanchez/.local/share/Trash/files/tomcat-feature1.13


## Rename
Renames files in a current directory, following certains patterns.  

_Example:_ I want to substitute all the ocurrences of `:` for `-` in all the files from the current directory

1. navigate to the directory which contains all the files
2. `rename 's/\:/-/g' *.txt -vn`

## Tar
Compresses an entire directory or a single file into a `.tar.gz` or a `.tar` file.

### Compress
	tar -czvf {$name-new}.tar.gz {$path}
	tar -czvf {$name-new}.tar.gz {$path} {$second-file} {$third} ...
	tar -czvf {$name-new} --exclude=/path/file.*

### Extract
	tar -xzvf {$file.tar.gz} -C {$path-to-extract}

## mv
* `-i` - Interactive
* `-u` - Update. Only if the file is newer or missing in the dest. folder.
* `-v` - Verbose.
