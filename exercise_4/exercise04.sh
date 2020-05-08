#!/bin/bash
grep -iwcE 'china|chinese' *.tsv
cut -f 9 *.tsv | grep -iwcE 'china|chinese'
cut -f 6 *.tsv | grep -E '[0-9]{4}-[0-9]{3}[X|0-9]' | wc -l
cut -f2 *.tsv | sed '/^$/d'
cut -f2 *.tsv | sed '/^$/d' | sort | uniq
cut -f 6 *.tsv | grep -ohE '[0-9]{4}-[0-9]{3}[X|0-9]' | sort -n | uniq