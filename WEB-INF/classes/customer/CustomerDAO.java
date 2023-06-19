package customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConnection;

public class CustomerDAO {

  public static String errorMessage = null;

  public static Boolean customerRegister(CustomerBean customer) {
    String query = "INSERT INTO customer (firstName, lastName, phoneNo, region, street) VALUES (?,?,?,?,?)";

    try {
      Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, customer.getFirstName());
      ps.setString(2, customer.getLastName());
      ps.setString(3, customer.getPhoneNo());
      ps.setString(4, customer.getRegion());
      ps.setString(5, customer.getStreet());
      Integer rs = ps.executeUpdate();

      return rs.equals(1);

    } catch (Exception e) {
      errorMessage = e.getMessage();
      return false;
    }
  }

  public static ArrayList<CustomerBean> customers() {
    ArrayList<CustomerBean> customers = new ArrayList<CustomerBean>();
    String query = "SELECT * FROM customer ORDER BY id DESC";

    try {
      Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        CustomerBean customer = new CustomerBean();
        customer.setId(rs.getInt(1));
        customer.setFirstName(rs.getString(2));
        customer.setLastName(rs.getString(3));
        customer.setPhoneNo(rs.getString(4));
        customer.setRegion(rs.getString(5));
        customer.setStreet(rs.getString(6));

        customers.add(customer);
      }

      return customers;

    } catch (Exception e) {
      errorMessage = e.getMessage();
      return customers;
    }
  }

  public static CustomerBean customerById(String id) {
    CustomerBean customer = new CustomerBean();
    String query = "SELECT * FROM customer WHERE id=?";

    try {
      Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, id);
      ResultSet rs = ps.executeQuery();

      if (rs.next()) {
        customer.setId(rs.getInt(1));
        customer.setFirstName(rs.getString(2));
        customer.setLastName(rs.getString(3));
        customer.setPhoneNo(rs.getString(4));
        customer.setRegion(rs.getString(5));
        customer.setStreet(rs.getString(6));
      }

      return customer;

    } catch (Exception e) {
      errorMessage = e.getMessage();
      return customer;
    }
  }

}
