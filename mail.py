import re

def is_valid_email(email):
    # Regular expression for validating email addresses
    email_regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    return re.match(email_regex, email)

def process_users(file_path):
    try:
        with open(file_path, 'r') as file:
            for line in file:
                # Splitting the line by whitespace assuming each property is separated by whitespace
                user_data = line.strip().split()
                if len(user_data) < 2:
                    print("Warning: Invalid parameters for user:", line.strip())
                    continue
                
                user_id = user_data[-1]
                email = user_data[-2]
                
                # Check if user_id is an integer
                try:
                    user_id = int(user_id)
                except ValueError:
                    print("Warning: Invalid user ID for user:", line.strip())
                    continue
                
                # Check if user_id is odd or even
                user_id_type = "even" if user_id % 2 == 0 else "odd"
                
                # Check if email is valid and has a routable FQDN
                if is_valid_email(email):
                    print(f"The ID of {email} is {user_id_type} number.")
                else:
                    print("Warning: Invalid email address for user:", line.strip())
    except FileNotFoundError:
        print("Error: File not found at", file_path)

# Example usage
process_users("user_data.txt")
