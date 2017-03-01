<%@page import="Model.Bean.LichDatTiem"%>
<%@page import="Model.Bean.LichSuTiemPhong"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Quản lý Tiêm Chủng </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  
</head>
<body  background ="images/log.jpg">
	<div class="container-fluid"> 
		<div >
				<nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    
				    <ul class="nav navbar-nav">
				      <li class="active"><a href="#">Trang chủ</a></li>
				      <li><a href="DangKiServlet">Đặt lịch tiêm chủng</a> </li>
				      <li><a href="LichSuTiemPhongKHServlet">Lịch sử tiêm phòng</a> </li>
				      <li><a href="LichDatTiemKHServlet">Danh sách đặt tiêm phòng</a> </li>
				    </ul>
				    <ul class="nav navbar-nav navbar-right">
				      <li><a href="#" ><span class="glyphicon glyphicon-user"></span>
				       <%
				    	  	if(session.getAttribute("nguoidung") != null){
				    	  		%>
				    	  			<%=session.getAttribute("nguoidung") %>
				    	  		<%
				    	  	}
				    	%>
				      </a></li>
				      <li><a href="LogoutServlet" ><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
				    </ul>
				  </div>
				</nav>


		</div>
		<!-- content -->
		<div class="container-fluid" style="margin-left:10px; height:100%">
			<div class="row">
			
				<div class="col-sm-2"></div>
				<div class="col-sm-4">
					<form action="LichSuTiemPhongKHServlet" method="get">
					
					
		  				<div>
							<label for="address"> Từ ngày :</label>
							<input type="date" class="form-control" id="address" name="from">
						</div>
						<div>
							<label for="address"> Đến ngày :</label>
							<input type="date" class="form-control" id="address" name="to">
						</div>
						<div style="margin-top:10px">
						<button type="submit" class="btn btn-primary" style="margin-right:10px">Xem</button>
						
					</div>
					</form>
		  				
				</div>
				<div class="col-sm-4">
				<form action="LichSuTiemPhongKHServlet" method="get">
				
				
					<div class="form-group" style="margin-top:25px ">
		    				
		    				<input type="search" class="form-control" id="search" placeholder="Nhập vào tên Vacxin" name="s">
		 				 </div>
	  				
					<div style="margin-top:10px">
						<button type="submit" class="btn btn-primary" style="margin-right:10px">Tìm Kiếm</button>
						<a href="DangKiServlet" >Quay lại</a>
						
					</div>
					
				</form>	

			</div>
		</div>
			<%if(request.getAttribute("thongbao") != null){
							%>
								<div class="alert alert-success"><%=request.getAttribute("thongbao") %></div>
							<%
						}%>
			<%if(request.getAttribute("error") != null){
							%>
								<div class="alert alert-danger"><%=request.getAttribute("error") %></div>
							<%
						}%>
						
			<%
					ArrayList<LichDatTiem> listLichDatTiem = (ArrayList<LichDatTiem> )request.getAttribute("listLichDatTiem");
					for(int i = 0; i< listLichDatTiem.size();i++){
						%>
						<div class="alert alert-danger">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						  <strong>Nhắc nhở!</strong>
						  Ngày <%=listLichDatTiem.get(i).getNgayDat() %>  bạn có lịch hẹn tiêm Vacxin <%= listLichDatTiem.get(i).getTenVacxin() %>
						</div>
													
						<%
					}
				%>
			<div>
							<table width="900" align="center" class='table table-striped'>
								    <thead>
								      <tr>
								        <th>Mã Khách Hàng</th>
								        <th>Tên khách hàng</th>
								        
								       
								        <th>Tên Vacxin</th>
								         <th>Ngày  tiêm</th>

								        <th>Ngày tái tiêm</th>
								        <th>Giá </th>
								        
								        <th>Lần tiêm</th>
								       
								      </tr>
								    </thead>
								    <tbody>
								    <%
								    
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
							    	
							    	
							    	
							    	
							    	ArrayList<LichSuTiemPhong> list = (ArrayList<LichSuTiemPhong>) request.getAttribute("dstk");
							    	
							    	if(max > list.size()){
							    		max = list.size();
							    	}
							    	for(int i = start ;i< max;i++){
							    		%>
							    			<tr>
										      	<td><%=list.get(i).getMaKH() %></td>
												<td><%=list.get(i).getTenKH() %></td>
												<td><%=list.get(i).getTenVacxin() %> </td>
												<td><%=list.get(i).getNgayTiem() %> </td>
												<td><%=list.get(i).getNgayTaiTiem() %> </td>
												<td><%=list.get(i).getGiaBan() %> </td>
												<td><%=list.get(i).getLanTiem() %> </td>
										       
										      </tr>
							    		<%
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
				<li><a href="LichSuTiemPhongKHServlet?page=1<%= request.getParameter("s") !=null ? "&s="+request.getParameter("s"): (request.getParameter("from")!= null && request.getParameter("to") != null)?"&from="+request.getParameter("from")+"&to="+request.getParameter("to"):"" %>">  << </a></li>
					<%
						for(int i = 0;i<total_page;i++){
							%>
								
							    <li class="<%= curent_page == (i + 1)?"active":"" %>" ><a  href="LichSuTiemPhongKHServlet?page=<%=i+1 %><%= request.getParameter("s") !=null ? "&s="+request.getParameter("s"): (request.getParameter("from")!= null && request.getParameter("to") != null)?"&from="+request.getParameter("from")+"&to="+request.getParameter("to"):"" %>"><%= i + 1 %></a></li>
							    
							<%
						}
					%>
					<li><a href="LichSuTiemPhongKHServlet?page=<%=total_page %><%= request.getParameter("s") !=null ? "&s="+request.getParameter("s"): (request.getParameter("from")!= null && request.getParameter("to") != null)?"&from="+request.getParameter("from")+"&to="+request.getParameter("to"):"" %>">  >> </a></li>
				</ul>
			<%
		}
	%>
			
	</center>
			
		</div>



					

					</div>
	</div>
</body>
</html>