<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%
request.setAttribute("title", "Home");
%>
<jsp:include page="header.jsp">
  <jsp:param name="page" value="home"/>
</jsp:include>
<h1 class="mt-5 text-center">Home Page</h1>
<jsp:include page="footer.jsp"/>
