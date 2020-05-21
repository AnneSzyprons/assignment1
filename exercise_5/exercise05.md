## Exercise 5.2. ##

{step} {change-command} 
1. remove column {column} 
2. blank down cells in {char}
3. join multi-valued cells in {dialog}. These three steps can merge the data.
4. use facet by blank (null or empty string)
5. filter all rows with "true" and remove matching rows
6. edit and cluster cells in {character}.  Merge characters when ther're not homogenous.
7. Text transform on cells in {dialog}: value.trim() Trim leading and trailing whitespaces
8. Text transform on cells in {dialog}: value.replace(/\s+/,' ') Collapse consecutive whitespaces.
9. Text transform on cells in {dialog}: value.replace(/^[\,\?\!\s]/i,"") Use regex to find all sentences which start with "," "?" "!" or whitespace and replace them with ""
10. Text transform on cells in {dialog}: value.trim()
11. Text transform on cells in {dialog}: value.replace(/\,/,"") Use regex to find all commas at the end of an sentence and replace them with ""
12. Text transform on cells in {dialog}: value.replace(/[^\!\.\?\'\w\"]$/,"") Use regex to find all sentences that not end with one of the mentioned characters in []
13. Text transform on cells in {dialog}: value.replace(" ,","") 
14. Text transform on cells in {character}: value.toTitlecase() Change to title case for the looks.
15. Text transform on cells in {dialog}: grel:value.replace(/\s\?/,"?") Use GREL to delete the whitespaces before a questionsmark.
16. Text transform on cells in {dialog}: grel:value.replace(/[\.]\,/,". ") 
17. Text transform on cells in {dialog}: value.replace(/\![^\s]/,"! ") 
18. Use value.trim() again
19. Text transform on cells in {dialog}: grel:toUppercase(substring(value,0,1 ))+toLowercase(substring(value,1)) Change sentences which start with a lowercase to a capital letter
20. Text transform on cells in {dialog}: value.replace("Lt","It") Some of the sentences had Lt instead of It in it. It looked similar
21. Text transform on cells in {dialog}: grel:value.replace(/\(,/,"(,)")
22. Text transform on cells in {dialog}: value.replace("))",")") Replace "(," with (,) and delete ) in case it's doubled
23. Text transform on cells in {dialog}: grel:if ("\w[^\.\!\?\']$",value, value+(".")) Add a period at the end of a sentence
24. Text transform on cells in {dialog}: value.replace("Mr Frodo","Mr. Frodo") to be homogenous
25. Text transform on cells in {dialog}: value.replace("Ive","I've") 
26. Remove blank rows in column {dialog}
27. Text transform on cells in {dialog}: grel:value.replace(/[^\u0020-\u007F]/,"").replace(" "," ") Remove all double code characters (doubled whitespaces for example)
28. Text transform on cells in {dialog}: grel:value.replace(".",". ").replace(" "," ") Replace sentences with no whitespace between begin and end
29. Text transform on cells in {dialog}: grel:value.replace("?","? ").replace(" "," ") Replace sentences with no whitespace between begin and end
30. Text transform on cells in {dialog}: grel:value.replace(",",", ").replace(" "," ") Replace sentences with no whitespace between begin and end
31. Text transform on cells in {dialog}: grel:replace(value, " , ", " ") to remove all unnessecary commas after "!" "?" or "."
32. Text transform on cells in {dialog}: value.replace(/\s+/,' ') Collapse consecutive whitespaces
33. Use value.trim() again
34. Sort movie alphabetically
35. Edit row 1356 in column {dialog} manually. Added ". " between two words.
36. Rename column {char} to {character} for better understanding
37. Add row 745 manually and delete "(" at the beginning
38. Change "Frodo Voice" to "Frodo Voice-over" manually in column {character}
39. Text transform on cells in {character}: grel:value.replace(/\s/,"_") Use "_" instead of a whitespace in column {character} and {movie} to avoid confusion when I analyse the data
40. Text transform on cells in {movie}: grel:value.replace(/\s/,"_").replace(/\_$/,"") to avoid confusion when I analyse the data
41. Download clean openRefine project as CSV 

## Exercise 5.3. ##

**5.3.1.**

`cat lotr_schript_szyprons.csv | wc -l` to print number of lines of the script

`awk -F "," '{print $2}' lotr_script_szyprons.csv | tr '[:punct:]' ' ' | tr ' ' '\n' | sort | uniq -ic | sort -r | wc -l`

`awk -F "," '{print $2}' filename` to split each input line into fields by consider "," as the seperator. Only print second column {dialog} Awk is an extra language for these patters.

`tr '[:punct:]' ' '` to remove punctation to merge for example You! and you. as one word

`tr ' ' '\n'` to translate (convert) every space character to a new-line character to get all the words in column {dialog} in seperate lines

`sort` to sort results alphabetically

`uniq -ic` to print unique words and count them

`sort -r` to show the most used words first 

`wc -l` to print number of lines

**5.3.2.**

`awk -F "," '{if($3 == "The_Return_of_the_King") print $2}' lotr_script_szyprons.csv | tr '[:punct:]' ' ' | tr ' ' '\n' | wc -w`

`awk -F "," '{if($3 == "The_Two_Towers") print $2}' lotr_script_szyprons.csv | tr '[:punct:]' ' ' | tr ' ' '\n' | wc -w`

`awk -F "," '{if($3 == "The_Fellowship_of_the_Ring") print $2}' lotr_script_szyprons.csv | tr '[:punct:]' ' ' | tr ' ' '\n' | wc -w`

Unfortunalety, I wasn't able to print the number of words all in one command. The results are shown in Distribution_Movie.txt

`awk -F ","` to split each input line into fields by consider "," as the seperator

`'{if($3 == "pattern") print $2}' filename` if the pattern is found in column 3 {movie} only lines of column two {dialog} will be printed

`tr '[:punct:]' ' ' | tr ' ' '\n'` to remove punctation to merge for example You! and you. as one word and to translate (convert) every space character to a new-line character to get all the words seperate lines

`wc -w` to print number of words


**5.3.3.**

`awk -F "," '{print $1}' lotr_script_szyprons.csv | sort | uniq -ic | sort -nr | head -5`

`awk -F "," '{print $1}' filename` to split each input line into fields by consider "," as the seperator and print only column one {character}

`sort` to sort output

`uniq -ic` to delete duplicates and count frequency

`sort -nr` to sort numerical and show the most used words first

`head -5` to show top five results

**5.3.4.**

At first, I saved the results of 5.3.1. in uniq_words.txt and created an extra textfile with all characters in character.txt. This made it easier to compare those two files and to filter the matching patterns.

`awk -F " " 'n[$2][$2]++' character.txt uniq_words.txt | head -5`

`awk -F " "` to split each input line into fields by consider " " as the seperator

`'n[$2][$2]++'` to compare two files. As the txt is already sorted, I just need to look for the words in file character.txt and find them in file uniq_words.txt. I used this command to look in both files in column 2.

`head -5` to show top five results

