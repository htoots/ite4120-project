<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="mainPackage.DbView" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert Order</title>
	</head>
	<body>
		 <form action="http://localhost:8080/EgovWeb/handlers/orderResult.jsp" method="get">
		   <table>
		     <tr>
		       <td>Choose user:
		       <td>
		         <select id="userSelect" name="user">
		           <%
		             ArrayList<ArrayList<String>> userList = DbView.userList();
		             for(ArrayList<String> userRow : userList) {
		           %>
		             <option value="<%=userRow.get(0) %>"><%=userRow.get(1) %></option>
		           <% } %>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <td>Choose item id:
		       <td>
		         <select id="itemSelect" name="item">
		           <% 
							   ArrayList<ArrayList<String>> itemList = DbView.dropdownItemList();
							   for(ArrayList<String> itemRow : itemList) {
							 %>
							   <option value="<%=itemRow.get(0) %>"><%=itemRow.get(1) %></option>
							 <% } %>
		         </select>
		       </td>
		     </tr>
		     <tr>
		       <td>Choose date id:
		       <td>
		         <select id="dateSelect" name="date">
		           <%
		             ArrayList<ArrayList<String>> dateList = DbView.dropdownDateList();
		             for(ArrayList<String> dateRow : dateList) {
		           %>
		             <option value="<%=dateRow.get(0) %>"><%=dateRow.get(1) %></option>
		           <% } %>
		         </select>
		       </td>
		     </tr>
		   </table>
		   <br>
		   <input type="submit" value="submit">
		 </form>
	</body>
</html>