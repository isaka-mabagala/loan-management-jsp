package loan;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

import db.DBConnection;

public class LoanDAO {

  public static String errorMessage = null;

  public static Boolean addLoan(LoanBean loan) {
    String query = "INSERT INTO loan (principal, period, type, customerId, issued, due) VALUES (?,?,?,?,?,?)";

    Date issueDate = new Date(System.currentTimeMillis());
    Date dueDate = null;

    if (loan.getType().contains("week")) {
      dueDate = addWeeks(issueDate, loan.getPeriod());
    } else {
      dueDate = addMonths(issueDate, loan.getPeriod());
    }

    try {
      Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query);
      ps.setDouble(1, loan.getPrincipal());
      ps.setInt(2, loan.getPeriod());
      ps.setString(3, loan.getType());
      ps.setInt(4, loan.getCustomerId());
      ps.setDate(5, issueDate);
      ps.setDate(6, dueDate);
      Integer rs = ps.executeUpdate();
      con.close();

      return rs.equals(1);

    } catch (Exception e) {
      errorMessage = e.getMessage();
      return false;
    }
  }

  public static ArrayList<LoanBean> loans() {
    ArrayList<LoanBean> loans = new ArrayList<LoanBean>();
    String query = """
        SELECT l.*, c.firstName, c.lastName,
        CASE
          WHEN l.principal = l.payment THEN 'Complete'
          ELSE 'Incomplete'
        END AS status
        FROM loan l, customer c
        WHERE l.customerId = c.id
        ORDER BY l.id DESC""";

    try {
      Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        LoanBean loan = new LoanBean();
        loan.setId(rs.getInt("id"));
        loan.setPrincipal(rs.getDouble("principal"));
        loan.setPeriod(rs.getInt("period"));
        loan.setIssued(rs.getDate("issued"));
        loan.setDue(rs.getDate("due"));
        loan.setStatus(rs.getString("status"));
        loan.setOutstanding(rs.getDouble("principal") - rs.getDouble("payment"));
        loan.setCustomer(rs.getString("firstName") + " " + rs.getString("lastName"));

        loans.add(loan);
      }
      con.close();

      return loans;

    } catch (Exception e) {
      errorMessage = e.getMessage();
      return loans;
    }
  }

  private static Date addWeeks(Date date, Integer weeks) {
    Calendar c = Calendar.getInstance();
    c.setTime(date);
    c.add(Calendar.DAY_OF_WEEK_IN_MONTH, weeks);

    return new Date(c.getTimeInMillis());
  }

  private static Date addMonths(Date date, Integer months) {
    Calendar c = Calendar.getInstance();
    c.setTime(date);
    c.add(Calendar.MONTH, months);

    return new Date(c.getTimeInMillis());
  }

}
