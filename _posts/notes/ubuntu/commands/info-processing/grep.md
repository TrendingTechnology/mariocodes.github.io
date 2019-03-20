# Grep
## Modifiers
* `-v` do not include (opposite).
* `-i` case Insensitive.
* `-r` recursive.
* `-H` show file name where match found.
* `-n` show line number.
* `-o` show only matching lines
* `-A` show lines after
* `-B` show lines before
* `-C` show both


* `grep -E "8A 90 (0C|41) .* A. B."` - matching one char or another
* `grep -r {$pattern} --exclude-dir={$dirname}` - recursive but exclude a dir

## Wildcards
* `grep "8."` - single Character
* `grep "8.*"` - multiple Chars  
