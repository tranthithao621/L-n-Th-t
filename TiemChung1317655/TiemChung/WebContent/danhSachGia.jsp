<%@page import="Model.Bean.CTVacxin"%>
<%@page import="java.util.List"%>
<%@page import="Model.Bean.Vacxin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
		if (request.getAttribute("dsgia") != null) {
			List<CTVacxin> dsgia = (List<CTVacxin>) request.getAttribute("dsgia");
			for (CTVacxin e : dsgia) {
	%>
	<option value="<%=e.getMaLoNhap()%>"><%=e.getXuatXu()%></option>
	<%
		}
		}
	%>
