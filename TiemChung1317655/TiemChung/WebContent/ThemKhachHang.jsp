<%@page import="Model.Bean.KhachHang"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Thêm Khách Hàng</title>
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
		<div class="container-fluid"
			style="margin-left: 10px; min-height: 600px">
			<table width="450" align="center">
				<tr>
					<td align="center">
						<h1>
							<b>Thêm Khách Hàng</b>
						</h1>
					</td>
				</tr>
			</table>
			<br>
			<form action="KhachHangServlet" method="post">
				<table width="450" align="center" cellpadding="5">

					<%
						KhachHang kh = (KhachHang) request.getAttribute("khthem");
						String kttenkh = (String) request.getAttribute("kttenkh");
						String tenkh= (String) request.getAttribute("loiten");

						if (kttenkh != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Bạn chưa nhập tên khách hàng!</span></span></td>
					</tr>
					<%
						}if(tenkh!=null){	
					%>	
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px"><%=tenkh %></span></span></td>
					</tr>
					<%
						}
					%>

					<tr>
						<td>Họ Tên <span style="color: red">(*)</span></td>
					</tr>
					<tr>
						<td width="300"><input type="text" name='txttenkh'
							class='form-control' value="<%=kh != null ? kh.getTenKH() : ""%>"><br>
						</td>
					</tr>
					<%
						String kttuoikh = (String) request.getAttribute("kttuoikh");
						String kttuoikh1 = (String) request.getAttribute("kttuoikh1");
						if (kttuoikh != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Bạn chưa nhập tuổi khách hàng !</span></span></td>
					</tr>
					<%
						}
					%>
					<%
						if (kttuoikh1 != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Nhập tuổi sai !</span></span></td>
					</tr>
					<%
						}
					%>

					<tr>
						<td>Tuổi<span style="color: red">(*)</span></td>
					</tr>

					<tr>
						<td width="300"><input type="number" name='txttuoikh'
							class='form-control' value="<%=kh != null ? kh.getTuoi() : 0%>"><br>
						</td>
						<td></td>

					</tr>
					
					<tr>
						<td>Giới Tính<span style="color: red">(*)</span><br>
						</td>
					</tr>

					<tr>
						<td><br> <label class="radio-inline"> <input
								type="radio" name="radiogioitinhkh" value='True'
								checked="checked">Nam
						</label> <label class="radio-inline"> <input type="radio"
								name="radiogioitinhkh" value='False'>Nữ
						</label></td>

					</tr>
					<%
						String saidiachi = (String) request.getAttribute("saidiachi");
						String saidiachi1 = (String) request.getAttribute("saidiachi1");
						if (saidiachi != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Độ dài quá lớn</span></span></td>
					</tr>
					<%
						} else if (saidiachi1 != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Địa chỉ không chính xác!</span></span></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td><br> Địa Chỉ<span style="color: red">(*)</span></td>
					</tr>
					<tr>

						<td width="300"><input type="text" name='txtdiachikh'
							class='form-control'
							value="<%=kh != null ? kh.getDiaChi() : ""%>"><br></td>

					</tr>
					
					<%
						String saisodt2 = (String) request.getAttribute("loidt");
						String saisodt1 = (String) request.getAttribute("saisodt1");
						if (saisodt2 != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Vui lòng nhập số điện thoại!!</span></span></td>
					</tr>
					<%
						} else if (saisodt1 != null) {
					%>
					<tr>
						<td><span style="color: red"><span
								style="font-size: 13px">Số điện thoại phải từ 10 đến 11
									chữ số!</span></span></td>
					</tr>
					<%
						}
					%>
					<tr>
						<td>Số Điện Thoại<span style="color: red">(*)</span></td>
					</tr>
					<tr>

						<td width="300"><input type="number" name='txtsodtkh'
							class='form-control' value="<%=kh != null ? kh.getsoDT() : ""%>"><br>
						</td>

					</tr>
					
					<tr>
						<td>Email</td>
					</tr>
					<tr>

						<td width="300"><input type="email" name='txtemailkh'
							class='form-control' value="<%=kh != null ? kh.getEmail() : ""%>"><br>
						</td>

					</tr>

					<tr>

						<td><input type="submit" value=" Thêm"
							class="btn btn-primary" name='btnthemkh'>&nbsp; <input
							type="submit" value=" Hủy " class="btn btn-danger"
							name='btnhuythemkh'></td>
					</tr>


				</table>
			</form>

		</div>

	</div>
</body>
</html>