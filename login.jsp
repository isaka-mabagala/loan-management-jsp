<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="user.LoginDAO" %>
<jsp:useBean id="loginBean" class="user.LoginBean"/>
<jsp:setProperty name="loginBean" property="*"/>

<%
request.setAttribute("title", "Sign In");

// login form submited
if (loginBean.getUsername() != null) {
  String result = LoginDAO.loginCheck(loginBean);

  if (result.equals("true")) {
    session.setAttribute("username", loginBean.getUsername());
    response.sendRedirect("dashboard.jsp");
    return;
  } else if (result.equals("false")) {
    session.setAttribute("loginError", "loginError");
    response.sendRedirect("login.jsp");
    return;
  }
}

%>

<jsp:include page="header.jsp">
  <jsp:param name="page" value="login"/>
</jsp:include>

<div class="mt-5 col-md-5 m-auto">
  <div class="card border-light py-4 px-3 shadow-sm">
    <div class="card-body">
      <h5 class="card-title text-center text-secondary">
        Sign in with credentials
      </h5>
      <form class="mt-5" action="login.jsp" method="post">
        <%
          String loginError = (String) session.getAttribute("loginError");
          session.removeAttribute("loginError");
          if (loginError != null) {
        %>
          <p class="text-danger text-center">Invalid username or password.</p>
        <% } %>
        <input
          type="text"
          class="form-control mb-3"
          placeholder="Username"
          name="username"
          required="true"
        >
        <input
          type="password"
          class="form-control mb-3"
          placeholder="Password"
          name="password"
          required="true"
        >
        <div class="text-center mt-4">
          <button type="submit" class="btn btn-primary col-10">Sign In</button>
        </div>
      </form>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
