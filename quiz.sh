#!/bin/bash

#	Players Name arguments and variables
player="${1}"
question="What command shows current directory?"

#	Quiz structure
echo -e "Welcome ${player}! \n"
echo -e "Question 1: \n"

echo "${question} You have 5 secs."
echo "a) pwd"
echo "b) ls"
echo "c) cd"

echo "Your Answer! By typing either a,b or c."

read -t 10 -n 1 -r -p "Answer: " choice

#	Algorithm behind answer

if [ [ "$choice" == a ] ]; then
	echo -e "\n\nCorrect answer"
else
	echo -e "\nPlease try again later. \n"
fi

echo -e "\nFinal Score: 3/5 \nExcellent!"
