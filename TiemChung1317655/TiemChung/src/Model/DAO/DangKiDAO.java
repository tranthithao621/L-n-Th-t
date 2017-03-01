package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class DangKiDAO {
	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}
	
	public int datLichTiem(String ngayDat, int maKH, int maVacxin) throws Exception{
		KetNoi();
		String query = "INSERT INTO DangKi VALUES(?,?,?,?)";
		PreparedStatement ps  = cn.prepareStatement(query);
		ps.setObject(3, ngayDat);
		ps.setInt(1, maKH);
		ps.setInt(2, maVacxin);
		ps.setInt(4, 0);
		return ps.executeUpdate();
	}
	public int getSoLuongVacXin(int maVacxin,String xuatXu) throws Exception{
		KetNoi();
		String query = "select count(CTVacXin.MaVacxin) as SoLuong from CTVacXin,DangKi where CTVacXin.MaLoNhap = DangKi.MaVacxin and CTVacXin.MaVacxin = ? and CTVacXin.XuatXu = ? and TrangThai = 0";
		//String query = "select  COUNT(MaVacxin) AS SoLuong from DangKi where MaVacxin = ? AND TrangThai = 0 Group by MaVacxin";
		int soLuong = 0;
		PreparedStatement ps = cn.prepareStatement(query);
		ps.setInt(1, maVacxin);
		ps.setString(2,xuatXu);
		ps.setInt(1,maVacxin);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			soLuong = rs.getInt("SoLuong");
			return soLuong;
		}
		return soLuong;
	}
	public int getSoLuongVacxinHienCo(int maVacxin,String xuatXu) throws Exception{
		KetNoi();
		String query = "select Sum(SoLuongConLai) as SoLuong from CTVacXin,Vacxin where CTVacXin.MaVacxin = Vacxin.MaVacxin and Vacxin.MaVacxin = ? and XuatXu = ? AND HanSuDung>=GETDATE()";
		int soLuong = 0;
		PreparedStatement ps = cn.prepareStatement(query);
		ps.setInt(1, maVacxin);
		ps.setNString(2, xuatXu);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			soLuong = rs.getInt("SoLuong");
			return soLuong;
		}
		return soLuong;
	}
	
	public int getLichDat(int makh)throws Exception{
		KetNoi();
		
		String sql="select MaVacxin from DangKi where day(NgayDat)=day(GETDATE()) and MONTH(NgayDat)=MONTH(GETDATE()) and YEAR(NgayDat)=YEAR(GETDATE()) AND TrangThai='0' and MaKH='"+makh+"'";
		//String sql = "select CTVacxin.MaVacxin from DangKi,CTVacXin where DangKi.MaVacxin = CTVacXin.MaLoNhap and MaLoNhap = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		
		ResultSet rs= cmd.executeQuery();
		int mavacxin= 0;
		while(rs.next()){
			mavacxin = rs.getInt("MaVacxin");
			return mavacxin;
		}
		return mavacxin;
	}
	public int getMaVacxin(int makh, int maLoNhap) throws Exception{
		KetNoi();
		String sql = "select CTVacxin.MaVacxin from DangKi,CTVacXin where DangKi.MaVacxin = CTVacXin.MaLoNhap and MaLoNhap = ?";
		PreparedStatement cmd = cn.prepareStatement(sql);
		cmd.setInt(1,maLoNhap);
		ResultSet rs= cmd.executeQuery();
		int mavacxin= 0;
		while(rs.next()){
			mavacxin = rs.getInt("MaVacxin");
			return mavacxin;
		}
		return mavacxin;
	}
}
