package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import Model.Bean.LoaiVacxin;
public class LoaiVacxinDAO {

	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;
	
	public void KetNoi()throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}
	
	ArrayList<LoaiVacxin> ds  = new ArrayList<LoaiVacxin>();
	public ArrayList<LoaiVacxin> getLoaiVacxin() throws Exception{
		KetNoi();
		/*String sql ="select * from LoaiVacxin";
		PreparedStatement cmd = cn.prepareStatement(sql);
		ResultSet rs= cmd.executeQuery();
		while(rs.next()){
			int maLoaiVacxin =rs.getInt("MaLoaiVacxin");
			String tenLoaiVacxin =rs.getString("TenLoaiVacxin");
			LoaiVacxin lv = new LoaiVacxin(maLoaiVacxin, tenLoaiVacxin);
			System.out.println("aaaaa");
			ds.add(lv);	
			
		}
		rs.close();
		cmd.close();
		return ds;*/
		
		ArrayList<LoaiVacxin> listLoaiVacxin = new ArrayList<LoaiVacxin>();
		String query = "SELECT * FROM LoaiVacxin order by MaLoaiVacxin DESC";
		
		try {
			PreparedStatement ps = cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				int maLoai = rs.getInt("MaLoaiVacxin");
				String tenLoai = rs.getString("TenLoaiVacxin");
				LoaiVacxin loaiVacxin = new LoaiVacxin();
				loaiVacxin.setMaLoaiVacxin(maLoai);
				loaiVacxin.setTenLoaiVacxin(tenLoai);
				listLoaiVacxin.add(loaiVacxin);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return listLoaiVacxin;
	}
	
	public int themLoaiVacxin(String tenLoaiVacxin) throws Exception{
		KetNoi();
		String query = "INSERT INTO LoaiVacxin(TenLoaiVacxin) VALUES(?)";
		PreparedStatement ps = cn.prepareStatement(query);
		
		ps.setString(1, tenLoaiVacxin);
		
		return ps.executeUpdate();
		
	}
	
	public int suaLoaiVacxin(String tenLoaiVacxin, int maLoaiVacxin) throws Exception{
		KetNoi();
		String query = "UPDATE LoaiVacxin SET TenLoaiVacxin = ? WHERE MaLoaiVacxin = ?";
		PreparedStatement ps = cn.prepareStatement(query);
		
		ps.setString(1,tenLoaiVacxin);
		ps.setInt(2, maLoaiVacxin);
		
		return ps.executeUpdate();
	}
	
	public int xoaLoaiVacxin(int maLoaiVacxin) throws Exception{
		KetNoi();
		String query = "DELETE FROM LoaiVacxin WHERE MaLoaiVacxin = ?";
		
		PreparedStatement ps = cn.prepareStatement(query);
		
		ps.setInt(1,maLoaiVacxin);
		
		return ps.executeUpdate();
	}
	
	public LoaiVacxin getLoaiVacxin(int maLoaiVacxin) throws Exception{
		KetNoi();
		String query = "SELECT * FROM LoaiVacxin  WHERE MaLoaiVacxin = ? ";
		PreparedStatement ps = cn.prepareStatement(query);
		
		ps.setInt(1,maLoaiVacxin);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String tenLoaiVacxin = rs.getString("TenLoaiVacxin");
			LoaiVacxin loaiVacxin = new LoaiVacxin();
			loaiVacxin.setMaLoaiVacxin(maLoaiVacxin);
			loaiVacxin.setTenLoaiVacxin(tenLoaiVacxin);
			return loaiVacxin;
		}
		return null;
	}
	
	public ArrayList<LoaiVacxin> timKiemLoaiVacxin(String tuKhoa) throws Exception{
		KetNoi();
		String query = "SELECT * FROM LoaiVacxin   WHERE  TenLoaiVacxin LIKE ? order by MaLoaiVacxin DESC";
		ArrayList<LoaiVacxin> listLoaiVacxin = new ArrayList<LoaiVacxin>();
		PreparedStatement ps = cn.prepareStatement(query);
		
		ps.setNString(1,"%" + tuKhoa + "%");
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			String tenLoaiVacxin = rs.getString("TenLoaiVacxin");
			int maLoaiVacxin = rs.getInt("MaLoaiVacxin");
			LoaiVacxin loaiVacxin = new LoaiVacxin();
			loaiVacxin.setMaLoaiVacxin(maLoaiVacxin);
			loaiVacxin.setTenLoaiVacxin(tenLoaiVacxin);
			
			listLoaiVacxin.add(loaiVacxin);
		}
		return listLoaiVacxin;
		
	}
	public boolean isExist(String tenLoaiVacxin) throws Exception{
		KetNoi();
		String query = "SELECT * from LoaiVacxin";
		PreparedStatement ps = cn.prepareStatement(query);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			if(tenLoaiVacxin == rs.getString("TenLoaiVacxin"))
				return true;
		}
		return false;
	}
}
