package database;


import java.sql.*;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBCUtil {
	 private static final Logger LOGGER = Logger.getLogger(JDBCUtil.class.getName());

	    public static Connection makeConnection() {
	        Connection conn = null;
	        try {
	            String dbURL = "jdbc:sqlserver://DESKTOP-B0D0J2Q:1433;databaseName=webstore;encrypt=true;trustServerCertificate=true;";
	        	//String dbURL = "jdbc:sqlserver://localhost:1433;databaseName=Bookstore;encrypt=true;trustServerCertificate=true;";
	        	String user = "sa";
	            String pass = "sa12345";
	            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	            conn = DriverManager.getConnection(dbURL, user, pass);
	            LOGGER.info("Connect to DB successfully");
	        } catch (SQLException | ClassNotFoundException ex) {
	            LOGGER.log(Level.SEVERE, "Failed to connect to database", ex);
	        }
	        return conn;
	    }

	    public static void closeConnection(Connection conn) {
	        if (conn != null) {
	            try {
	                conn.close();
	            } catch (SQLException ex) {
	                LOGGER.log(Level.SEVERE, "Failed to close connection", ex);
	            }
	        }
	    }

	    public static void main(String[] args) {
	        LOGGER.info("This is to test if we can connect to SQLServer");
	        Connection conn = makeConnection();
	        if (conn != null) {
	            try {
	                DatabaseMetaData dm = conn.getMetaData();
	                LOGGER.info("Driver name: " + dm.getDriverName());
	                LOGGER.info("Driver version: " + dm.getDriverVersion());
	            } catch (SQLException ex) {
	                LOGGER.log(Level.SEVERE, "Failed to get database metadata", ex);
	            } finally {
	                closeConnection(conn);
	            }
	        } else {
	            LOGGER.severe("Failed to make connection!");
	        }
	    }
}
