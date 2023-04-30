package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
  static final String URL = "jdbc:mysql://localhost:3306/";
  static final String DATABASE_NAME = "lms_group5";
  static final String CHARACTER_ENCODING = "?characterEncoding=latin1";
  static final String USERNAME = "root";
  static final String PASSWORD = "root@123";

  public static Connection getConnection() throws SQLException {
    Connection con = null;
    try {
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection(URL + DATABASE_NAME + CHARACTER_ENCODING, USERNAME, PASSWORD);
    } catch (Exception e) {
      throw new SQLException(e.getMessage(), e.getCause());
    }
    return con;
  }
}
