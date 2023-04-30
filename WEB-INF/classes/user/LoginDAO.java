package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import passenc.PassBasedEnc;

public class LoginDAO {
  public static String loginCheck(LoginBean loginBean) {
    String query = "SELECT * FROM user WHERE username=?";

    try {
      Connection con = DBConnection.getConnection();
      PreparedStatement ps = con.prepareStatement(query);
      ps.setString(1, loginBean.getUsername());
      ResultSet rs = ps.executeQuery();

      if (rs.next()) {
        String providedPassword = loginBean.getPassword();
        String securedPassword = rs.getString("password");
        boolean passwordVerify = PassBasedEnc.verifyUserPassword(providedPassword, securedPassword);
        return "" + passwordVerify;
      } else {
        return "false";
      }
    } catch (Exception e) {
      return e.getMessage();
    }
  }
}
