import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLConnectionTest {
    public static void main(String[] args) {
        System.out.println("=== MySQL Connection Diagnostic Test ===\n");
        
        // Test Configuration
        String[] urlVariations = {
            "jdbc:mysql://localhost:3306/srmatedb",
            "jdbc:mysql://localhost:3306/srmatedb?useSSL=false",
            "jdbc:mysql://localhost:3306/srmatedb?useSSL=false&allowPublicKeyRetrieval=true",
            "jdbc:mysql://localhost:3306/srmatedb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            "jdbc:mysql://127.0.0.1:3306/srmatedb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
        };
        
        String username = "root";
        String password = "CodeRoot@07";
        
        // Step 1: Check if JDBC Driver is available
        System.out.println("Step 1: Checking MySQL JDBC Driver...");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✓ MySQL JDBC Driver found!\n");
        } catch (ClassNotFoundException e) {
            System.out.println("✗ MySQL JDBC Driver NOT FOUND!");
            System.out.println("  ERROR: " + e.getMessage());
            System.out.println("  SOLUTION: Add mysql-connector-java JAR to your project classpath\n");
            return;
        }
        
        // Step 2: Try different URL variations
        System.out.println("Step 2: Testing different connection URLs...\n");
        
        boolean connected = false;
        String workingUrl = "";
        
        for (int i = 0; i < urlVariations.length; i++) {
            System.out.println("Test " + (i + 1) + ": " + urlVariations[i]);
            try {
                Connection conn = DriverManager.getConnection(urlVariations[i], username, password);
                if (conn != null && !conn.isClosed()) {
                    System.out.println("  ✓ SUCCESS! Connection established!");
                    System.out.println("  Database: " + conn.getMetaData().getDatabaseProductName());
                    System.out.println("  Version: " + conn.getMetaData().getDatabaseProductVersion());
                    System.out.println("  URL: " + conn.getMetaData().getURL());
                    connected = true;
                    workingUrl = urlVariations[i];
                    
                    // Test if srmatedb exists and has tables
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SHOW TABLES");
                    System.out.println("  Tables in database:");
                    while (rs.next()) {
                        System.out.println("    - " + rs.getString(1));
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                    break;
                }
            } catch (SQLException e) {
                System.out.println("  ✗ FAILED!");
                System.out.println("  Error Code: " + e.getErrorCode());
                System.out.println("  SQL State: " + e.getSQLState());
                System.out.println("  Message: " + e.getMessage());
            }
            System.out.println();
        }
        
        // Step 3: Final Report
        System.out.println("\n=== DIAGNOSTIC REPORT ===");
        if (connected) {
            System.out.println("✓ CONNECTION SUCCESSFUL!");
            System.out.println("\nUse this URL in your SrMateApp.java:");
            System.out.println("private static final String DB_URL = \"" + workingUrl + "\";");
            System.out.println("private static final String DB_USER = \"root\";");
            System.out.println("private static final String DB_PASS = \"CodeRoot@07\";");
        } else {
            System.out.println("✗ ALL CONNECTION ATTEMPTS FAILED!");
            System.out.println("\nPossible Issues:");
            System.out.println("1. MySQL Server is not running");
            System.out.println("   → Check Windows Services for MySQL80");
            System.out.println("2. Database 'srmatedb' does not exist");
            System.out.println("   → Run the SQL setup script in MySQL Workbench");
            System.out.println("3. Wrong password");
            System.out.println("   → Verify password is: CodeRoot@07");
            System.out.println("4. MySQL is running on a different port");
            System.out.println("   → Check MySQL Workbench connection settings");
            System.out.println("5. Firewall blocking connection");
            System.out.println("   → Temporarily disable firewall to test");
        }
    }
}