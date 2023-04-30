<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%
request.setAttribute("title", "Home");
%>
<jsp:include page="header.jsp">
  <jsp:param name="page" value="home"/>
</jsp:include>
<div class="main-area text-center">
  <div class="display-table">
    <div class="display-table-cell">
      <h1 class="title font-white"><b>Loan Management (Group #5)</b></h1>
      <p class="desc font-white">
        Loan Management application development assignment with JSP (JAVA).
      </p>

      <a class="notify-btn" href="login.jsp"><b>GET STARTED</b></a>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
