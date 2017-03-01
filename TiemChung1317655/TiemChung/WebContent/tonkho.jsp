
<%@page import="Model.Bean.tonkhobean"%>
<%@page import="Model.Bean.thongkebean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<style>
	  .w3-signal-grey
{color:#fff;background-color:#9b9b9b}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- header -->


		<!-- nav -->
		<div>
			<nav class="navbar navbar-inverse">
			<div class="container-fluid">

				<ul class="nav navbar-nav">
					<li class="active"><a href="Home.jsp">Trang chủ</a></li>
					<li><a href="ThemLoaiVacxinServlet">Loại Vacxin</a></li>
					<li class=""><a href="ShowListVacxin">Vacxin</a></li>
					<li class=""><a href="ShowListCTVacxin">CTVacxin</a></li>
					<li class=""><a href="KhachHangServlet">Quản lý khách hàng</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Quản lý tiêm chủng <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="LichDatTiemServlet">Lịch đặt tiêm</a></li>
							<li><a href="LichSuTiemPhongServlet">Lịch sử tiêm phòng</a></li>
							<li><a href="QuanLyTiemChungServlet">Quản lý tiêm chủng</a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Thống kê - Báo cáo <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="TKVacxinDaTiem">Vacxin Đã Tiêm</a></li>
							<li><a href="TonKhoSV">Vacxin Tồn Kho</a></li>
							<li><a href="hethanSV">Vacxin Hết hạn</a></li>
							
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="modal" data-target="#dangKy"><span
							class="glyphicon glyphicon-user"></span> Admin</a></li>
					<li><a href="LogoutServlet" ><span
							class="glyphicon glyphicon-log-in"></span> Log out</a></li>
				</ul>
			</div>
			</nav>
		</div>
		<!-- content -->

		<form method="get" action="TonKhoSV"></form>
	</div>

	<!--<tr>
		<td colspan="9"><h2 align="center"><span style="color: green" >Thống kê vacxin đã tiêm </span></h2></td>
		
	</tr>-->


	<tr>
		<td colspan="9"><h2 align="center">
				<span>Danh Sách Vacxin tồn kho </span>
			</h2></td>

	</tr>
	<div class="container">
		<table class="table table-striped" align="center">
		<tr class="">

			<th>Mã vacxin</th>
			<th>Tên Vacxin</th>
			<th>Số lượng</th>

		</tr>
		<%
			int total_page = Integer.parseInt(request.getAttribute("total_page").toString()); 
	    	int curent_page;
	    	int limit = 2;
	    	int start ;
	    	if(request.getParameter("page") != null){
	    		curent_page = Integer.parseInt(request.getParameter("page").toString());
	    		start = (curent_page - 1 ) * limit ;
	    	}else{
	    		curent_page = 0;
	    		start = 0;
	    	}
	   
	    	int max = start + limit;
	    	
	    	
	    	
	    	
	    	ArrayList<tonkhobean> list =(ArrayList<tonkhobean>) request.getAttribute("lk");
	    	
	    	if(max > list.size()){
	    		max = list.size();
	    	}
	    	for(int i = start ;i< max;i++)
	    	{
			%>
		<tr class="">
			<td><%=list.get(i).getMaVacxin()%></td>
			<td><%=list.get(i).getTenVacxin() %></td>
			<td><%=list.get(i).getSl() %></td>
		</tr>


		<%} %>
	</table>

	<center>
		<%
		if(total_page > 0){
			%>
		<ul class="pagination">
			<li><a
				href="TonKhoSV?page=1<%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>">
					<< </a></li>
			<%
					for(int i = 0;i<total_page;i++){
						%>

			<li class="<%= curent_page == (i + 1)?"active":"" %>"><a
				href="TonKhoSV?page=<%=i+1 %><%= request.getParameter("s") !=null?"&s="+request.getParameter("s"):"" %>"><%= i + 1 %></a></li>

			<%
					}
				%>
			<li><a href="TonKhoSV?page=<%=total_page %>"> >> </a></li>
		</ul>
		<%
		}
	%>

	</center>
		
	 </div>
	

	<!-- footer -->


	</div>
	</div>

</body>
</html>