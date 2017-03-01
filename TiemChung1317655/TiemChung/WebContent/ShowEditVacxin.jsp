<%@page import="Model.Bean.LoaiVacxin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Bean.Vacxin"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Sửa thông tin vacxin</title>
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

		<!-- Modal -->

	</div>
	<div class="container-fluid" style="margin-left: 10px">
		<div style="margin-left: 500px">
			<h2>Sửa Thông Tin Vacxin</h2>
		</div>
		<div class="container">

			<form action="EditVacxin" method="post">
				<center style="margin-left: 300px">
					<%
							Vacxin v = (Vacxin) request.getAttribute("motvacxin");
						%>
					<div class="row">
						<div class="col-md-4">

							<label for="email"> Mã vacxin :</label>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="mavacxin"
								value="<%=v.getMaVacxin()%>" readonly="true" name="mavacxin">
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Tên vacxin : <span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="mavacxin"
								name="tenvacxin" value="<%=v.getTenVacxin()%>">
						</div>
						<%
								String loiten = (String) request.getAttribute("loiten");
								if (loiten != null) {
							%>
						<h6>
							<%=loiten%></h6>
						<%
								}
							%>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Tên loại vacxin :<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">

							<select class="form-control" id="sel1" name="maloaivacxin">
								<%
										ArrayList<LoaiVacxin> lv = (ArrayList<LoaiVacxin>) request.getAttribute("loaivacxin");
										int n = lv.size();

										for (int i = 0; i < n; i++) {
											if (v.getMaVacxin() == lv.get(i).getMaLoaiVacxin()) {
									%>
								<option selected="selected"
									value="<%=lv.get(i).getMaLoaiVacxin()%>"><%=lv.get(i).getTenLoaiVacxin()%></option>
								<%
										} else {
									%>
								<option value="<%=lv.get(i).getMaLoaiVacxin()%>">
									<%=lv.get(i).getTenLoaiVacxin()%></option>
								<%
										}
										}
									%>
							</select>
						</div>
					</div>
					<br>

					<div class="row">
						<div class="col-md-4">

							<label for="email">Tuổi tối thiểu :<span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="tuoitoithieu" VALUE="<%=v.getTuoiToiThieu()%>">
						</div>
						<%
								String loituoi = (String) request.getAttribute("loituoi");
								if (loituoi != null) {
							%>
						<h6>
							<%=loituoi%></h6>
						<%
								}
							%>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Tuổi tối đa : <span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="tuoitoida" VALUE="<%=v.getTuoiToiDa()%>">
						</div>
						<%
								if (loituoi != null) {
							%>
						<h6>
							<%=loituoi%></h6>
						<%
								}
							%>
					</div>
					<br>
					<div class="row">
						<div class="col-md-4">

							<label for="email">Số mũi : <span style="color:red">(*)</span></label>
						</div>
						<div class="col-md-4">
							<input type="number" class="form-control" id="mavacxin"
								name="somui" VALUE="<%=v.getSoMui()%>">
						</div>
						<%
								String somui = (String) request.getAttribute("loisomui");
								if (somui != null) {
							%>
						<h6><%=somui%></h6>
						<%
								}
							%>
					</div>

					<br>
					<%
							String thanhcong = (String) request.getAttribute("thanhcong");
							if (thanhcong != null) {
						%>
					<h6><%=thanhcong%></h6>
					<%
							}
						%>
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