Annemarie Szyprons, 11141379 

# Exercise 04.1 #
`grep -iwcE 'china|chinese' *.tsv`

`grep` supports regular expressions and helps searching for somethings in one or more files

`-iwcE` are options for which work with grep. `i` is case insensitive, so China and china would be found. `w` searches for whole words only. `c` prints the number of times the string appeared in each file. `E` is used for extending regular expressions to search for something more complex. 

`'china|chinese'` prints either china or chinese.

`|` is in this case a this OR that.

`*.tsv` finds all tsv-files

# Exercise 04.2 #
`cut -f 9 *.tsv | grep -iwcE 'china|chinese'`

`cut -f9` cuts out column 9 in every tsv-file 

`|` redirects the output/command into another program

# Exercise 04.3 #
`grep -E '[0-9]{4}-[0-9]{3}[X|0-9]' *.tsv | wc -l`

`grep -E` for using extended regular expressions

`[0-9]{4}-[0-9]{3}[X|0-9]` searches for a string with four characters between 0 and 9, then '-' and then again 3 characters between 0 and 9 and then an X OR a character between 0 and 9.

`wc -l` prints number of lines in a file

# Exercise 04.4 #
`cut -f2 *.tsv | sed '/^$/d'`

`cut -f2 *.tsv` cuts out column 3 in every tsv-file

`sed '/^$/d'` command for deleting blank rows

# Exercise 04.5 #
`cut -f2 *.tsv | sed '/^$/d' | sort | uniq -u`

`sort` sorts content of the file, line by line

`uniq -u` prints only unique occurrences that are not repeated

# Exercise 04.6 #
`grep -ohE '[0-9]{4}-[0-9]{3}[X|0-9]' *.tsv | sort -n | uniq`

`-o` shows only the part of a line matching pattern

`-h` supresses the file name prefix on output

`sort -n` sorts content of a file numerical-based

`uniq` prints unique occurences and deletes duplicates


