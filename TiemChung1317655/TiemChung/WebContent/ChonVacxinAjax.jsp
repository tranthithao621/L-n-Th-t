<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#Vacxin").load("danhSachVacxinServlet");
		$("#Vacxin").change(function() {
			var maVacxin = document.getElementById("Vacxin").value;
			$("#Gia").load("danhSachGiaServlet?maVacxin=" + maVacxin);
			var makh = document.getElementById("MaKH").value;
			if(makh!=null){
				$("#LanTiem").loat("lanTiemServlet?makh="+makh+"mavacxin="+maVacxin);
			}
			
		})
	})
</script>
</head>
<body>
	<div class="form-group">
		<label for="address">Tên vacxin :</label> <select id="Vacxin"
			name="mavacxin" class="form-control">
			<option value="">Chọn Vacxin</option>
		</select>
	</div>
	<div class="form-group" style="margin-top: 15px">
		<label for="gia"> Xuất Xứ</label> <select id="Gia"
			class="form-control" name="xuatxu">
				<option value="">Chọn xuất xứ</option>
		</select>
	</div>

	
</body>
</html>