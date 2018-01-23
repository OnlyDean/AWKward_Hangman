#!/bin/bash

#awk '{ printf'Guess A Letter: ' getline < /dev/tty }'

#awk '{ printf "Guess A Letter: "; getline name<"-"; prinf "Your Letter Was :" print name}'

#      ______
#      |    |
#           |
#	   |
#	   |
#	   |
#	   |
#   !~~~~~~~~~~~!	   


#echo "choose a letter: "
#read 
#echo "Your letter was: $REPLY"
get_secret_word () {
#    rm word_list
#    mkfifo word_list
    awk '/^[A-Za-z]+$/ {if (length($1) > 3 && length($1) < 9) 
        print $1}' /usr/share/dict/words > /tmp/word_list
    word_list_length=$(wc -l /tmp/word_list | awk '{print $1}')
    random_number=$(( $RANDOM%$word_list_length ))
    secret_word=$(sed "${random_number}!d" /tmp/word_list)
#    return $secret_word
}
get_secret_word
echo $secret_word
