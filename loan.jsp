<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%
request.setAttribute("title", "Loan");
%>
<jsp:include page="header.jsp">
  <jsp:param name="page" value="loan"/>
</jsp:include>
<h1 class="mt-5 text-center">Loan</h1>
<jsp:include page="footer.jsp"/>
