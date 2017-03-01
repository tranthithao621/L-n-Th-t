<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
<style><!--
.mySlides {display:none;}
/*header{
	background-image:url("images/logo.jpg");
	background-repeat:no-repeat;
}*/
--></style>
<title>Quản lý tiêm chủng</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  
<body id="myPage">
			<!-- header -->
			<header>
				<img src="images/qwe1.jpg" width="100%"/>
			</header>
			
	
	<!-- nav -->
	<div >
			<nav class="navbar navbar-inverse">
			  <div class="container-fluid">
			    <ul class="nav navbar-nav">
			      <li class="active"><a href="#">Trang chủ</a></li>
			      <li><a href="#">Tư vấn</a></li>
			      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Tìm kiếm<span class="caret"></span></a>
				        <ul class="dropdown-menu">
				          <li><a href="search.html">Loại Vacxin</a></li>
				          <li><a href="#">Vacxin</a></li>
				        </ul>
				      </li>
			      
			    </ul>
			    <%
			    	if(session.getAttribute("nguoidung") != null){
			    		%>
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
			    		<%
			    	}else{
			    		%>
			    			 <ul class="nav navbar-nav navbar-right">
			      <li><a href="#" data-toggle="modal" data-target="#dangKy"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
			      <li><a href="#" data-toggle="modal" data-target="#dangnhap"><span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
			    </ul>
			    		<%
			    	}
			    %>
			   
			  </div>
			</nav>

			<!-- Modal -->
			 <!-- Modal dang ky-->
			  <div class="modal fade" id="dangKy" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Đăng ký</h4>
			        </div>
			        <div class="modal-body">
			         	<form class="form-horizontal">
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Tên tài khoản:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="pwd">Mật khẩu:</label>
						    <div class="col-sm-10"> 
						      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="pwd">Xác nhận mật khẩu:</label>
						    <div class="col-sm-10"> 
						      <input type="password" class="form-control" id="pwd" placeholder="Enter password">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Tên khách hàng:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Tuổi:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Email:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Địa chỉ:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Số điện thoại:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="control-label col-sm-2" for="email">Giới tính:</label>
						    <div class="col-sm-10">
						      <input type="email" class="form-control" id="email" placeholder="Enter email">
						    </div>
						  </div>
						  <div class="form-group"> 
						    <div class="col-sm-offset-2 col-sm-10">
						      <button type="submit" class="btn btn-default">Đăng ký</button>
						    </div>
						  </div>
						</form>
			        </div>
			      </div>
			      
			    </div>
			  </div>
			  <!-- Modal dang nhap-->
			  <div class="modal fade" id="dangnhap" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Đăng nhập</h4>
			        </div>
			        <div class="modal-body">
			         	<form action="LoginServlet" method="post">
						  <div class="input-group">
						    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						    <input id="text" type="text" class="form-control" name="tenTaiKhoan" placeholder="Nhập tên tài khoản">
						  </div>
						  <div class="input-group" style="margin-top:10px">
						    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						    <input id="password" type="password" class="form-control" name="matKhau" placeholder="Nhập mật khẩu">
						  </div>
						  <div style="margin-top:10px" class="center">
						  		<center>
						  			<button type="submit" class="btn btn-primary" name="dangnhap">Đăng nhập</button>
						  		</center>
						  		
						  </div>	
						</form>
						<%
						if(request.getAttribute("error") != null){
							%>
								<div class="alert alert-danger"><%=request.getAttribute("error") %></div>
							<%
						}
						 %>
			        </div>
			      </div>
			      
			    </div>
			  </div>
	</div>
	<!-- slide show -->

<div class="w3-content w3-display-container">
  <img class="mySlides" src="images/1.1.jpg" style="width:100%" height="400px">
  <img class="mySlides" src="images/abc.jpg" style="width:100%" height="400px">
  <img class="mySlides" src="images/3.1.jpg" style="width:100%" height="400px">
  <img class="mySlides" src="images/4.1.jpg" style="width:100%" height="400px">

  <a class="w3-btn-floating w3-display-left" onclick="plusDivs(-1)">&#10094;</a>
  <a class="w3-btn-floating w3-display-right" onclick="plusDivs(1)">&#10095;</a>
