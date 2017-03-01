<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%
		if (request.getAttribute("lantiem") != null) {
		%>
		 <option><%=request.getAttribute("lantiem")%></option>
		<%
		}
		
		%>
