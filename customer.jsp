<%@ page session="true" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" %>
<%
request.setAttribute("title", "Customer");
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
      <tr>
        <th>1</th>
        <td>Isaka Mabagala</td>
        <td>1000</td>
        <td>+255752988988</td>
        <td>Morogoro</td>
        <td>
          <button
            type="button"
            class="btn btn-primary btn-sm px-3"
            data-bs-toggle="modal"
            data-bs-target="#updateCustomer"
          >
            View
          </button>
        </td>
      </tr>
      <tr>
        <th>2</th>
        <td>Vicent Msomi</td>
        <td>1001</td>
        <td>+255655193352</td>
        <td>Mwanza</td>
        <td>
          <button
            type="button"
            class="btn btn-primary btn-sm px-3"
            data-bs-toggle="modal"
            data-bs-target="#updateCustomer"
          >
            View
          </button>
        </td>
      </tr>
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
    <form class="modal-content" method="post">
      <div class="modal-header">
        <h5 class="modal-title text-secondary" id="addCustomerLabel">Add Customer</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input
          type="text"
          class="form-control mb-3"
          placeholder="first name"
          name="fName"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="last name"
          name="lName"
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
          name="fName"
          required="true"
        >
        <input
          type="text"
          class="form-control mb-3"
          placeholder="last name"
          name="lName"
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
