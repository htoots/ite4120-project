<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="mainPackage.DbView" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit items</title>
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
      <form action="http://localhost:8080/EgovWeb/handlers/itemResult.jsp" method="get">
        <input type="text" id="itemName" name="itemName"/>
        <input type="submit" value="Save"/>
      </form>
    </div>
    <%
      ArrayList<ArrayList<String>> itemList = DbView.dropdownItemList();
      if(itemList.size() > 0) {
    %>
    <div>
	    <table>
	      <tr>
	        <th>Id</th>
	        <th>Item</th>
	        <th>Delete</th>
	      <tr>
			  <% 
			    for(ArrayList<String> itemRow : itemList) {
			  %>
			    <tr>
			      <td><%=itemRow.get(0) %></td>
			      <td><%=itemRow.get(1) %></td>
			      <td><a href="handlers/itemResult.jsp?itemId=<%=itemRow.get(0) %>"><button type="button" class="delete">Delete</button></a></td>
			    </tr>
			  <% } %>
	    </table>
    </div>
    <% } %>
	</body>
</html>