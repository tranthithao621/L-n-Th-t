package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.Bean.TaiKhoan;


public class TaiKhoanDAO {
	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}
	public TaiKhoan checkLogin(String tenDangNhap, String matKhau) throws Exception{
		 KetNoi();
		String query = "SELECT TaiKhoan.*,KhachHang.TenKH,KhachHang.MaKH FROM TaiKhoan,KhachHang WHERE TaiKhoan.TenDangNhap = ? AND TaiKhoan.MatKhau = ? AND TaiKhoan.MaTaiKhoan = KhachHang.TenDangNhap";
		PreparedStatement ps = cn.prepareStatement(query);
		ps.setString(1, tenDangNhap);
		ps.setString(2, matKhau);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			int maTaiKhoan = rs.getInt("MaTaiKhoan");
			String _tenDangNhap = rs.getString("TenDangNhap");
			String _matKhau = rs.getString("MatKhau");
			boolean quyen = rs.getBoolean("Quyen");
			String tenKH = rs.getString("TenKH");
			int maKH = rs.getInt("MaKH");
			
			TaiKhoan taiKhoan = new TaiKhoan();
			
			taiKhoan.setMaTaiKhoan(maTaiKhoan);
			taiKhoan.setTenTaiKhoan(_tenDangNhap);
			taiKhoan.setMatKhau(_matKhau);
			taiKhoan.setQuyen(quyen);
			taiKhoan.setTenKH(tenKH);
			taiKhoan.setMaKH(maKH);
			return taiKhoan;
		}
		return null;
	}
}
