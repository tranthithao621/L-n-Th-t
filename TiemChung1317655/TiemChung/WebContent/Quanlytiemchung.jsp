<%@page import="Model.Bean.KhachHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdk.nashorn.internal.runtime.arrays.ArrayLikeIterator"%>
<%@page import="Model.Bean.CTVacxin"%>
<%@page import="java.util.List"%>
<%@page import="Model.Bean.Vacxin"%>
<%@page import="Model.Bean.QuanLyTiemChung"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Quản lý tiêm chủng</title>
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
		<!-- content -->
		<div class="container" style="height: 100%">
			<center>
				<h3>Thêm Lần Tiêm</h3>
			</center>
			<%
				KhachHang nv1 = (KhachHang) request.getAttribute("kh");
				Vacxin vx1 = (Vacxin) request.getAttribute("vx");
			%>


			 <form action="ThemTiemChung" method="post"> 
			<div class="row">

				<div class="col-sm-5" style="margin-left: 100px">
					<div class="form-group">
						<label for="name">Họ tên khách hàng : <span
							style="color: red">(*)</span></label> <input type="text"
							class="form-control" id="name" name="tenkhachhang"
							value="<%=(nv1 != null) ? nv1.getTenKH() : ""%>" readonly>

					</div>


					<div class="form-group">
						<label for="address">Tên vacxin : <span style="color: red">(*)</span></label>
						<select id="Vacxin" name="mavacxin" class="form-control">
							<option value="">Chọn Vacxin</option>
						</select>
					</div>
					<div class="form-group" style="margin-top: 15px">
						<label for="gia"> Xuất Xứ: <span style="color: red">(*)</span></label>
						<select id="Gia" class="form-control" name="xuatxu">
							<option value="">Chọn xuất xứ</option>
						</select>
					</div>


					<input type="hidden" class="form-control" id="MaKH"
						name="makhachhang"
						value="<%=(request.getParameter("makh") != null)?request.getParameter("makh"):""%>"
						readonly> <input type="hidden" class="form-control"
						id="MaLoNhap" name="malonhap"
						value="<%=(request.getParameter("maVacxin") != null)?request.getParameter("maVacxin"):""%>"
						readonly>




				</div>
				<div class="col-sm-5">
					<%
							String ngaytaitiem = (String) request.getAttribute("ngaytaitiem1");
						%>
					<div class="form-group">
						<label for="address"> Ngày tái tiêm : <span
							style="color: red">(*)</span></label> <input type="date"
							class="form-control" id="address" name="ngaytaitiem"
							value="<%=ngaytaitiem != null ? ngaytaitiem : ""%>">
					</div>
					<%
							String lantiem = (String) request.getAttribute("lantiem");
						%>
					<div class="form-group" style="margin-top: 15px">
						<label for="gia"> Lần tiêm: <span style="color: red">(*)</span></label>
						<select id="Lantiem" class="form-control" name="lantiem" readonly>
							<option value=""></option>
						</select>
					</div>
					<%
							String ghichu = (String) request.getAttribute("ghichu1");
						%>
					<div class="form-group">
						<label for="sdt">Ghi chú:</label> <input type="text"
							class="form-control" id="sdt" name="ghichu"
							value=<%=ghichu != null ? ghichu : ""%>>
					</div>

					<div></div>
				</div>
			</div>
			<center>

				<button type="submit" class="btn btn-primary" name="thanhToan">Thanh Toán</button>

				
			





			</center>

			 	</form>

		</div>
		<center>
			<%
				String xuatxu = (String) request.getAttribute("loivacxin");

				 if (xuatxu != null) {
			%>
			<h5 style="color: red"><%=xuatxu%></h5>
			<%} %>

				
		</center>

		<script type="text/javascript">
			$(document).ready(
					function() {
						var makh = document.getElementById("MaKH").value;
						var maLoNhap = document.getElementById("MaLoNhap").value;
						if(makh != null && makh != ""){
							$("#Vacxin").load(
									"danhSachVacxinServlet?makh="+makh+"&maVacxin="+maLoNhap,
									function() {
										var maVacxin = document
												.getElementById("Vacxin").value;
										
										$("#Gia").load(
												"danhSachGiaServlet?maVacxin="
														+ maVacxin);
										if (makh != null) {
											$("#Lantiem").load(
													"lanTiemServlet?makh=" + makh
															+ "&mavacxin="
															+ maVacxin);
										}
									});
						}else{
							
							$("#Vacxin").load("danhSachVacxinServlet");
							$("#Vacxin").change(function() {
							var maVacxin = document.getElementById("Vacxin").value;
							$("#Gia").load("danhSachGiaServlet?maVacxin="+ maVacxin);
							var makh = document.getElementById("MaKH").value;
							if (makh != null) {
							$("#Lantiem").load("lanTiemServlet?makh="+ makh+ "&mavacxin="+ maVacxin);
									}
								})
						}
						
						$("#Vacxin").load("danhSachVacxinServlet");
						$("#Vacxin").change(function() {
						var maVacxin = document.getElementById("Vacxin").value;
						$("#Gia").load("danhSachGiaServlet?maVacxin="+ maVacxin);
						var makh = document.getElementById("MaKH").value;
						if (makh != null) {
						$("#Lantiem").load("lanTiemServlet?makh="+ makh+ "&mavacxin="+ maVacxin);
								}
							})

					});
		</script>

	</div>
</body>
</html>