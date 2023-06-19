<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%@ page import="customer.CustomerDAO" %>
<%@ page import="customer.CustomerBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="customerBean" class="customer.CustomerBean"/>
<jsp:setProperty name="customerBean" property="*"/>

<%
String customerId = request.getParameter("customer");
ArrayList<CustomerBean> customers = CustomerDAO.customers();
request.setAttribute("title", "Customer");
request.setAttribute("customers", customers);

// register form submited
if (customerBean.getFirstName() != null) {
  CustomerDAO.customerRegister(customerBean);

  response.sendRedirect("customer.jsp");
  //out.print(CustomerDAO.errorMessage);
  return;
}

// get customer by ID
if (customerId != null) {
  CustomerBean customer = CustomerDAO.customerById(customerId);
  out.print(new Gson().toJson(customer));
  return;
}
%>

<jsp:include page="header.jsp">
  <jsp:param name="page" value="customer"/>
</jsp:include>

<div class="page-header mt-5">
  <div class="d-flex justify-content-between align-items-center">
    <h3 class="text-secondary">Customer</h3>
    <button
      type="button"
      class="btn btn-primary btn-sm px-4"
      data-bs-toggle="modal"
      data-bs-target="#addCustomer"
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
        <th scope="col">Full Name</th>
        <th scope="col">ID</th>
        <th scope="col">Contact</th>
        <th scope="col">Region</th>
        <th scope="col">Region</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${ customers }" var="customer" varStatus="loop">
        <tr>
          <th>${ loop.index + 1 }</th>
          <td>${ customer.firstName } ${ customer.lastName }</td>
          <td>${ customer.id }</td>
          <td>${ customer.phoneNo }</td>
          <td>${ customer.region }</td>
          <td>
            <button
              type="button"
              class="btn-view-customer btn btn-primary btn-sm px-3"
              data-bs-toggle="modal"
              data-bs-target="#updateCustomer"
              data-id="${ customer.id }"
            >
              View
            </button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>

<!-- Add Customer Modal -->
<div
  class="modal fade"
  id="addCustomer"
  data-bs-backdrop="static"
  data-bs-keyboard="false"
  tabindex="-1"
  aria-labelledby="addCustomerLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <form class="modal-content" action="customer.jsp" method="post">
      <div class="modal-header">
        <h5 class="modal-title text-secondary" id="addCustomerLabel">Add Customer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input
          type="text"
          class="form-control mb-3"
          placeholder="first name"
          name="firstName"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="last name"
          name="lastName"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="phone number"
          name="phoneNo"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="region"
          name="region"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="street"
          name="street"
          required="true"
        >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">Submit</button>
      </div>
    </form>
  </div>
</div>

<!-- Update Customer Modal -->
<div
  class="modal fade"
  id="updateCustomer"
  data-bs-backdrop="static"
  data-bs-keyboard="false"
  tabindex="-1"
  aria-labelledby="updateCustomerLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <form class="modal-content" method="post">
      <div class="modal-header">
        <h5 class="modal-title text-secondary" id="updateCustomerLabel">Update Customer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input
          type="text"
          class="form-control mb-3"
          placeholder="first name"
          name="firstName"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="last name"
          name="lastName"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="phone number"
          name="phoneNo"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="region"
          name="region"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="street"
          name="street"
          required="true"
        >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-success">Update</button>
      </div>
    </form>
  </div>
</div>

<jsp:include page="footer.jsp"/>
