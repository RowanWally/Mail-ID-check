#!/bin/bash
#point on the file path
sourcefile="/home/cloud/Bash-task/source.txt"
#read the file and store it in a variable called line
while IFS= read -r line; do
	#get the username first column
	Username=$(echo "$line" | awk '{print $1}')
	#get the second column for the Email
	Email=$(echo "$line" | awk '{print $2}')
	#get the last column for the ID
	ID=$(echo "$line" | awk '{print $NF}')
	#get the validate the email address format
	domain=$(echo "$Email" | awk -F "@" '{print $2}')
	#check if the ID is numeric and if the Email has the valid format
	if [[ "$ID" =~ ^[0-9]+$ && "$Email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
		#check if the domain exists and is routable.
		if dig +short "$domain" >/dev/null; then
			#check if the ID is even
			if (($ID % 2 == 0)); then
				echo "The $ID of $Email is Even number"
			#check if the ID is Odd
			elif (($ID % 2 != 0)); then
				echo "The $ID of $Email is Odd number"
			fi
		else
			#If the user has no valid email address OR user ID, the script should silently continue to the next user.
			continue;
		fi
	else
		continue;
	fi		

	done < "$sourcefile"
