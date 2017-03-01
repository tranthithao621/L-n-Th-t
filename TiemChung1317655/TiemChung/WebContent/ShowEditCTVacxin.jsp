<%@page import="Model.Bean.Vacxin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.CTVacxin"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sửa Chi Tiết Vacxin</title>
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
	<div class="container-fluid" style="margin-left: 10px">
		<center>
			<h2>Sửa Thông Tin Chi Tiết Vacxin</h2>
		</center>


		<div class="container">

			<form action="EditCTVacxin" method="post">
				<center style="margin-left: 300px">
					<%
							CTVacxin ctVacxin = (CTVacxin) request.getAttribute("ct1vacxin");
						%>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Mã Lô Nhập : <span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="mavacxin"
								readonly="true" name="malonhap"
								value="<%=ctVacxin.getMaLoNhap()%>">

						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-md-4">

							<label for="email">Tên vacxin:<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<select class="form-control" id="sel1" name="mavacxin">
								<%
										ArrayList<Vacxin> ds = (ArrayList<Vacxin>) request.getAttribute("vacxin");
										int n = ds.size();
										for (int i = 0; i < n; i++) {
											if (ctVacxin.getMaVacxin() == ds.get(i).getMaVacxin()) {
									%>
								<option selected="selected" value="<%=ds.get(i).getMaVacxin()%>"><%=ds.get(i).getTenVacxin()%></option>
								<%
										} else
									%>
								<option value='<%=ds.get(i).getMaLoaiVacxin()%>'><%=ds.get(i).getTenVacxin()%></option>
								<%
										}
									%>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Hạn sử dụng:<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="date" class="form-control" id="mavacxin"
								name="hansudung" value="<%=ctVacxin.getHanSuDung()%>">

						</div>
						<%
								String loiten = (String) request.getAttribute("loi");
								if (loiten != null) {
							%>
						<h6 style="color:red">
							<%=loiten%></h6>
						<%
								}
							%>
					</div>
					<br>

					<div class="row">
						<div class="col-md-4">

							<label for="email">Gía Bán :<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="giaban" value="<%=ctVacxin.getGiaBan()%>">
						</div>
						<%
								String loigiaban = (String) request.getAttribute("loigiaban");
								if (loigiaban != null) {
							%>
						<h6 style="color:red">
							<%=loigiaban%></h6>
						<%
								}
							%>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Xuất Xứ:<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="mavacxin"
								name="xuatxu" value="<%=ctVacxin.getXuatXu()%>">
						</div>

					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Số Lượng :<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="soluong" value="<%=ctVacxin.getSoLuong()%>">
						</div>
						<%
								String loisoluong = (String) request.getAttribute("loisoluong");
								if (loisoluong != null) {
							%>
						<h6 style="color:red">
							<%=loisoluong%></h6>
						<%
								}
							%>
					</div>

					<br>
				</center>
				<center>
					<button type="submit" class="btn btn-primary">Sửa</button>
					<button type="submit" class="btn btn-primary" name="quaylai">Quay
						lại</button>
				</center>

			</form>
		</div>
</body>
</html>