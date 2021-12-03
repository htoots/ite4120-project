<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="mainPackage.DbView" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Show all Orders</title>
  <style>
		td {
		  padding-top: 5px;
		  padding-bottom: 5px;
		  padding-left: 5px;
		  padding-right: 5px;
		}
  </style>
  <body>
    <table>
      <tr>
        <th>Order</th>
        <th>Name</th>
        <th>Item</th>
        <th>Date</th>
        <th>Delete</th>
      </tr>
      <% 
      ArrayList<ArrayList<String>> orderContent = DbView.orderContentView();
      for(ArrayList<String> orderRow : orderContent) {
      %>
      <tr>
        <td><%=orderRow.get(3) %></td>
        <td><%=orderRow.get(0) %></td>
        <td><%=orderRow.get(1) %></td>
        <td><%=orderRow.get(2) %></td>
        <td><a href="handlers/orderResult.jsp?id=<%=orderRow.get(3) %>"><button type="button" class="delete">Delete</button></a></td>
      </tr>
      <% } %>
    </table>
  </body>
</html>