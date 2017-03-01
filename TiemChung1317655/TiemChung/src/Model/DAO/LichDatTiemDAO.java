package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.LichDatTiem;



public class LichDatTiemDAO {
	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}
	public ArrayList<LichDatTiem> getDatLich() throws Exception{
		
		KetNoi();
		//String sql= "SELECT dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin,dbo.Vacxin.MaVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin ";
		String sql = "SELECT        DangKi.MaKH,Vacxin.MaVacxin,DangKi.NgayDat, KhachHang.TenKH, DangKi.TrangThai, CTVacXin.MaLoNhap, Vacxin.TenVacxin, CTVacXin.XuatXu FROM  CTVacXin INNER JOIN DangKi ON CTVacXin.MaLoNhap = DangKi.MaVacxin INNER JOIN KhachHang ON DangKi.MaKH = KhachHang.MaKH INNER JOIN Vacxin ON CTVacXin.MaVacxin = Vacxin.MaVacxin";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<LichDatTiem>ds= new ArrayList<LichDatTiem>();
		while(r.next()){
			 String tenVacxin=r.getString("TenVacxin");
			 int maKH = r.getInt("MaKH");
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 String tenKH = r.getString("TenKH");
			 int maVacxin = r.getInt("MaVacxin");
			 int maLoNhap = r.getInt("MaLoNhap");
			 String xuatXu = r.getString("XuatXu");
			 LichDatTiem ldt = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			 ldt.setMaVacxin(maVacxin);
			 ldt.setMaLoNhap(maLoNhap);
			 ldt.setXuatXu(xuatXu);
			 ds.add(ldt);
		}
		r.close();
		cn.close();
		return ds;
	}
	public ArrayList<LichDatTiem> getTheoMaKH(int maKH) throws Exception{
		KetNoi();
		ArrayList<LichDatTiem>ds= new ArrayList<LichDatTiem>();
		//String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin,dbo.Vacxin.MaVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin where DangKi.MaKH = ?";
		//String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin,dbo.Vacxin.MaVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.CTVacxin ON dbo.DangKi.MaVacxin = dbo.CTVacxin.MaLoNhap where DangKi.MaKH = ?";
		String sql = "SELECT        Vacxin.MaVacxin,DangKi.NgayDat, KhachHang.TenKH, DangKi.TrangThai, CTVacXin.MaLoNhap, Vacxin.TenVacxin, CTVacXin.XuatXu FROM  CTVacXin INNER JOIN DangKi ON CTVacXin.MaLoNhap = DangKi.MaVacxin INNER JOIN KhachHang ON DangKi.MaKH = KhachHang.MaKH INNER JOIN Vacxin ON CTVacXin.MaVacxin = Vacxin.MaVacxin where TrangThai = 0 and DangKi.MaKH = ?";
		PreparedStatement cmd = cn.prepareStatement(sql);
		
		cmd.setInt(1, maKH);
		
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 String tenKH = r.getString("TenKH");
			 int maVacxin = r.getInt("MaVacxin");
			 int maLoNhap = r.getInt("MaLoNhap");
			 String xuatXu = r.getString("XuatXu");
			 LichDatTiem ldt = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			 ldt.setMaVacxin(maVacxin);
			 ldt.setMaLoNhap(maLoNhap);
			 ldt.setXuatXu(xuatXu);
			 ds.add(ldt);
			
		}
		r.close();
		cn.close();
		return ds;
	}
	public ArrayList<LichDatTiem> timKiemTheoTenVacxin(String tuKhoa) throws Exception{
		KetNoi();
		ArrayList<LichDatTiem> list = new ArrayList<LichDatTiem>();
		String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin,dbo.Vacxin.MaVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin where dbo.Vacxin.TenVacxin LIKE ? or dbo.DangKi.NgayDat = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		if (tuKhoa.matches("\\d{4}-\\d{2}-\\d{2}")) {
			cmd.setNString(1,"%"+ tuKhoa +"%");
			cmd.setObject(2, tuKhoa);
		}else{
			cmd.setNString(1,"%"+ tuKhoa +"%");
			cmd.setObject(2, null);
		}

		
		
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 String tenKH = r.getString("TenKH");
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 int maVacxin = r.getInt("MaVacxin");
			 int maKH = r.getInt("MaKH");
			 LichDatTiem user = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			 user.setMaVacxin(maVacxin);
			 list.add(user);
			
		}
		r.close();
		cn.close();
		return list;
	}
	
	public ArrayList<LichDatTiem> timKiemTheoNgay(String date) throws Exception{
		KetNoi();
		
		ArrayList<LichDatTiem> list = new ArrayList<LichDatTiem>();
		String sql = "SELECT  dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin,dbo.Vacxin.MaVacxin, dbo.DangKi.NgayDat, dbo.DangKi.TrangThai,dbo.DangKi.MaKH  FROM   dbo.DangKi INNER JOIN dbo.KhachHang ON dbo.DangKi.MaKH = dbo.KhachHang.MaKH INNER JOIN dbo.Vacxin ON dbo.DangKi.MaVacxin = dbo.Vacxin.MaVacxin where dbo.DangKi.NgayDat = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		cmd.setObject(1, date);
		
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 String tenKH = r.getString("TenKH");
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 int maKH = r.getInt("MaKH");
			 LichDatTiem user = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			
			 list.add(user);
			
		}
		r.close();
		cn.close();
		return list;
	
	}
	
	public int huyLichDatTiem(int maKH,int maVacxin, String ngayDat) throws Exception{
		KetNoi();
		String sql = "Delete from DangKi where MaKH = ? and MaVacxin = ? and NgayDat = ?";
		PreparedStatement cmd = cn.prepareStatement(sql);
		
		cmd.setInt(1, maKH);
		cmd.setInt(2, maVacxin);
		cmd.setObject(3, ngayDat);
		
		return cmd.executeUpdate();
	}
	
	
	public ArrayList<LichDatTiem> getLichTiem(int maKH) throws Exception{
		KetNoi();
		
		ArrayList<LichDatTiem> list = new ArrayList<LichDatTiem>();
		String sql = "select DangKi.*,Vacxin.TenVacxin,KhachHang.TenKH  from DangKi,KhachHang,Vacxin where DangKi.MaKH = KhachHang.MaKH and DangKi.MaVacxin = Vacxin.MaVacxin and -1 = DATEDIFF(day, NgayDat,getdate()) and KhachHang.MaKH = ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		cmd.setInt(1, maKH);
		ResultSet r = cmd.executeQuery();
		
		while(r.next()){
			
			 String tenVacxin=r.getString("TenVacxin");
			 String tenKH = r.getString("TenKH");
			 Date ngayDat=r.getDate("NgayDat");
			 int trangThai =r.getInt("TrangThai");
			 LichDatTiem user = new LichDatTiem(ngayDat, trangThai, maKH,tenKH, tenVacxin);
			
			 list.add(user);
			
		}
		r.close();
		cn.close();
		return list;
	}
}
