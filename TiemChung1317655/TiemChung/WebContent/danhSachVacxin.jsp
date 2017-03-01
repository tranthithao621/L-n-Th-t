<%@page import="java.util.List"%>
<%@page import="Model.Bean.Vacxin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if(request.getAttribute("maVacxin") != null){
	int maVacxin = Integer.parseInt(request.getAttribute("maVacxin").toString());
	if (request.getAttribute("lstvx") != null) {
		List<Vacxin> lstvx = (List<Vacxin>) request.getAttribute("lstvx");
		for (Vacxin e : lstvx) {
	if(maVacxin == e.getMaVacxin()){
		%>
			<option selected value="<%=e.getMaVacxin()%>"><%=e.getTenVacxin()%></option>
		<%
	}else{
		%>
			<option value="<%=e.getMaVacxin()%>"><%=e.getTenVacxin()%></option>
		<%
	}

	}
	}
}else{
	if (request.getAttribute("lstvx") != null) {
		List<Vacxin> lstvx = (List<Vacxin>) request.getAttribute("lstvx");
		for (Vacxin e : lstvx) {
			%>
			<option value="<%=e.getMaVacxin()%>"><%=e.getTenVacxin()%></option>
			<%
		}
}
}
	
	%>
