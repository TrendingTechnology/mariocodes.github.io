# TR

## Substitute one char for another in a file.
```
tr 'actual_char' 'desired_char' < file_name >> output_file
```

### Example
Substitute slash followed by comma separated file by new line separated.
```
tr "'," "\n" < main_tag >> parsed - example
```
