<%@page import="Model.Bean.CTVacxin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Danh sách chi tiết vacxin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
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
				<li><a href="LogoutServlet"><span
						class="glyphicon glyphicon-log-in"></span> Log out</a></li>
			</ul>
		</div>
		</nav>


	</div>
	<!-- content -->
	<div class="container">
		<form class="navbar-form navbar-right" action="FindCTVacxin"
			method="get">
			<div class="input-group">
				<input type="text" class="form-control"
					placeholder="Tìm kiếm tên vacxin" name="xuatxu">
				<div class="input-group-btn">
					<button class="btn btn-primary" type="submit" style="height: 34px">Tìm
						kiếm</button>
				</div>
			</div>
		</form>
	</div>
	<center>
		<h3>Danh Sách Chi Tiết Vacxin</h3>
	</center>

	<div class="container">
	<form action="ShowAddCTVacxin">
			<button type="submit" class="btn btn-primary">Thêm</button>
		</form>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Mã Lô Nhập</th>
					<th>Tên Vacxin</th>
					<th>Hạn Sử Dụng</th>
					<th>Gía Bán</th>
					<th>Xuất Xứ</th>
					<th>Số lượng</th>

				</tr>
			</thead>
			<tbody>
				<%
							ArrayList<CTVacxin> ds = (ArrayList<CTVacxin>) request.getAttribute("ctvacxin");
							int total_page = Integer.parseInt(request.getAttribute("total_page").toString()); 
					    	int curent_page;
					    	int limit = 10;
					    	int start ;
					    	if(request.getParameter("page") != null){
					    		curent_page = Integer.parseInt(request.getParameter("page").toString());
					    		start = (curent_page - 1 ) * limit ;
					    	}else{
					    		curent_page = 0;
					    		start = 0;
					    	}
					   
					    	int max = start + limit;
					    	
					    	if(max > ds.size()){
					    		max = ds.size();
					    	}
					    	
					    	if(ds != null){
					    		for(int i = start ;i< max;i++){
						
						%>
				<tr>
					<td><%=ds.get(i).getMaLoNhap()%></td>
					<td><%=ds.get(i).getTenVacxin()%></td>
					<td><%=ds.get(i).getHanSuDung()%></td>
					<td><%=ds.get(i).getGiaBan()%></td>
					<td><%=ds.get(i).getXuatXu()%></td>
					<td><%=ds.get(i).getSoLuong()%></td>
					<td><a class="btn btn-primary"
						href="ShowEditCTVacxin?malonhap=<%=ds.get(i).getMaLoNhap()%>">Sửa</a></td>
					<td><a class="btn btn-danger"
						href="DeleteCTVacxin?mactvacxin=<%=ds.get(i).getMaLoNhap()%>">Xóa</a></td>

				</tr>
				<%
							}
					    	}
						%>
			
		</table>

		

	</div>
	<center>
		<%
			if(total_page > 0){
				%>
		<ul class="pagination">
			<li><a
				href="<%= request.getParameter("xuatxu") !=null?"FindCTVacxin?page=1&xuatxu="+request.getParameter("xuatxu"):"ShowListCTVacxin" %>">
					<< </a></li>
			<%
								for(int i = 0;i<total_page;i++){
									%>

			<li class="<%= curent_page == (i + 1)?"active":"" %>"><a
				href="<%= request.getParameter("xuatxu") !=null?"FindCTVacxin?page="+(i+1)+"&xuatxu="+request.getParameter("xuatxu"):"ShowListCTVacxin?page="+(i+1) %>"><%= i + 1 %></a></li>

			<%
								}
							%>
			<li><a
				href="<%= request.getParameter("xuatxu") !=null?"FindCTVacxin?page="+total_page+"&xuatxu="+request.getParameter("xuatxu"):"ShowListCTVacxin?page="+total_page %>">
					>> </a></li>
		</ul>
		<%
			}
		%>

	</center>
	<!-- footer -->

	</div>
</body>
</html>