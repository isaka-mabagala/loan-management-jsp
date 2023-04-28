<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page language="java" import="num.NumberGuessBean" %>
<%
NumberGuessBean guessNumber = new NumberGuessBean();
guessNumber.setAnswer(5);

request.setAttribute("title", "JSP Application");
request.setAttribute("numGuess", guessNumber.getAnswer());
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${title}</title>
  </head>
  <body>
    <h1>Testing JSP Application</h1>
    <h2>Guess for number ${numGuess}</h2>
  </body>
</html>
