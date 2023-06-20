<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="loan.LoanDAO" %>
<%@ page import="loan.LoanBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="loanBean" class="loan.LoanBean"/>
<jsp:setProperty name="loanBean" property="*"/>

<%
request.setAttribute("title", "Loan");
%>

<jsp:include page="header.jsp">
  <jsp:param name="page" value="loan"/>
</jsp:include>

<%
NumberFormat nf = NumberFormat.getInstance(new Locale("en", "US"));
ArrayList<LoanBean> loans = LoanDAO.loans();
request.setAttribute("loans", loans);
request.setAttribute("nf", nf);

// add loan form submited
if (loanBean.getCustomerId() != null) {
  LoanDAO.addLoan(loanBean);

  response.sendRedirect("loan.jsp");
  //out.print(LoanDAO.errorMessage);
  return;
}
%>

<div class="page-header mt-5">
  <div class="d-flex justify-content-between align-items-center">
    <h3 class="text-secondary">Loan</h3>
    <button
      type="button"
      class="btn btn-primary btn-sm px-4"
      data-bs-toggle="modal"
      data-bs-target="#addLoan"
    >
      Add
    </button>
  </div>
</div>

<div class="col-md-12 mt-4">
  <table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Customer</th>
        <th scope="col">Principal</th>
        <th scope="col">Outstanding</th>
        <th scope="col">Status</th>
        <th scope="col">Issued</th>
        <th scope="col">Due</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${ loans }" var="loan" varStatus="loop">
        <tr>
          <th>${ loop.index + 1 }</th>
          <td>${ loan.customer }</td>
          <td>${ nf.format(loan.principal) }</td>
          <td>${ nf.format(loan.outstanding) }</td>
          <td>${ loan.status }</td>
          <td>${ loan.issued }</td>
          <td>${ loan.due }</td>
          <td>
            <button
              type="button"
              class="btn btn-primary btn-sm px-3"
              data-bs-toggle="modal"
              data-bs-target="#payLoan"
              data-id="${ loan.id }"
            >
              Pay
            </button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<!-- Add Loan Modal -->
<div
  class="modal fade"
  id="addLoan"
  data-bs-backdrop="static"
  data-bs-keyboard="false"
  tabindex="-1"
  aria-labelledby="addLoanLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <form class="modal-content" action="loan.jsp" method="post">
      <div class="modal-header">
        <h5 class="modal-title text-secondary" id="addLoanLabel">Add Loan</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input
          type="number"
          class="form-control mb-3"
          placeholder="customer ID"
          name="customerId"
          required="true"
        >
        <input
          type="number"
          class="form-control mb-3"
          placeholder="principal"
          name="principal"
          required="true"
        >
        <input
          type="number"
          class="form-control mb-3"
          placeholder="period"
          name="period"
          required="true"
        >
        <select name="type" required="required" class="form-control">
          <option value="week">Week</option>
          <option value="month">Month</option>
        </select>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
    </form>
  </div>
</div>

<!-- Pay Loan Modal -->
<div
  class="modal fade"
  id="payLoan"
  data-bs-backdrop="static"
  data-bs-keyboard="false"
  tabindex="-1"
  aria-labelledby="payLoanLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <form class="modal-content" method="post">
      <div class="modal-header">
        <h5 class="modal-title text-secondary" id="payLoanLabel">Payment</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="customerId" value="100">
        <input
          type="number"
          class="form-control mb-3"
          placeholder="amount"
          name="amount"
          required="true"
        >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">Pay</button>
      </div>
    </form>
  </div>
</div>

<jsp:include page="footer.jsp"/>
