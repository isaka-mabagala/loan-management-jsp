<%
request.setAttribute("baseUrl", "http://127.0.0.1:8080/loan-management-group5");
String username = (String) session.getAttribute("username");
String requestPage = request.getParameter("page");

if (username != null && (requestPage.equals("login") || requestPage.equals("home"))) {
  out.println("<script>window.location.href='dashboard.jsp';</script>");
  return;
} else if (username == null && (!requestPage.equals("login") && !requestPage.equals("home"))) {
  out.println("<script>window.location.href='login.jsp';</script>");
  return;
}
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${title}</title>
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
  </head>
  <body>
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand mb-0 h1" href="${baseUrl}">LM Group5</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarTop"
          aria-controls="navbarTop"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTop">
          <div class="navbar-nav ms-auto">
            <% if (username != null) { %>
              <a class="nav-link" href="${baseUrl}/dashboard.jsp">Dashboard</a>
              <a class="nav-link" href="${baseUrl}/loan.jsp">Loan</a>
              <a class="nav-link" href="${baseUrl}/customer.jsp">Customer</a>
              <a class="nav-link" href="${baseUrl}/report.jsp">Report</a>
              <a class="nav-link" href="${baseUrl}/logout.jsp">Logout</a>
            <% } %>
            <% if (username == null) { %>
              <a class="nav-link" href="${baseUrl}">Home</a>
              <a class="nav-link" href="${baseUrl}/login.jsp">Log In</a>
            <% } %>
          </div>
        </div>
      </div>
    </nav>
    <div class="container main-container pb-5">
