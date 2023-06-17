<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%
request.setAttribute("title", "Dashboard");
%>
<jsp:include page="header.jsp">
  <jsp:param name="page" value="dashboard"/>
</jsp:include>

<div class="page-header mt-5">
  <div class="d-flex justify-content-between align-items-center">
    <h3 class="text-secondary">Dashboard</h3>
  </div>
</div>

<div class="col-md-12 mt-4 d-md-flex justify-content-center">
  <div class="col-md-4 mx-3 mt-4">
    <div class="card text-center border-0">
      <div class="card-header bg-primary text-white">
        <span class="h6">TOTAL CUSTOMERS</span>
      </div>
      <div class="card-body">
        <h2 class="text-primary">5</h2>
      </div>
    </div>
  </div>
  <div class="col-md-4 mx-3 mt-4">
    <div class="card text-center border-0">
      <div class="card-header bg-primary text-white">
        <span class="h6">TOTAL BORROWERS</span>
      </div>
      <div class="card-body">
        <h2 class="text-primary">15</h2>
      </div>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>
