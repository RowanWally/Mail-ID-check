# scriptingtask
This script reads a file containing a list of users and their information, validates their email addresses and IDs, and checks whether their IDs are even or odd.
Usage

    Clone the repository or copy the script into a file.
    Open the terminal and navigate to the directory containing the script.
    Run the following command:
        ./mail.sh
    
Input

      The script expects a file named source.txt located in the directory /home/cloud/Bash-task/. The file should contain a list of users in the following format:
        Username email_address ID
        
      where:

        Username is the user's name.
        email_address is the user's email address.
        ID is the user's identification number.
Output

  The script outputs a message for each user whose email address and ID are valid and whose email domain is routable. The message contains the user's ID and email address and whether the ID is even or odd.

  If the user has no valid email address OR user ID, the script silently continues to the next user.
  
  Example:

    Input file (source.txt):
      John john@domain.com 325
      Susan 510
      Jane jane@domain.com 131
      Karl karl@domain.com
      Bert bert@localhost 150
      
    Output:
      The 325 of john@domain.com is Odd number
      The 131 of jane@domain.com is Odd number
