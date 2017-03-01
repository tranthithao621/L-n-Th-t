package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Model.Bean.KhachHang;

public class KhachHangDAO {
	
	Connection cn = null;
	public Connection getConection () throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        cn= DriverManager.getConnection("jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT;user=sa;password=12345678");
        return cn;
	}
	public ArrayList<KhachHang> getKhachHang()throws Exception{
		getConection();
		ArrayList<KhachHang > list = new ArrayList<KhachHang>();
		String sql = "select * from KhachHang";
		PreparedStatement statement = cn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while(rs.next()){
			int maKH = rs.getInt("MaKH");
			String tenKH = rs.getString("TenKH");
			int tuoi = rs.getInt("Tuoi");
			boolean gioiTinh = rs.getBoolean("GioiTinh");
			String email = rs.getString("Email");
			String soDT = rs.getString("SoDT");
			String diaChi = rs.getString("DiaChi");
			KhachHang kh = new KhachHang(maKH,tenKH, tuoi, gioiTinh, soDT, diaChi, email);
			list.add(kh);
		}
		rs.close();
		cn.close();
		return list;
	}
	
	public KhachHang getKhachHang(int maKH)throws Exception{
		getConection();
		KhachHang kh = null;
		String sql = "select *from KhachHang where MaKH="+maKH+"";
		PreparedStatement statement = cn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while(rs.next()){
			int maKH1 = rs.getInt("MaKH");
			String tenKH = rs.getString("TenKH");
			int tuoi = rs.getInt("Tuoi");
			boolean gioiTinh = rs.getBoolean("GioiTinh");
			String soDT = rs.getString("SoDT");
			String diaChi = rs.getString("DiaChi");
			String email = rs.getString("Email");
			kh =new KhachHang(maKH1, tenKH, tuoi, gioiTinh, soDT, diaChi, email);
		}
		rs.close();
		cn.close();
		
		return kh;
	}
	
	public int themKhachHang(String tenKH, int tuoi, boolean gioiTinh,String soDT, String diaChi, String email) throws Exception{
		getConection();
		String sql = "insert into Khachhang values (?,?,?,?,?,?,?)";
		PreparedStatement statement = cn.prepareStatement(sql);
		statement.setString(1, tenKH);
		statement.setInt(2, tuoi);
		statement.setBoolean(6, gioiTinh);
		statement.setString(5, soDT);
		statement.setString(4, diaChi);
		statement.setString(3, email);
		statement.setString(7, "");
		return statement.executeUpdate();
		
	}
	public int suaKhachHang(int maKH ,String tenKH, int tuoi, boolean gioiTinh,String soDT, String diaChi, String email) throws Exception{
		getConection();
		String sql = "update KhachHang set TenKH =N'"+tenKH+"', Tuoi = ?, GioiTinh =?, SoDT=?, DiaChi=?, Email=? where MaKH=?";
		
		PreparedStatement statement = cn.prepareStatement(sql);

		statement.setInt(1, tuoi);
		statement.setBoolean(2, gioiTinh);
		statement.setString(3, soDT);
		statement.setString(4, diaChi);
		statement.setString(5, email);
		statement.setInt(6, maKH);
		return statement.executeUpdate();
	}
	
	public int xoaKhachHang(String maKH)throws Exception{
		getConection();
		String sql ="delete from KhachHang where MaKH = ?";
		PreparedStatement statement = cn.prepareStatement(sql);
		statement.setString(1, maKH);
		return statement.executeUpdate();
	}
	
	public ArrayList<KhachHang> timKiemKhachHang(String tenKH)throws Exception{
		getConection();
		String sql ="select * from KhachHang where TenKH like N'%"+tenKH+"%'";
		ArrayList<KhachHang > list = new ArrayList<KhachHang>();
		PreparedStatement statement = cn.prepareStatement(sql);
		ResultSet rs = statement.executeQuery();
		while(rs.next()){
			int maKH = rs.getInt("MaKH");
			String tenKH1 = rs.getString("TenKH");
			int tuoi = rs.getInt("Tuoi");
			boolean gioiTinh = rs.getBoolean("GioiTinh");
			String email = rs.getString("Email");
			String soDT = rs.getString("SoDT");
			String diaChi = rs.getString("DiaChi");
			KhachHang kh = new KhachHang(maKH,tenKH1, tuoi, gioiTinh, soDT, diaChi, email);
			list.add(kh);
		}
		rs.close();
		cn.close();
		return list;
	}
	
	public KhachHang getKhachHangTheoMa(String tuKhoa) throws Exception{
		//Ket noi
		getConection();
		String sql= "SELECT * FROM KhachHang WHERE MaKH LIKE '"+tuKhoa+"'";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r = cmd.executeQuery();
		r.next();
		int maKH=r.getInt("MaKH"); 
		String tenKH=r.getString("TenKH");
		int tuoi =r.getInt("Tuoi");
		boolean  gioiTinh=r.getBoolean("GioiTinh");
		String diaChi=r.getString("DiaChi");
		String sodt=r.getString("Sodt");
		String email=r.getString("Email");
		KhachHang qltc =new KhachHang(maKH, tenKH, tuoi, gioiTinh, sodt, diaChi, email);
		r.close();
		cn.close();
		return qltc;
		
	}
	public int MaxLanTiem(int makhachhang, int mavacxin)throws Exception{
		getConection();
		String sql="select a=mAX(LanTiem) from LichSuTiemPhong  where MaKH='"+makhachhang+"'and MaVacxin='"+mavacxin+"'";
		PreparedStatement cmd=cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		int a= 0;
		if(rs.next()){
			a = rs.getInt("a");
			
		}
		rs.close();
		return a+1;
	}
	
	public int layMaKhachHang(String tenKhachHang)throws Exception{
		getConection();
		String sql="select Makh from KhachHang  where TenKH=N'"+tenKhachHang+"'";
		PreparedStatement cmd=cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		int a= 0;
		if(rs.next()){
			a= rs.getInt("MaKH");
		}
		rs.close();
		return a;
		
	}
	
	public ArrayList<KhachHang> timKiemKhachHang1(String tenkhachhang)throws Exception{
		getConection();
		String sql = "select * from KhachHang where TenKH like N'%"+tenkhachhang+"%'";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet r  = cmd.executeQuery();
		ArrayList<KhachHang >ds= new ArrayList<KhachHang>();
		while(r.next()){
			int maKH=r.getInt("MaKH"); 
			String tenKH=r.getString("TenKH");
			int tuoi =r.getInt("Tuoi");
			boolean gioiTinh=r.getBoolean("GioiTinh");
			String diaChi=r.getString("DiaChi");
			String sodt=r.getString("Sodt");
			String email=r.getString("Email");
			 KhachHang kh = new KhachHang(maKH, tenKH, tuoi, gioiTinh, sodt, diaChi, email);
			 ds.add(kh);	
		}
		r.close();
		cn.close();
		return ds;

	}


}
