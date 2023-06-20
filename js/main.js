$(document).ready(function () {
  const baseUrl = "http://127.0.0.1:8080/loan-management-group5";

  // customer details update
  $(".btn-view-customer").click(function () {
    var id = $(this).data("id");

    axios
      .get(baseUrl + "/customer.jsp?customer=" + id)
      .then(function (response) {
        const customer = response.data;
        $('#customer-update-form input[name="firstName"]').val(
          customer.firstName
        );
        $('#customer-update-form input[name="lastName"]').val(
          customer.lastName
        );
        $('#customer-update-form input[name="phoneNo"]').val(customer.phoneNo);
        $('#customer-update-form input[name="region"]').val(customer.region);
        $('#customer-update-form input[name="street"]').val(customer.street);
        $('#customer-update-form input[name="id"]').val(id);
      });
  });

  // loan make payment
  $(".btn-loan-pay").click(function () {
    var id = $(this).data("id");
    $('input[name="id"]').val(id);
  });
});
