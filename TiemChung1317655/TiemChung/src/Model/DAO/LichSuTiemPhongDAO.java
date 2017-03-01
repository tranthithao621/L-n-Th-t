package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.LichSuTiemPhong;

public class LichSuTiemPhongDAO {

	Connection cn;

	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}

	public ArrayList<LichSuTiemPhong> getLichSu(String n1, String n2) throws Exception {

		KetNoi();
		String sql = "SELECT KhachHang.MaKH, KhachHang.TenKH, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, LichSuTiemPhong.NgayTaiTiem, dbo.CTVacXin.GiaBan, LichSuTiemPhong.LanTiem FROM LichSuTiemPhong INNER JOIN KhachHang ON LichSuTiemPhong.MaKH = KhachHang.MaKH INNER JOIN Vacxin ON LichSuTiemPhong.MaVacxin = Vacxin.MaVacxin INNER JOIN  CTVacXin ON dbo.Vacxin.MaVacxin = CTVacXin.MaVacxin GROUP BY KhachHang.MaKH, KhachHang.TenKH, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, LichSuTiemPhong.NgayTaiTiem, CTVacXin.GiaBan,dbo.LichSuTiemPhong.LanTiem HAVING (LichSuTiemPhong.NgayTiem > CONVERT(DATETIME, ?, 102) AND LichSuTiemPhong.NgayTiem < CONVERT(DATETIME,?, 102))";
		PreparedStatement cmd = cn.prepareStatement(sql);
		cmd.setString(1, n1);
		cmd.setString(2, n2);

		ResultSet r = cmd.executeQuery();
		ArrayList<LichSuTiemPhong> ds = new ArrayList<LichSuTiemPhong>();
		while (r.next()) {
			String maKH = r.getString("MaKH");
			String tenKH = r.getString("TenKH");
			String tenVacxin = r.getString("TenVacxin");
			Date ngayTiem = r.getDate("NgayTiem");
			Date ngayTaiTiem = r.getDate("NgayTaiTiem");
			int giaBan = r.getInt("GiaBan");
			int lanTiem = r.getInt("LanTiem");

			LichSuTiemPhong lstp = new LichSuTiemPhong(maKH, tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
			ds.add(lstp);
		}
		r.close();
		cn.close();
		return ds;
	}
public ArrayList<LichSuTiemPhong> getLichSu() throws Exception{
		
		KetNoi();
		String sql= "SELECT        dbo.LichSuTiemPhong.MaKH, dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.LichSuTiemPhong.NgayTiem, dbo.LichSuTiemPhong.NgayTaiTiem,  dbo.LichSuTiemPhong.GiaBan, dbo.LichSuTiemPhong.LanTiem FROM            dbo.KhachHang INNER JOIN dbo.LichSuTiemPhong ON dbo.KhachHang.MaKH = dbo.LichSuTiemPhong.MaKH INNER JOIN dbo.Vacxin ON dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<LichSuTiemPhong>ds= new ArrayList<LichSuTiemPhong>();
		while(r.next()){
			int maKH=r.getInt("MaKH"); 
			String tenKH=r.getString("TenKH");
			String tenVacxin=r.getString("TenVacxin");
			 Date ngayTiem=r.getDate("NgayTiem"); 
			 Date ngayTaiTiem=r.getDate("NgayTaiTiem");
			 int giaBan =r.getInt("GiaBan");
			 int lanTiem =r.getInt("LanTiem");
			
			 
			 LichSuTiemPhong lstp = new LichSuTiemPhong(String.valueOf(maKH), tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
			 ds.add(lstp);	
		}
		r.close();
		cn.close();
		return ds;
	}
	/*public ArrayList<LichSuTiemPhong> getLichSu() throws Exception {

		KetNoi();
		String sql = "select * from View_1";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		ArrayList<LichSuTiemPhong> ds = new ArrayList<LichSuTiemPhong>();
		while (r.next()) {
			String maKH = r.getString("MaKH");
			String tenKH = r.getString("TenKH");
			String tenVacxin = r.getString("TenVacxin");
			Date ngayTiem = r.getDate("NgayTiem");
			Date ngayTaiTiem = r.getDate("NgayTaiTiem");
			int giaBan = r.getInt("GiaBan");
			int lanTiem = r.getInt("LanTiem");

			LichSuTiemPhong lstp = new LichSuTiemPhong(maKH, tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
			ds.add(lstp);
		}
		r.close();
		cn.close();
		return ds;
	}
*/
	public int AddLichSuTiemPhong(int makh, int mavacxin, String ngaytaitiem, int lantiem, int giaban,
			String ghichu) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		KetNoi();
		String sql = "insert into LichSuTiemPhong (MaKH,MaVacxin,NgayTiem,NgayTaiTiem,LanTiem,GiaBan,GhiChu) values('"
				+ makh + "','" + mavacxin + "',GETDATE(),'"
				+ new java.sql.Date(sdf.parse(ngaytaitiem).getTime()) + "','" + lantiem + "','" + giaban + "',N'"
				+ ghichu + "')";
		PreparedStatement cmd = cn.prepareStatement(sql);
		return cmd.executeUpdate();

	}
	public ArrayList<LichSuTiemPhong> timKiemTheoTenKH(String tuKhoa) throws Exception{
		KetNoi();
		String sql= "SELECT dbo.LichSuTiemPhong.MaKH, dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, " +
				"dbo.LichSuTiemPhong.NgayTiem, dbo.LichSuTiemPhong.NgayTaiTiem,  dbo.LichSuTiemPhong.GiaBan, " +
				"dbo.LichSuTiemPhong.LanTiem FROM dbo.KhachHang INNER JOIN dbo.LichSuTiemPhong ON " +
				"dbo.KhachHang.MaKH = dbo.LichSuTiemPhong.MaKH INNER JOIN dbo.Vacxin ON " +
				"dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin where KhachHang.TenKH LIKE ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		
		cmd.setString(1,"%" + tuKhoa + "%");
		ResultSet r = cmd.executeQuery();
		ArrayList<LichSuTiemPhong>ds= new ArrayList<LichSuTiemPhong>();
		while(r.next()){
			int maKH=r.getInt("MaKH"); 
			String tenKH=r.getString("TenKH");
			String tenVacxin=r.getString("TenVacxin");
			 Date ngayTiem=r.getDate("NgayTiem"); 
			 Date ngayTaiTiem=r.getDate("NgayTaiTiem");
			 int giaBan =r.getInt("GiaBan");
			 int lanTiem =r.getInt("LanTiem");		 
			 LichSuTiemPhong lstp = new LichSuTiemPhong(String.valueOf(maKH), tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
			 ds.add(lstp);	
		}
		r.close();
		cn.close();
		return ds;
	}
	
		public ArrayList<LichSuTiemPhong> timKiemTheoNgay(String n1, String n2) throws Exception{
		
			
			KetNoi();
			String sql= "SELECT KhachHang.MaKH, KhachHang.TenKH, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, LichSuTiemPhong.NgayTaiTiem, dbo.CTVacXin.GiaBan, LichSuTiemPhong.LanTiem FROM LichSuTiemPhong INNER JOIN KhachHang ON LichSuTiemPhong.MaKH = KhachHang.MaKH INNER JOIN Vacxin ON LichSuTiemPhong.MaVacxin = Vacxin.MaVacxin INNER JOIN  CTVacXin ON dbo.Vacxin.MaVacxin = CTVacXin.MaVacxin GROUP BY KhachHang.MaKH, KhachHang.TenKH, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, LichSuTiemPhong.NgayTaiTiem, CTVacXin.GiaBan,dbo.LichSuTiemPhong.LanTiem HAVING (LichSuTiemPhong.NgayTiem >= CONVERT(DATETIME, ?, 102) AND LichSuTiemPhong.NgayTiem <= CONVERT(DATETIME,?, 102))";
			PreparedStatement cmd = cn.prepareStatement(sql);
			cmd.setString(1, n1);
			cmd.setString(2, n2);
			
			ResultSet r = cmd.executeQuery();
			ArrayList<LichSuTiemPhong>ds= new ArrayList<LichSuTiemPhong>();
			while(r.next()){
				int maKH=r.getInt("MaKH"); 
				String tenKH=r.getString("TenKH");
				String tenVacxin=r.getString("TenVacxin");
				 Date ngayTiem=r.getDate("NgayTiem"); 
				 Date ngayTaiTiem=r.getDate("NgayTaiTiem");
				 int giaBan =r.getInt("GiaBan");
				 int lanTiem =r.getInt("LanTiem");
				
				 
				 LichSuTiemPhong lstp = new LichSuTiemPhong(String.valueOf(maKH), tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
				 ds.add(lstp);	
		}
		r.close();
		cn.close();
		return ds;
			
	}
	public ArrayList<LichSuTiemPhong> getTheoMaKH(int maKH) throws Exception{
			KetNoi();
			String sql= "SELECT        dbo.LichSuTiemPhong.MaKH, dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.LichSuTiemPhong.NgayTiem, dbo.LichSuTiemPhong.NgayTaiTiem,  dbo.LichSuTiemPhong.GiaBan, dbo.LichSuTiemPhong.LanTiem FROM            dbo.KhachHang INNER JOIN dbo.LichSuTiemPhong ON dbo.KhachHang.MaKH = dbo.LichSuTiemPhong.MaKH INNER JOIN dbo.Vacxin ON dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin where KhachHang.MaKH = ?";
			
			PreparedStatement cmd = cn.prepareStatement(sql);
			
			cmd.setInt(1,maKH);
			ResultSet r = cmd.executeQuery();
			ArrayList<LichSuTiemPhong>ds= new ArrayList<LichSuTiemPhong>();
			while(r.next()){
				String tenKH=r.getString("TenKH");
				String tenVacxin=r.getString("TenVacxin");
				 Date ngayTiem=r.getDate("NgayTiem"); 
				 Date ngayTaiTiem=r.getDate("NgayTaiTiem");
				 int giaBan =r.getInt("GiaBan");
				 int lanTiem =r.getInt("LanTiem");
				
				 
				 LichSuTiemPhong lstp = new LichSuTiemPhong(String.valueOf(maKH), tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
				 ds.add(lstp);	
			}
			r.close();
			cn.close();
			return ds;
		}
	
	public ArrayList<LichSuTiemPhong> timKiemVacxinTheoMaKH(int maKH,String tuKhoa) throws Exception{
		KetNoi();
		String sql= "SELECT        dbo.LichSuTiemPhong.MaKH, dbo.KhachHang.TenKH, dbo.Vacxin.TenVacxin, dbo.LichSuTiemPhong.NgayTiem, dbo.LichSuTiemPhong.NgayTaiTiem,  dbo.LichSuTiemPhong.GiaBan, dbo.LichSuTiemPhong.LanTiem FROM            dbo.KhachHang INNER JOIN dbo.LichSuTiemPhong ON dbo.KhachHang.MaKH = dbo.LichSuTiemPhong.MaKH INNER JOIN dbo.Vacxin ON dbo.LichSuTiemPhong.MaVacxin = dbo.Vacxin.MaVacxin where KhachHang.MaKH = ? and dbo.Vacxin.TenVacxin LIKE ?";
		
		PreparedStatement cmd = cn.prepareStatement(sql);
		
		cmd.setInt(1,maKH);
		cmd.setNString(2, "%" + tuKhoa + "%");
		ResultSet r = cmd.executeQuery();
		ArrayList<LichSuTiemPhong>ds= new ArrayList<LichSuTiemPhong>();
		while(r.next()){
			String tenKH=r.getString("TenKH");
			String tenVacxin=r.getString("TenVacxin");
			 Date ngayTiem=r.getDate("NgayTiem"); 
			 Date ngayTaiTiem=r.getDate("NgayTaiTiem");
			 int giaBan =r.getInt("GiaBan");
			 int lanTiem =r.getInt("LanTiem");
			
			 
			 LichSuTiemPhong lstp = new LichSuTiemPhong(String.valueOf(maKH), tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
			 ds.add(lstp);	
		}
		r.close();
		cn.close();
		return ds;
	}
	
	public ArrayList<LichSuTiemPhong> timKiemTheoNgay(int maKH,String n1, String n2) throws Exception{
		
		
		KetNoi();
		String sql= "SELECT KhachHang.MaKH, KhachHang.TenKH, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, LichSuTiemPhong.NgayTaiTiem, dbo.CTVacXin.GiaBan, LichSuTiemPhong.LanTiem FROM LichSuTiemPhong INNER JOIN KhachHang ON LichSuTiemPhong.MaKH = KhachHang.MaKH INNER JOIN Vacxin ON LichSuTiemPhong.MaVacxin = Vacxin.MaVacxin INNER JOIN  CTVacXin ON dbo.Vacxin.MaVacxin = CTVacXin.MaVacxin GROUP BY KhachHang.MaKH, KhachHang.TenKH, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, LichSuTiemPhong.NgayTaiTiem, CTVacXin.GiaBan,dbo.LichSuTiemPhong.LanTiem HAVING (LichSuTiemPhong.NgayTiem >= CONVERT(DATETIME, ?, 102) AND LichSuTiemPhong.NgayTiem <= CONVERT(DATETIME,?, 102)) AND KhachHang.MaKH = ?";
		PreparedStatement cmd = cn.prepareStatement(sql);
		cmd.setObject(1, n1);
		cmd.setObject(2, n2);
		cmd.setInt(3, maKH);
		
		ResultSet r = cmd.executeQuery();
		ArrayList<LichSuTiemPhong>ds= new ArrayList<LichSuTiemPhong>();
		while(r.next()){ 
			String tenKH=r.getString("TenKH");
			String tenVacxin=r.getString("TenVacxin");
			 Date ngayTiem=r.getDate("NgayTiem"); 
			 Date ngayTaiTiem=r.getDate("NgayTaiTiem");
			 int giaBan =r.getInt("GiaBan");
			 int lanTiem =r.getInt("LanTiem");
			
			 
			 LichSuTiemPhong lstp = new LichSuTiemPhong(String.valueOf(maKH), tenKH, tenVacxin, ngayTiem, ngayTaiTiem, giaBan, lanTiem);
			 ds.add(lstp);	
	}
	r.close();
	cn.close();
	return ds;
		
}
}
