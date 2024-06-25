import sqlite3

def execute_query(query, params=(), fetch=False):
    conn = sqlite3.connect('educonnect_demo.db')
    cursor = conn.cursor()
    print(f"Executing SQL: {query}")
    cursor.execute(query, params)
    conn.commit()
    results = cursor.fetchall() if fetch else None
    conn.close()
    return results

def grouping_and_aggregation():
    query = """
    SELECT UserID, COUNT(ProjectID) AS ProjectCount
    FROM Projects
    GROUP BY UserID;
    """
    results = execute_query(query, fetch=True)
    for row in results:
        print(row)

def sql_dml_and_fks():
    query = """
    INSERT INTO Users (Name, Email, Password, Bio, ProfilePic) 
    VALUES ('John Doe', 'john.doe.unique2@example.com', 'securepassword', 'Tech enthusiast', 'john.jpg');
    """
    execute_query(query)
    print("User John Doe inserted successfully.")

def sub_queries():
    query = """
    SELECT Name, Email
    FROM Users
    WHERE UserID IN (
        SELECT UserID
        FROM Projects
        GROUP BY UserID
        HAVING COUNT(ProjectID) > 2
    );
    """
    results = execute_query(query, fetch=True)
    for row in results:
        print(row)

def using_indexes():
    query = "CREATE INDEX idx_users_email ON Users (Email);"
    execute_query(query)
    print("Index idx_users_email created successfully.")

def basic_security():
    query = """
    SELECT UserID, Name
    FROM Users
    WHERE Email = 'alice@example.com' AND Password = 'password123';
    """
    results = execute_query(query, fetch=True)
    for row in results:
        print(row)

def managing_access():
    # Example only, not applicable in SQLite
    print("Granting and revoking access not demonstrated in SQLite.")

def understanding_views():
    query = """
    CREATE VIEW UserProjectCounts AS
    SELECT Users.UserID, Users.Name, COUNT(Projects.ProjectID) AS ProjectCount
    FROM Users
    LEFT JOIN Projects ON Users.UserID = Projects.UserID
    GROUP BY Users.UserID, Users.Name;
    """
    execute_query(query)
    print("View UserProjectCounts created successfully.")
    query = "SELECT * FROM UserProjectCounts WHERE ProjectCount > 2;"
    results = execute_query(query, fetch=True)
    for row in results:
        print(row)

def acid_transactions():
    conn = sqlite3.connect('educonnect_demo.db')
    cursor = conn.cursor()
    try:
        cursor.execute("BEGIN TRANSACTION;")
        cursor.execute("""
        INSERT INTO Users (Name, Email, Password, Bio, ProfilePic) 
        VALUES ('Jane Doe', 'jane.doe.unique2@example.com', 'anotherpassword', 'Bio for Jane Doe', 'jane.jpg');
        """)
        cursor.execute("""
        INSERT INTO Projects (UserID, Title, Description, Category, Tags) 
        VALUES ((SELECT UserID FROM Users WHERE Email = 'jane.doe.unique2@example.com'), 'Jane\'s Project', 'Description of Jane\'s Project', 'Science', 'Research, Innovation');
        """)
        cursor.execute("COMMIT;")
        print("Transaction committed successfully.")
    except Exception as e:
        cursor.execute("ROLLBACK;")
        print("Transaction rolled back due to error:", e)
    finally:
        conn.close()

if __name__ == "__main__":
    print("Grouping & Aggregation")
    grouping_and_aggregation()
    print("\nSQL DML & FKs")
    sql_dml_and_fks()
    print("\nSub-queries")
    sub_queries()
    print("\nUsing Indexes")
    using_indexes()
    print("\nBasic Security")
    basic_security()
    print("\nManaging Access")
    managing_access()
    print("\nUnderstanding Views")
    understanding_views()
    print("\nACID Transactions")
    acid_transactions()
