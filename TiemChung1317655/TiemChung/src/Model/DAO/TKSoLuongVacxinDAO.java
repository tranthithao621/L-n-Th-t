package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Bean.CTVacxin;
import Model.Bean.TKSoLuongVacxin;

public class TKSoLuongVacxinDAO {
	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
	}


	
	public ArrayList<TKSoLuongVacxin> getByDay(String ngay) throws Exception{
		KetNoi();
		String query="select * from TK_SoLuongVacxinTheoNgay where NgayDat = ?";
		PreparedStatement statement= cn.prepareStatement(query);
		statement.setObject(1, ngay);
		ResultSet rs = statement.executeQuery();
		ArrayList<TKSoLuongVacxin> ds = new ArrayList<TKSoLuongVacxin>();
		while(rs.next()){
			int maVacxin = rs.getInt("MaVacxin");
			int soLuong = rs.getInt("SoLuong");
			String tenVacxin = rs.getString("TenVacxin");
			String ngayDat = rs.getString("NgayDat");
			
			TKSoLuongVacxin tk  = new TKSoLuongVacxin();
			
			tk.setMaVacxin(maVacxin);
			tk.setNgay(ngayDat);
			tk.setTenVacxin(tenVacxin);
			tk.setSoLuong(soLuong);
			
			ds.add(tk);
			
		}
		
		return ds;
	}
}
