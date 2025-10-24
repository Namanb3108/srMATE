# srMATE - College Connection Platform

A Java Swing-based dating and networking application designed for college students. Features a Tinder-style swipe interface for making connections based on shared interests and preferences.

## Features

- User Registration with College Email Authentication
- Tinder-Style Swipe Interface (Like/Reject)
- Interest-based Matching Algorithm
- Real-time Match Notifications
- Profile Management System
- View All Your Matches
- Modern and Clean UI

## Technologies Used

- Java Swing - GUI Framework
- MySQL 8.0 - Database Management
- JDBC - Database Connectivity
- Java AWT - Graphics Components

## Prerequisites

Before running this application, you need:

- Java JDK 8 or higher
- MySQL Server 8.0 or higher
- MySQL Connector/J 8.2.0 (JDBC Driver)

## Installation and Setup

### Step 1: Clone the Repository
```bash
git clone https://github.com/KPandoh/srmate-app.git
cd srmate-app
```

### Step 2: Setup MySQL Database

Open MySQL Workbench and run:

```sql
CREATE DATABASE srmatedb;
USE srmatedb;
```

Tables will be created automatically when you run the application.

### Step 3: Download MySQL JDBC Driver

1. Download from: https://dev.mysql.com/downloads/connector/j/
2. Extract the ZIP file
3. Place `mysql-connector-j-8.2.0.jar` in the project folder

### Step 4: Configure Database Connection

Open `SrMateApp.java` and update the database password (around line 19):

```java
private static final String DB_URL = "jdbc:mysql://localhost:3306/srmatedb";
private static final String DB_USER = "root";
private static final String DB_PASS = "YOUR_PASSWORD_HERE";  // Change this
```

### Step 5: Compile and Run

**Using Command Line (Windows):**
```cmd
javac -cp ".;mysql-connector-j-8.2.0.jar" SrMateApp.java
java -cp ".;mysql-connector-j-8.2.0.jar" SrMateApp
```

**Using Batch File:**
Double-click `runSrMate.bat`

**Using an IDE:**
1. Import the project
2. Add `mysql-connector-j-8.2.0.jar` to project libraries
3. Run `SrMateApp.java`

## Database Structure

The application creates three tables:

**users** - Stores user profiles and authentication
- Personal information (name, age, gender)
- College details (department, year of study)
- Interests, hobbies, and bio
- Looking for preferences

**matches** - Tracks all swipe actions
- Records LIKE and REJECT actions
- Identifies mutual matches

**messages** - For chat functionality
- Sender and receiver information
- Message content and timestamps

## How to Use

1. **Register** - Create an account with your college email
2. **Complete Profile** - Add your interests, hobbies, and bio
3. **Browse Profiles** - Swipe through suggested matches
4. **Like or Pass** - Click ❤️ to like or ✗ to pass
5. **Get Matched** - Receive notifications when someone likes you back
6. **View Matches** - Check all your connections in the Matches screen

## Security Note

⚠️ **Important:** This is a college project. For production use:
- Implement password hashing (BCrypt)
- Use environment variables for database credentials
- Add input validation and sanitization
- Implement HTTPS and secure sessions

## Future Enhancements

- [ ] Real-time chat functionality
- [ ] Password encryption
- [ ] Profile picture upload
- [ ] Email verification system
- [ ] Advanced matching algorithm
- [ ] Mobile application
- [ ] Video chat feature

## Author

Krishna Pandoh

## License

This project is open source and available under the MIT License.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

⭐ If you found this project helpful, please give it a star on GitHub!