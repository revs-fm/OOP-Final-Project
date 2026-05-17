# Campus Entrance-Exit Monitoring System
---

## Database
- **Database:** PostgreSQL (Should be installed and set up)
- **File:** `campus_entance-exit_monitoring_db.sql`
- **Tables:** `students`, `attendance_logs`

---

## Backend Developer Guide — Integrating the SQL File

### Step 1 — Download the SQL file from GitHub
- Click on `campus_entance-exit_monitoring_db.sql`
- Click the **Download raw file** button (top right)
- Save it anywhere on your computer

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

### Step 3 — Create the database
- Open VS Code
- Open the Terminal (`Ctrl + ~`)
- Type:

```bash
psql -U postgres -c "CREATE DATABASE campus_entance_exit_monitoring_db;"
```

- Enter your PostgreSQL password when prompted

---

### Step 4 — Verify the database was created

```bash
psql -U postgres -l
```

You should see `campus_entance_exit_monitoring_db` in the list. Press `q` to exit.

---

### Step 5 — Run the SQL file

```bash
psql -U postgres -d campus_entance_exit_monitoring_db -f "C:\Users\YourName\Downloads\campus_entance-exit_monitoring_db.sql"
```

> Replace the path with the actual location of your downloaded SQL file on your computer.

---

### Step 6 — Verify the tables and data

```bash
psql -U postgres -d campus_entance_exit_monitoring_db
```

Then run:

```sql
SELECT * FROM students;
```

You should see all 15 students. Type `\q` to exit.

---

### Step 7 — Install SQLTools extension in VS Code
- Press `Ctrl + Shift + X`
- Search `SQLTools` and install it
- Search `SQLTools PostgreSQL` and install the driver too

---

### Step 8 — Add a new connection in SQLTools
- Click the SQLTools icon on the left sidebar
- Click **Add New Connection** and select **PostgreSQL**
- Fill in the fields:
  - **Connection name:** `OOP Final Project`
  - **Server Address:** `localhost`
  - **Port:** `5432`
  - **Database:** `campus_entance_exit_monitoring_db`
  - **Username:** `postgres`
  - **Use password:** select `Save as plaintext in settings` and enter your PostgreSQL password
- Click **Save Connection**

---

### Step 9 — Add the PostgreSQL JDBC Driver to the Java project

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

### Step 10 — Create `DatabaseConnection.java`

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

### Step 11 — Test the connection

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

> **Note:** Every group member who runs the program needs to do Steps 1–6 on their own machine. The database runs locally on each computer.
