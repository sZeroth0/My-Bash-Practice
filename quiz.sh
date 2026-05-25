#!/bin/bash

#	Players Name arguments and variables
player="${1}"
question=("What command shows current directory?" "I want to list files and directories in my current folder, which command?" "Which command requires careful usage especially with POSIX chars?")
score="0"
answers=("a" "b" "b")
#	Output colours
red=$(tput setaf 1)
blue=$(tput setaf 4)
green=$(tput setaf 2)
reset=$(tput sgr0)

#		if Players name argument is absent
	if [[ -z "${player}" ]]; then
	echo -ne "${red}Error: Player's name argument is absent!"
	echo -ne "${reset}"
	exit 1
	fi
clear 

#	Quiz Structure
echo -e "Welcome ${player}! to ${green} Linux Terminal Command Quiz.${reset}\n"
echo -e "You have 10secs to Answer each Questions. Select your anwser by either typing a,b or c. Goodluck!"
echo -ne "Type [y/n] to continue: ${blue}"
read -n 1 -r response
echo -ne "${reset}"
if [[ "$response" == "n" ]]; then
exit 1
fi

if [[ "$response" != "y" ]] || [["$response" != "n" ]]; then
echo -e "\nInvalid option. \nNext time, Choose from the given option given."
exit 1
fi

#       ===================================================================================================
#                                               Number 1 Quiz
#       ===================================================================================================

echo -e "\nQuestion 1: \n"
echo "${question[0]}"
	echo "a) pwd"
	echo "b) ls"
	echo "c) cd"
echo -ne "Answer: ${blue}"
read -t 10 -n 1 -r choice
echo -ne "${reset}"

#	Answer Algorithm for Question 1.
	if [[ "$choice" == "a" ]]; then
		let score_1="$score + 1"
	else
		echo -ne "${red}\tSorry that's Incorrect!"
		echo -ne "${reset}"
		let score_1="$score"
	fi

#	===================================================================================================
#						Number 2 Quiz
#	===================================================================================================

echo -e "\n\nQuestion 2: \n"
echo "${question[1]}"
	echo "a) cd"
	echo "b) ls"
	echo "c) pwd"
echo -ne "Answer: ${blue}"
read -t 10 -n 1 -r choice
echo -ne "${reset}"

#	Number 2 Answer Algorithm
        if [[ "$choice" == "b" ]]; then
                let score_2="$score + 1"
        else
		echo -ne "${red}\tSorry that's Incorrect!"
                echo -ne "${reset}"
                let score_2="$score"
        fi

#       ===================================================================================================
#                                               Number 3 Quiz
#       ===================================================================================================

echo -e "\n\nQuestion 3: \n"
echo "${question[2]}"
	echo "a) cd"
	echo "b) rm -r"
	echo "c) pwd"
echo -ne "Answer: ${blue}"
read -t 10 -n 1 -r choice
echo -ne "${reset}"

#	Number 3 Answer Algorithm
        if [[ "$choice" == "b" ]]; then
                let score_3="$score + 1"
        else
		echo -ne "${red}\tSorry that's Incorrect!"
                echo -ne "${reset}"
                let score_3="$score"
        fi

#       ===================================================================================================
#                                               Results algorithm.
#       ===================================================================================================

	results=$(( "$score_1" + "$score_2" + "$score_3"))
	echo -ne "${green}\n\n Here's your Final Score on the quiz. You scored ${red}${results}/3"
	echo -ne "${reset}"

if [[ "$results" -eq "3" ]]; then
	echo -e "\nCongratulations, You have a high score. Keep it up"
fi
if [[ "$results" -lt "3" ]]; then
	echo -e "\nPlease Try harder Next time!"
elif [[ "$results" -eq "0" ]]; then
	echo -e "\nDon't worry you can try again."
fi

#	===================================================================================================
#						Correction on Quiz
#	===================================================================================================

	echo -ne "${green}\n\n Do you want a correction on the recent quiz?[y/n] ${blue}"
	read -n 1 -r correction
	echo -ne "${reset}"
#
	if [[ "$correction" == "y" ]]; then
clear
echo -e "Here are the answers to the Quiz questions"
fi
