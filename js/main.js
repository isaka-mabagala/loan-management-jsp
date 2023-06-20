$(document).ready(function () {
  const baseUrl = "http://127.0.0.1:8080/loan-management-group5";

  // customer details update
  $(".btn-view-customer").click(function () {
    var id = $(this).data("id");

    $.ajax(baseUrl + "/customer.jsp?customer=" + id).done(function (
      responseText
    ) {
      //alert(responseText);
    });
  });

  // loan make payment
  $(".btn-loan-pay").click(function () {
    var id = $(this).data("id");
    $('input[name="id"]').val(id);
  });
});
