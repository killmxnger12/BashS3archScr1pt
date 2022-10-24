#!/usr/bin/bash

search_item=$1 # Item to search
source_file=$2 # Source file
array_of_textlines=() # Lines of the text file - array
exact_matches=0 # Contains the number of the exact string matches
similar_matches=0 # Contains the number of the similar string matches

while read -r Current_line; do
	array_of_textlines+=$Current_line;
done < $source_file

for i in ${array_of_textlines[@]}; do
	if [[ $i == $search_item ]]; then
		exact_matches=$((exact_matches+1))
	elif [[ $i =~ $search_item ]]; then
		similar_matches=$((similar_matches+1))
	fi
done

echo "There are $exact_matches of exact matches in the source file"
echo "There are $similar_matches of words containing the search phrase in the source file"