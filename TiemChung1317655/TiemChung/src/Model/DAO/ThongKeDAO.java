package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.ThongKe;
import Model.Bean.thongkebean;
import Model.Bean.tonkhobean;

public class ThongKeDAO {
	static String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	static String userName = "sa";
	static String password = "12345678";
	static Connection cn;
	static PreparedStatement cmd;

	public static  void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}
	
	public static ArrayList<ThongKe> get(String dk) throws Exception{
		KetNoi();
		String sql = "select * from TK_VacxinDaTiem order by SoLuong " + dk;
		cmd = cn.prepareStatement(sql);

		ResultSet rs = cmd.executeQuery();
		
		ArrayList<ThongKe> list = new ArrayList<ThongKe>();
		
		while(rs.next()){
			int maVacxin = rs.getInt("MaVacxin");
			String tenVacxin = rs.getString("TenVacxin");
			int soLuong = rs.getInt("SoLuong");
			
			ThongKe tk = new ThongKe();
			tk.setMaVacxin(maVacxin);
			tk.setTenVacxin(tenVacxin);
			tk.setSoLuong(soLuong);
			
			list.add(tk);
		}
		return list;
	}
	public static ArrayList<ThongKe> search(String tuKhoa) throws Exception{
		KetNoi();
		String sql = "select * from TK_VacxinDaTiem where TenVacxin LIKE ? order by SoLuong DESC";
		cmd = cn.prepareStatement(sql);
		cmd.setNString(1, "%" +tuKhoa +"%");
		ResultSet rs = cmd.executeQuery();
		
		ArrayList<ThongKe> list = new ArrayList<ThongKe>();
		
		while(rs.next()){
			int maVacxin = rs.getInt("MaVacxin");
			String tenVacxin = rs.getString("TenVacxin");
			int soLuong = rs.getInt("SoLuong");
			
			ThongKe tk = new ThongKe();
			tk.setMaVacxin(maVacxin);
			tk.setTenVacxin(tenVacxin);
			tk.setSoLuong(soLuong);
			
			list.add(tk);
		}
		return list;
	}
	public static  ArrayList<thongkebean> getthongke(String n1,String n2) throws Exception
	{
		KetNoi();
		String sql="SELECT Vacxin.MaVacxin, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem, COUNT(LichSuTiemPhong.MaVacxin) AS soluong FROM LichSuTiemPhong INNER JOIN Vacxin ON LichSuTiemPhong.MaVacxin = Vacxin.MaVacxin GROUP BY Vacxin.MaVacxin, Vacxin.TenVacxin, LichSuTiemPhong.NgayTiem HAVING (LichSuTiemPhong.NgayTiem >= CONVERT(DATETIME, ?, 102) AND LichSuTiemPhong.NgayTiem <= CONVERT(DATETIME, ?, 102))";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		statement.setString(1, n1);
		statement.setString(2, n2);
		
		ResultSet r= statement.executeQuery();
		ArrayList<thongkebean> dslk= new ArrayList<thongkebean>();
		while (r.next()){
			String mavc=r.getString("MaVacxin");
			String tenvc=r.getString("TenVacxin");
			Date ngaytiem=r.getDate("NgayTiem");
			int soluong=r.getInt("soluong");
			thongkebean k= new thongkebean(mavc, tenvc, ngaytiem, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	public static ArrayList<thongkebean > getthongke1(String n1,String n2) throws Exception
	{
		KetNoi();
		String sql="SELECT View_3_1.MaVacxin, View_3_1.TenVacxin, View_3_1.NgayTiem, CTVacXin.SoLuong - View_3_1.soluong AS slconlai FROM CTVacXin INNER JOIN  View_3 AS View_3_1 ON CTVacXin.MaVacxin = View_3_1.MaVacxin WHERE(View_3_1.NgayTiem >= CONVERT(DATETIME, ?, 102) AND View_3_1.NgayTiem <= CONVERT(DATETIME, ?, 102))";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		statement.setString(1, n1);
		statement.setString(2, n2);
		
		ResultSet r= statement.executeQuery();
		ArrayList<thongkebean> dslk= new ArrayList<thongkebean>();
		while (r.next()){
			String mavc=r.getString(1);
			String tenvc=r.getString(2);
			Date ngaytiem=r.getDate(3);
			int soluong=r.getInt(4);
			thongkebean k= new thongkebean(mavc, tenvc, ngaytiem, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	public  static ArrayList<tonkhobean > getthongke3() throws Exception
	{
		KetNoi();
		String sql="select View_5.MaVacxin,View_5.TenVacxin, View_2.sl -View_5.soluong as slconlai  from View_2, View_5 where View_2.MaVacxin=View_5.MaVacxin";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		ResultSet r= statement.executeQuery();
		ArrayList<tonkhobean> dslk= new ArrayList<tonkhobean>();
		while (r.next()){
			String mavc=r.getString(1);
			String tenvc=r.getString(2);
			int soluong=r.getInt(3);
			tonkhobean k= new tonkhobean(mavc, tenvc, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	public static ArrayList<thongkebean > getthongke2() throws Exception
	{
		KetNoi();
		String sql="SELECT Vacxin.MaVacxin, Vacxin.TenVacxin, CTVacXin.HanSuDung, CTVacXin.SoLuong FROM CTVacXin INNER JOIN Vacxin ON CTVacXin.MaVacxin = dbo.Vacxin.MaVacxin where HanSuDung<=getdate()";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		ResultSet r= statement.executeQuery();
		ArrayList<thongkebean> dslk= new ArrayList<thongkebean>();
		while (r.next()){
			String mavc=r.getString(1);
			String tenvc=r.getString(2);
			Date ngaytiem=r.getDate(3);
			int soluong=r.getInt(4);
			thongkebean k= new thongkebean(mavc, tenvc, ngaytiem, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	public static ArrayList<thongkebean > getthongkehh() throws Exception
	{
		KetNoi();
		String sql="select *from View_1";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		ResultSet r= statement.executeQuery();
		ArrayList<thongkebean> dslk= new ArrayList<thongkebean>();
		while (r.next()){
			String mavc=r.getString(1);
			String tenvc=r.getString(2);
			Date ngaytiem=r.getDate(3);
			int soluong=r.getInt(4);
			thongkebean k= new thongkebean(mavc, tenvc, ngaytiem, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	public static ArrayList<thongkebean > getthongke() throws Exception
	{
		KetNoi();
		String sql="select * from View_3";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		ResultSet r= statement.executeQuery();
		ArrayList<thongkebean> dslk= new ArrayList<thongkebean>();
		while (r.next()){
			String mavc=r.getString("MaVacxin");
			String tenvc=r.getString("TenVacxin");
			Date ngaytiem=r.getDate("NgayTiem");
			int soluong=r.getInt("soluong");
			thongkebean k= new thongkebean(mavc, tenvc, ngaytiem, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	public static ArrayList<thongkebean > getthongke1() throws Exception
	{
		KetNoi();
		String sql="select * from View_3";
		PreparedStatement statement= cn.prepareStatement(sql);
		
		ResultSet r= statement.executeQuery();
		ArrayList<thongkebean> dslk= new ArrayList<thongkebean>();
		while (r.next()){
			String mavc=r.getString("MaVacxin");
			String tenvc=r.getString("TenVacxin");
			Date ngaytiem=r.getDate("NgayTiem");
			int soluong=r.getInt("soluong");
			thongkebean k= new thongkebean(mavc, tenvc, ngaytiem, soluong);
			dslk.add(k);
		}
		return dslk;
	}
	

	
}
