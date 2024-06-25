import sqlite3

# Connect to SQLite database
conn = sqlite3.connect('educonnect_demo.db')
cursor = conn.cursor()

# Execute the SQL script to create tables and insert data
with open('setup.sql', 'r') as sql_file:
    sql_script = sql_file.read()

cursor.executescript(sql_script)

# Commit changes and close connection
conn.commit()
conn.close()

print("Database initialized successfully!")
