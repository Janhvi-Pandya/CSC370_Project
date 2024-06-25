import sqlite3

def create_user(name, email, password, bio, profile_pic):
    conn = sqlite3.connect('educonnect_demo.db')
    cursor = conn.cursor()
    cursor.execute('''
        INSERT INTO Users (Name, Email, Password, Bio, ProfilePic)
        VALUES (?, ?, ?, ?, ?)
    ''', (name, email, password, bio, profile_pic))
    conn.commit()
    conn.close()

def get_user(user_id):
    conn = sqlite3.connect('educonnect_demo.db')
    cursor = conn.cursor()
    cursor.execute('''
        SELECT * FROM Users WHERE UserID = ?
    ''', (user_id,))
    user = cursor.fetchone()
    conn.close()
    return user

def update_user(user_id, name, email, password, bio, profile_pic):
    conn = sqlite3.connect('educonnect_demo.db')
    cursor = conn.cursor()
    cursor.execute('''
        UPDATE Users SET Name = ?, Email = ?, Password = ?, Bio = ?, ProfilePic = ?
        WHERE UserID = ?
    ''', (name, email, password, bio, profile_pic, user_id))
    conn.commit()
    conn.close()

def delete_user(user_id):
    conn = sqlite3.connect('educonnect_demo.db')
    cursor = conn.cursor()
    cursor.execute('''
        DELETE FROM Users WHERE UserID = ?
    ''', (user_id,))
    conn.commit()
    conn.close()

def main():
    while True:
        print("EduConnect Database Management")
        print("1. Create User")
        print("2. Get User")
        print("3. Update User")
        print("4. Delete User")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            name = input("Enter name: ")
            email = input("Enter email: ")
            password = input("Enter password: ")
            bio = input("Enter bio: ")
            profile_pic = input("Enter profile picture URL: ")
            create_user(name, email, password, bio, profile_pic)
            print("User created successfully!")
        elif choice == '2':
            user_id = input("Enter user ID: ")
            user = get_user(user_id)
            print("User details:", user)
        elif choice == '3':
            user_id = input("Enter user ID: ")
            name = input("Enter new name: ")
            email = input("Enter new email: ")
            password = input("Enter new password: ")
            bio = input("Enter new bio: ")
            profile_pic = input("Enter new profile picture URL: ")
            update_user(user_id, name, email, password, bio, profile_pic)
            print("User updated successfully!")
        elif choice == '4':
            user_id = input("Enter user ID: ")
            delete_user(user_id)
            print("User deleted successfully!")
        elif choice == '5':
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
