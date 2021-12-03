<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="mainPackage.DbView" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User orders</title>
  </head>
  <style>
  td {
    padding-top: 5px;
    padding-bottom: 5px;
    padding-left: 5px;
    padding-right: 5px;
  }
  </style>
  <body>
    <div>
      <form action="http://localhost:8080/EgovWeb/userOrders.jsp" method="get">
	      <select id="userSelect" name="user">
	        <%
	          ArrayList<ArrayList<String>> userList = DbView.userList();
	          for(ArrayList<String> userRow : userList) {
	        %>
	        <option value="<%=userRow.get(0) %>"><%=userRow.get(1) %></option>
	        <% } %>
	      </select>
	      <input type="submit" value="submit">
	    </form> 
    </div>
    <% if (request.getParameter("user") != null && !request.getParameter("user").equals("")) { %>
    <table>
      <tr>
        <th>Order</th>
        <th>Name</th>
        <th>Item</th>
        <th>Date</th>
      </tr>
      <% 
      ArrayList<ArrayList<String>> orderContent = DbView.userOrderList(request.getParameter("user"));
      for(ArrayList<String> orderRow : orderContent) {
      %>
      <tr>
        <td><%=orderRow.get(3) %></td>
        <td><%=orderRow.get(0) %></td>
        <td><%=orderRow.get(1) %></td>
        <td><%=orderRow.get(2) %></td>
      </tr>
      <% } %>
    </table>
    <% } %>
  </body>
</html>