<%@page import="Model.Bean.CTVacxin"%>
<%@page import="Model.Bean.Vacxin"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Thêm Chi Tiết Vacxin</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

</head>
<body>
	<div class="container-fluid">
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
		<center>
			<h2>Thêm Thông Tin Chi Tiết Vacxin</h2>
		</center>
		<div class="container">

			<form action="AddCTVacxin" method="post">
				<center style="margin-left: 300px">
					<%
						CTVacxin ct = (CTVacxin) request.getAttribute("ctvacxin");
					%>
					<!-- <div class="row">
						<div class="col-md-2">

							<label for="email">Mã Lô Nhập :</label>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="mavacxin"
								readonly="true" name="malonhap" hidden="hidden">
						</div>
					</div> -->
					<br>

					<div class="row">
						<div class="col-md-3">

							<label for="email">Tên vacxin  <span style="color:red">(*)</span>:</label>
						</div>
						<div class="col-md-4">
							<select class="form-control" id="sel1" name="mavacxin">
								<%
									ArrayList<Vacxin> ds = (ArrayList<Vacxin>) request.getAttribute("vacxin");
									int n = ds.size();
									for (int i = 0; i < n; i++) {
										if (ct != null) {
											if (ct.getMaVacxin() == ds.get(i).getMaVacxin()) {
								%>
								<option value='<%=ds.get(i).getMaVacxin()%>' selected="selected"><%=ds.get(i).getTenVacxin()%></option>
								<%
									}
										}
								%>
								<option value='<%=ds.get(i).getMaVacxin()%>'><%=ds.get(i).getTenVacxin()%></option>
								<%
									}
								%>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">

							<label for="email">Hạn sử dụng <span style="color:red">(*)</span>:</label>
						</div>
						<div class="col-md-4">
							<input type="date" class="form-control" id="mavacxin"
								name="hansudung"
								value="<%=ct == null ? "" : ct.getHanSuDung()%>">
						</div>
						<%
							String hansudung = (String) request.getAttribute("loihansudung");
							if (hansudung != null) {
						%>
						<h6 style="color:red"><%=hansudung%></h6>
						<%
							}
						%>
					</div>
					<br>

					<div class="row">
						<div class="col-md-3">

							<label for="email">Giá Bán <span style="color:red">(*)</span> :</label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="giaban" value="<%=ct == null ? "0" : ct.getGiaBan()%>">
						</div>
						<%
							String loigiaban = (String) request.getAttribute("loigiaban");
							if (loigiaban != null) {
						%>
						<h6 style="color:red"><%=loigiaban%></h6>
						<%
							}
						%>
					</div>
					<br>
					<div class="row">
						<div class="col-md-3">

							<label for="email">Xuất Xứ  <span style="color:red">(*)</span>:</label>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="mavacxin"
								name="xuatxu" value="<%=ct == null ? "" : ct.getXuatXu()%>">
						</div>

					</div>
					<br>
					<div class="row">
						<div class="col-md-3">

							<label for="email">Số Lượng <span style="color:red">(*)</span> :</label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="soluong" value="<%=ct == null ? "0" : ct.getSoLuong()%>">
						</div>
						<%
							String loisoluong = (String) request.getAttribute("loisoluong");
							if (loisoluong != null) {
						%>
						<h6 style="red"><%=loisoluong%></h6>
						<%
							}
						%>
					</div>
					<br>
				</center>
				<center>
					<%
						String loi = (String) request.getAttribute("loi");
						if (loi != null) {
					%>
					<h6 style="color:red"><%=loi%></h6>
					<%
						}
					%>
					<button type="submit" class="btn btn-primary">Thêm</button>
					<button type="submit" class="btn btn-primary" name="quaylai">Quay
						lại</button>
				</center>

			</form>
			<center>
				<%
					String thanhcong = (String) request.getAttribute("thanhcong");
					if (thanhcong != null) {
				%>
				<h6><%=thanhcong%></h6>
				<%
					}
				%>
			</center>
		</div>
	</div>
</body>
</html>