</div>

<body>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 3000); // Change image every 2 seconds
}
</script>

</body>
	<!-- content -->
	<div class="w3-content">

		<div class="w3-row w3-margin">

		<div class="w3-third">
		  <img src="images/abc.jpg" style="width:100%;min-height:200px">
		</div>
		
		<div class="w3-twothird w3-container">
		
		  <h2>
		  <a href="http://bloglamcha.com/cap-nhat-moi-nhat-ve-vacxin-5-trong-1-pentaxim-dich-vu-2016.html"> Cập nhật mới nhất về Vacxin 5 trong 1 Pentaxim dịch vụ 2016</a></h2>
		  <p>
		  
		Theo tình hình hiện tại mà Cục Quản lý Dược cho biết Công ty Sanofi, nhà sản xuất văcxin 5 trong 1 Pentaxim sẽ cung cấp cho Việt Nam 200.000 liều.

		Trong đó, đợt cuối tháng 12 vừa qua, Việt Nam đã nhập về 160.000 liều và phân bổ ra 161 điểm tiêm Vacxin Pentaxim trên cả nước.
		  </p>
		</div>

		</div>
		<div class="w3-row w3-margin">

		<div class="w3-third">
		  <img src="images/zxc.jpg" style="width:100%;min-height:200px">
		</div>
		<div class="w3-twothird w3-container">
		  <h2><a href="http://dantri.com.vn/suc-khoe/nhung-thong-tin-thu-vi-ve-vac-xin-20160102075842673.htm">
		  Vài nét cơ bản về vắc xin Quinvaxem</a>
		  </h2>
		  <p>
		 Quinvaxem là vắc xin “5 trong 1”, do phối hợp để phòng bạch hầu, uốn ván, ho gà, viêm gan B và Haemophilus influenzae type b (Hib).

			Quinvaxem do hãng Berna Biotech, Hàn Quốc sản xuất, đạt tiêu chuẩn của Tổ chức Y tế thế giới (WHO) và được WHO khuyến cáo sử dụng từ năm 2006.
			
		  </p>
		</div>

		</div>
		<div class="w3-row w3-margin">

		<div class="w3-third">
		  <img src="images/3.jpg" style="width:100%;min-height:200px">
		</div>
		<div class="w3-twothird w3-container">
		  <h2><a href="https://us6.proxysite.com/process.php?d=axiXYrUAfJm0ugqFp53KcLNL7uG6EHuHOGiZYGxbxKxOYHtQKj3sLMwAMApJTfyfg8H9c17IZdA0mTLePt5%2BLM03daZZCs8CCMi%2B2nbYivci5ddYN%2BhuQhRbZorc&b=1">
		  Hà Giang: Gần 70 người nhập viện cấp cứu sau khi ăn cỗ cưới</a>
		  </h2>
		  <p>
		  66 người phải đi cấp cứu tại bệnh viện đa khoa khu vực Hoàng Su Phì (tỉnh Hà Giang) sau khi ăn cỗ đám cưới với những biểu hiện tiêu chảy, nôn...
			Đó là thông tin chúng tôi nhận được từ một lãnh đạo bệnh viện này. Theo đó, các bệnh nhân nhập viện ngày 15/2.
		  </p>
		</div>

		</div>
		<div class="w3-row w3-margin">

		<div class="w3-third">
		  <img src="images/zika.jpg" style="width:100%;min-height:200px">
		</div>
		<div class="w3-twothird w3-container">
		  <h2><a href="http://www.nguoiduatin.vn/mot-xa-4-nguoi-nhiem-vi-rut-zika-dong-nai-cong-bo-dich-a312155.html">
		 Một xã 4 người nhiễm vi rút Zika, Đồng Nai quyết định công bố dịch</a>
		  </h2>
		  <p>
		  Gần đây, địa bàn huyện Nhơn Trạch, tỉnh Đồng Nai phát hiện một số ca nhiễm Zika nên chính quyền đã họp công bố dịch để người dân phòng chống.
		  </p>
		</div>

		</div>
		<div class="w3-row w3-margin">

		<div class="w3-third">
		  <img src="images/o.JPG" style="width:100%;min-height:200px">
		</div>
		<div class="w3-twothird w3-container">
		  <h2><a href="http://www.nguoiduatin.vn/cu-ong-chet-bat-thuong-sau-khi-tiem-thuoc-bo-a121171.html">
		Cụ ông chết bất thường sau khi tiêm… thuốc bổ</a>
		  </h2>
		  <p>
		  Một cụ ông đã tử vong sau khi tới khám bệnh tại một điểm chăm sóc sức khỏe chưa có giấy phép hành nghề chuyên môn nên đã từng bị cơ quan chức năng kiểm tra, lập biên bản yêu cầu dừng hoạt động.
		Nạn nhân được xác định là ông Lê Đình Tứ (76 tuổi, trú khối phố 8, phường Nguyễn Du, TP.Hà Tĩnh).

		Ngày 8/1, ông Mai Văn Dy, trưởng công an xã Thạch Trung (TP.Hà Tĩnh - Hà Tĩnh), cho biết đang phối hợp với công an TP.Hà Tĩnh điều tra vụ việc ông Lê Đình Tứ vừa đột ngột tử vong sau khi tiêm thuốc bổ.
		  </p>
		</div>

		</div>
		<div class="w3-row w3-margin">

		<div class="w3-third">
		  <img src="images/A.jpg" style="width:100%;min-height:200px">
		</div>
		<div class="w3-twothird w3-container">
		  <h2><a href="http://www.nguoiduatin.vn/buoc-thoi-viec-voi-nhan-vien-y-te-phat-nham-vitamin-a-thanh-hat-dau-a118628.html">
		Buộc thôi việc với nhân viên y tế phát nhầm vitamin A thành hạt đậu</a>
		  </h2>
		  <p>
		  Ngày 16/12, ông Nguyễn Văn Dục, trưởng trạm y tế xã Cẩm Trung (Cẩm Xuyên, Hà Tĩnh) cho biết, đã quyết định buộc thôi việc đối với ông Võ Viết Hùng là nhân viên y tế thôn 10 xã Cẩm Trung vì phát nhầm vitamin A thành hạt đậu cho trẻ.
			Trước đó, vào khoảng 7h ngày 1/12, ông Võ Việt Hùng (SN 1974, trú tại xã Cẩm Trung, Cẩm Xuyên, Hà Tĩnh) là nhân viên y tế thôn 10 nhận được nhiệm vụ là phát vitamin A cho trẻ em tại hội quán thôn. Thay vì phát vitamin A thật thì nhân viên này lại phát nhầm hạt đậu giống cho các trẻ uống.
		  </p>
		</div>

		</div>
	<!-- pagination -->
	<center>

			<ul class="pagination">
			  <li><a href="#"><<</a></li>
			  <li><a href="#">1</a></li>
			  <li class=""><a href="#">2</a></li>
			  <li><a href="#">3</a></li>
			  <li><a href="#">>></a></li>
			</ul>
	</center>
	
	</div>
<div class="w3-container w3-grey">
			  			<h1>Trung Tâm Y Tế Dự Phòng</h1> 
			  
					</div>

					<div class="w3-row-padding">

					<div class="w3-third">
					  <h2>About us</h2>
					  <p>Address: Fpt city Đà Nẵng</p>
					  <p>Email: preventivehealthcenter@gmail.com.</p>
					  <p>SĐT: 0511.382.0471</p>
					  <p>Fax: 0511.382.0471</p>
					</div>

					<div class="w3-third">
					  <h2>Bác sĩ Tư Vấn</h2>
					  <p>Trần Thanh Tài - SĐT 0120.624.2344.</p> 
					  
					</div>

					

					</div>
</body>
</html>
