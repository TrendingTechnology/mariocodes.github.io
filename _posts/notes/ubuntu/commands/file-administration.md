# File administration
## Compare files
Compares Files byte by byte with `CMP` to see if they're different.

#### compare 2 files
I have 2 files, `file1` and `file2` with the contents `this is filex` where `x` is the number of the file.

* `cmp file1 file2`

The result will be
```
file1 file2 differ: byte 13, line 1
```

## Locate files or executables.

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

### executables
* `whereis {$command}` - executables

## Rename
Renames files in a current directory, following certains patterns.  

_Example:_ I want to substitute all the ocurrences of `:` for `-` in all the files from the current directory

1. navigate to the directory which contains all the files
2. `rename 's/\:/-/g' *.txt -vn`

## Compress
### Tar
Compresses an entire directory or a single file into a `.tar.gz` or a `.tar` file.

* Compress  
~~~ bash
tar -czvf {$name-new}.tar.gz {$path}
tar -czvf {$name-new}.tar.gz {$path} {$second-file} {$third} ...
tar -czvf {$name-new} --exclude=/path/file.*
~~~

* Extract  
~~~ bash
tar -xzvf {$file.tar.gz} -C {$path-to-extract}
~~~

## Split files
### evenly by lines
This preserves all special chars such as `CR`  

~~~ bash
split -ul {$number_of_lines} {$file_to_split} {$prefix_for_new_files}
split -ul 100 AccountingExport.csv AccountingExportChunk
~~~  

* `-u` unbuffered. It outputs exactly the same as input without deleting `\t` `\n` etc.
* `-l` number of lines to split by
