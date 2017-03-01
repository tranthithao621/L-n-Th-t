<%@page import="Model.Bean.ThongKe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Quản lý tiêm chủng</title>
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
	<div class="container">
		 <h2>Danh sách Vacxin đã tiêm</h2> 
		
        <a href="TKVacxinDaTiem?dk=ASC" class="btn btn-primary">
        <span class="glyphicon glyphicon-chevron-down"></span>
        Giảm</a>
        
        <a href="TKVacxinDaTiem?dk=DESC" class="btn btn-primary">
        <span class="glyphicon glyphicon-chevron-up"></span>
        Tăng</a>
         
		 <form class="navbar-form navbar-right" action="TKVacxinDaTiem" method="get">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Tìm kiếm tên Vacxin" name="s">
							<div class="input-group-btn">
								<button class="btn btn-primary" type="submit" style="height: 34px">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>    
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Mã Vacin</th>
        <th>Tên Vacxin</th>
        <th>Số lượng</th>
      </tr>
    </thead>
    <tbody>
    <%
    	ArrayList<ThongKe> listVacxinDaTiem = (ArrayList<ThongKe> )request.getAttribute("listVacxinDaTiem");
    	
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
    	
    	
    	
    	
    	
    	
    	if(max > listVacxinDaTiem.size()){
    		max = listVacxinDaTiem.size();
    	}
    	
    	if(listVacxinDaTiem != null){
    		for(int i = start ;i< max;i++){
    			%>
    				<tr>
				        <td><%= listVacxinDaTiem.get(i).getMaVacxin() %></td>
				        <td><%= listVacxinDaTiem.get(i).getTenVacxin() %></td>
				        <td><%= listVacxinDaTiem.get(i).getSoLuong() %></td>
				      </tr>
    			<%
    		}
    	}
    %>
      
     
    </tbody>
  </table>
	</div>
	<center>
		<%
			if(total_page > 0){
				%>
					<ul class="pagination">
						<li><a href="TKVacxinDaTiem?page=1<%= request.getParameter("t") !=null?"&t="+request.getParameter("t")+ "&l="+request.getParameter("l"):"" %>">  << </a></li>
							<%
								for(int i = 0;i<total_page;i++){
									%>
										
									    <li class="<%= curent_page == (i + 1)?"active":"" %>" ><a  href="TKVacxinDaTiem?page=<%=i+1 %><%= request.getParameter("t") !=null?"&t="+request.getParameter("t")+ "&l="+request.getParameter("l"):"" %>"><%= i + 1 %></a></li>
									    
									<%
								}
							%>
							<li><a href="TKVacxinDaTiem?page=<%=total_page %><%= request.getParameter("t") !=null?"&t="+request.getParameter("t")+ "&l="+request.getParameter("l"):"" %>">  >> </a></li>
						</ul>
				<%
			}
		%>
			
	</center>
	</div>
	
</body>
</html>