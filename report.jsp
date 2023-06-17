<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%
request.setAttribute("title", "Report");
%>
<jsp:include page="header.jsp">
  <jsp:param name="page" value="report"/>
</jsp:include>

<div class="page-header mt-5">
  <div class="d-flex justify-content-between align-items-center">
    <h3 class="text-secondary">Report</h3>
  </div>
</div>

<div class="col-md-12 mt-4">
  <form>
    <div class="row">
      <div class="col mx-2">
        <label class="form-label">Category:</label>
        <select required="required" class="form-control">
          <option value="">---select---</option>
          <option value="borrower">Borrowers</option>
          <option value="unpaid-loan">Unpaid Loans</option>
        </select>
      </div>
      <div class="col mx-2">
        <label class="form-label">From:</label>
        <input type="date" required="required" class="form-control">
      </div>
      <div class="col mx-2">
        <label class="form-label">To:</label>
        <input type="date" required="required" class="form-control">
      </div>
      <div class="col mx-2 position-relative">
        <button type="submit" class="btn btn-secondary btn-query">Query</button>
      </div>
    </div>
  </form>

  <div class="card-body bg-white rounded mt-5">
    <h6 class="text-center text-muted py-5">Select a report category and date range to get report</h6>
  </div>
</div>

<jsp:include page="footer.jsp"/>
