package loan;

import java.sql.Date;

public class LoanBean {
  private Integer id;
  private Double principal;
  private Integer period;
  private Double payment;
  private Double outstanding;
  private String status;
  private String type;
  private Integer customerId;
  private String customer;
  private Date issued;
  private Date due;

  public Integer getId() {
    return id;
  }

  public void setId(Integer value) {
    id = value;
  }

  public Double getPrincipal() {
    return principal;
  }

  public void setPrincipal(Double value) {
    principal = value;
  }

  public Integer getPeriod() {
    return period;
  }

  public void setPeriod(Integer value) {
    period = value;
  }

  public Double getPayment() {
    return payment;
  }

  public void setPayment(Double value) {
    payment = value;
  }

  public Double getOutstanding() {
    return outstanding;
  }

  public void setOutstanding(Double value) {
    outstanding = value;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String value) {
    status = value;
  }

  public String getType() {
    return type;
  }

  public void setType(String value) {
    type = value;
  }

  public Integer getCustomerId() {
    return customerId;
  }

  public void setCustomerId(Integer value) {
    customerId = value;
  }

  public String getCustomer() {
    return customer;
  }

  public void setCustomer(String value) {
    customer = value;
  }

  public Date getIssued() {
    return issued;
  }

  public void setIssued(Date value) {
    issued = value;
  }

  public Date getDue() {
    return due;
  }

  public void setDue(Date value) {
    due = value;
  }
}
