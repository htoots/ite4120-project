<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="mainPackage.DbCall" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order result</title>
</head>
<body>
<% 
  Integer orderResult = 0;
  if (request.getParameter("user") != null && !request.getParameter("user").equals("")) {
  orderResult = DbCall.dbOrderInsert(
    request.getParameter("user"),
    request.getParameter("item"),
    request.getParameter("date")
  );
  }
  if (request.getParameter("id") != null && !request.getParameter("id").equals("")) {
    orderResult = DbCall.dbOrderDelete(
      request.getParameter("id")
    );
  }
%>
<%= orderResult == 1 ? "Success" : "Problem occurred" %>
<br><a href="../index.html">Back to main menu</a>
</body>
</html>