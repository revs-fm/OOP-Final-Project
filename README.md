# Campus Entrance-Exit Monitoring System

---

## Database
- **Database:** PostgreSQL
- **File:** `campus_entrance-exit_monitoring_db.sql`
- **Tables:** `students`, `attendance_logs`

---

## Backend Developer Guide — Integrating the SQL File

### Step 1 — Install PostgreSQL
Download and install PostgreSQL from https://www.postgresql.org/download/ if not already installed.

---

### Step 2 — Add PostgreSQL to your system PATH
- Press `Windows key + S` and search **Environment Variables**
- Click **Edit the system environment variables**
- Click **Environment Variables** at the bottom
- Under **System variables** find **Path** and double click it
- Click **New** and paste: `C:\Program Files\PostgreSQL\17\bin`
> Replace `17` with your PostgreSQL version number if different

- Click **OK** on all windows
- **Restart VS Code after this**

---

### Step 3 — Install SQLTools extension in VS Code
- Press `Ctrl + Shift + X`
- Search `SQLTools` and install it
- Search `SQLTools PostgreSQL` and install the driver too

---

### Step 4 — Add a new connection in SQLTools
- Click the SQLTools icon on the left sidebar
- Click **Add New Connection** and select **PostgreSQL**
- Fill in the fields:
  - **Connection name:** `OOP Final Project`
  - **Server Address:** `localhost`
  - **Port:** `5432`
  - **Database:** `postgres`
  - **Username:** `postgres`
  - **Use password:** select `Save as plaintext in settings` and enter your PostgreSQL password
- Click **Save Connection**

---

### Step 5 — Create the database
- After saving the connection, a session file called `OOP Final Project.session.sql` will open automatically
- Clear anything in it (`Ctrl + A` then `Delete`)
- Type:

```sql
CREATE DATABASE campus_entrance_exit_monitoring_db;
```

- Right click anywhere in the file and click **Run on active connection**

---

### Step 6 — Edit the connection to point to the new database
- Click the SQLTools icon on the left sidebar
- Right click `OOP Final Project` and click **Edit Connection**
- Change the **Database** field to: `campus_entrance_exit_monitoring_db`
- Click **Save Connection**

---

### Step 7 — Copy the SQL code from GitHub
- Go to the repository: `https://github.com/revs-fm/OOP-Final-Project`
- Click on `campus_entrance-exit_monitoring_db.sql`
- Press `Ctrl + A` to select all the code
- Press `Ctrl + C` to copy it

---

### Step 8 — Paste and run the SQL code
- Go back to VS Code and open the session file `OOP Final Project.session.sql`
- Clear anything in it (`Ctrl + A` then `Delete`)
- Press `Ctrl + V` to paste the copied code
- Right click anywhere in the file and click **Run on active connection**

---

### Step 9 — Verify the tables and data
- Clear the file again (`Ctrl + A` then `Delete`)
- Type:

```sql
SELECT * FROM students;
```

- Right click and click **Run on active connection**

You should see all 15 students loaded in.

---

### Step 10 — Add the PostgreSQL JDBC Driver to the Java project

In `pom.xml` (Maven):

```xml
<dependency>
    <groupId>org.postgresql</groupId>
    <artifactId>postgresql</artifactId>
    <version>42.7.3</version>
</dependency>
```

Or download the `.jar` manually from https://jdbc.postgresql.org/download/ and add it to your project build path.

---

### Step 11 — Create `DatabaseConnection.java`

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL      = "jdbc:postgresql://localhost:5432/campus_entrance_exit_monitoring_db";
    private static final String USER     = "postgres";
    private static final String PASSWORD = "your_password_here";

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
```

Replace `your_password_here` with your PostgreSQL password.

---

### Step 12 — Test the connection

```java
public static void main(String[] args) {
    try (Connection conn = DatabaseConnection.getConnection()) {
        System.out.println("Connected successfully!");
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
```

If it prints `Connected successfully!` you're good to go.

---

> **Note:** Every group member who runs the program needs to do Steps 1–9 on their own machine. The database runs locally on each computer.
