# Campus Entrance-Exit Monitoring System

---

## Database
- **Database:** PostgreSQL
- **File:** `campus_entrance-exit_monitoring_db.sql`
- **Tables:** `students`, `attendance_logs`

---

## Backend Developer Guide — Integrating the SQL File

### Step 1 — Copy the SQL code from GitHub
- Go to the repository: `https://github.com/revs-fm/OOP-Final-Project`
- Click on `campus_entrance-exit_monitoring_db.sql`
- Press `Ctrl + A` to select all the code
- Press `Ctrl + C` to copy it

---

### Step 2 — Install PostgreSQL
Download and install PostgreSQL from https://www.postgresql.org/download/ if not already installed.

---

### Step 3 — Add PostgreSQL to your system PATH
- Press `Windows key + S` and search **Environment Variables**
- Click **Edit the system environment variables**
- Click **Environment Variables** at the bottom
- Under **System variables** find **Path** and double click it
- Click **New** and paste: `C:\Program Files\PostgreSQL\17\bin`
> Replace `17` with your PostgreSQL version number if different

- Click **OK** on all windows
- **Restart VS Code after this**

---

### Step 4 — Install SQLTools extension in VS Code
- Press `Ctrl + Shift + X`
- Search `SQLTools` and install it
- Search `SQLTools PostgreSQL` and install the driver too

---

### Step 5 — Add a new connection in SQLTools
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

### Step 6 — Create the database
- Click the SQLTools icon on the left sidebar
- Click the **New SQL File** button (top of the sidebar)
- Type:

```sql
CREATE DATABASE campus_entance_exit_monitoring_db;
```

- Press `Ctrl + Enter` to run it

---

### Step 7 — Edit the connection to point to the new database
- Right click `OOP Final Project` in the SQLTools sidebar
- Click **Edit Connection**
- Change the **Database** field to: `campus_entrance_exit_monitoring_db`
- Click **Save Connection**

---

### Step 8 — Paste and run the SQL code
- Click the **New SQL File** button again in the SQLTools sidebar
- Press `Ctrl + V` to paste the copied code from GitHub
- Press `Ctrl + A` to select all
- Press `Ctrl + Enter` to run it

---

### Step 9 — Verify the tables and data
- Clear the file and type:

```sql
SELECT * FROM students;
```

- Press `Ctrl + Enter` to run it

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
    private static final String URL      = "jdbc:postgresql://localhost:5432/campus_entance_exit_monitoring_db";
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
