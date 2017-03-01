package Model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import Model.Bean.CTVacxin;

public class CTVacxinDAO {

	String url = "jdbc:sqlserver://SNAIL\\SQLEXPRESS:1433;databaseName=FPT";
	String userName = "sa";
	String password = "12345678";
	Connection cn;

	public void KetNoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection(url, userName, password);
		System.out.println("Ket noi thanh cong");
	}

	ArrayList<CTVacxin> ds = new ArrayList<CTVacxin>();
	PreparedStatement cmd;

	public ArrayList<CTVacxin> getCTVacxin() throws Exception {
		KetNoi();
		String sql = "select CTVacxin.*,Vacxin.TenVacxin from CTVacxin,Vacxin where CTVacxin.MaVacxin = Vacxin.MaVacxin order by MaLoNhap DESC ";
		cmd = cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();

		while (rs.next()) {

			int maVacxin = rs.getInt("MaVacxin");
			Date hanSuDung = rs.getDate("HanSuDung");
			int giaBan = rs.getInt("GiaBan");
			int maLoNhap = rs.getInt("MaLoNhap");
			int soLuong = rs.getInt("SoLuong");
			String xuatXu = rs.getString("XuatXu");
			String tenVacxin = rs.getString("TenVacxin");
			CTVacxin ctv = new CTVacxin(maLoNhap, xuatXu, hanSuDung, giaBan, soLuong, maVacxin);
			ctv.setTenVacxin(tenVacxin);
			ds.add(ctv);

		}
		rs.close();
		cmd.close();
		return ds;
	}

	public int addCTVacxin(int mavacxin, String hansudung, int giaban, String xuatxu, int soluong) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		KetNoi();
		String sql = "insert into CTVacxin (MaVacxin,HanSuDung,GiaBan,XuatXu,SoLuong,SoLuongConLai) " + "values (?,?,?,?,?,?)";
		cmd = cn.prepareStatement(sql);
		cmd.setInt(1, mavacxin);
		cmd.setDate(2, new java.sql.Date(sdf.parse(hansudung).getTime()));
		cmd.setInt(3, giaban);
		cmd.setString(4, xuatxu);
		cmd.setInt(5, soluong);
		cmd.setInt(6, soluong);

		return cmd.executeUpdate();
	}

	public int deleteCTVacxin(int mactvacxin) throws Exception {
		KetNoi();
		String sql = "delete CTVacxin where MaLoNhap='" + mactvacxin + "'";
		cmd = cn.prepareStatement(sql);
		return cmd.executeUpdate();

	}

	public ArrayList<CTVacxin> timKiemXuatXu(String xuatxu) throws Exception {
		KetNoi();
		String sql = "select CTVacxin.*,Vacxin.TenVacxin from CTVacxin,Vacxin where CTVacxin.MaVacxin = Vacxin.MaVacxin and Vacxin.TenVacxin like N'%" + xuatxu + "%' ";
		cmd = cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {

			int maVacxin = rs.getInt("MaVacxin");
			Date hanSuDung = rs.getDate("HanSuDung");
			int giaBan = rs.getInt("GiaBan");
			int maLoNhap = rs.getInt("MaLoNhap");
			int soLuong = rs.getInt("SoLuong");
			String xuatXu = rs.getNString("XuatXu");
			String tenVacxin = rs.getString("TenVacxin");
			CTVacxin ctv = new CTVacxin(maLoNhap, xuatXu, hanSuDung, giaBan, soLuong, maVacxin);
			ctv.setTenVacxin(tenVacxin);
			ds.add(ctv);
		}
		rs.close();
		cmd.close();
		return ds;
	}

	public CTVacxin get1CTVacxin(int malonhap) throws Exception {
		KetNoi();
		String sql = "select * from CTVacxin where MaLoNhap ='" + malonhap + "'";
		cmd = cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		CTVacxin ctv = null;
		if (rs.next()) {

			int maVacxin = rs.getInt("MaVacxin");
			Date hanSuDung = rs.getDate("HanSuDung");
			int giaBan = rs.getInt("GiaBan");
			int maLoNhap = rs.getInt("MaLoNhap");
			int soLuong = rs.getInt("SoLuong");
			String xuatXu = rs.getNString("XuatXu");
			ctv = new CTVacxin(maLoNhap, xuatXu, hanSuDung, giaBan, soLuong, maVacxin);
		}
		rs.close();
		cmd.close();
		return ctv;
	}

	public int EditCTVacxin(String xuatxu, int malonhap, String hansudung, int giaban, int soluong) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		KetNoi();
		String sql = "update CTVacxin set XuatXu = N'" + xuatxu + "',HanSuDung='"
				+ new java.sql.Date(sdf.parse(hansudung).getTime()) + "',GiaBan='" + giaban + "'," + "Soluong='"
				+ soluong + "'where MaLoNhap='" + malonhap + "'";

		cmd = cn.prepareStatement(sql);
		return cmd.executeUpdate();
	}

	public ArrayList<CTVacxin> getThongTin(int mavacxin) throws Exception {
		KetNoi();
		String sql = "select * from CTVacxin where MaVacxin ='" + mavacxin + "' and HanSuDung>=GETDATE()-1 and soluong> 0";
		cmd = cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			int maVacxin = rs.getInt("MaVacxin");
			Date hanSuDung = rs.getDate("HanSuDung");
			int giaBan = rs.getInt("GiaBan");
			int maLoNhap = rs.getInt("MaLoNhap");
			int soLuong = rs.getInt("SoLuong");
			String xuatXu = rs.getNString("XuatXu");
			CTVacxin ctv = new CTVacxin(maLoNhap, xuatXu, hanSuDung, giaBan, soLuong, maVacxin);
			ds.add(ctv);
		}
		rs.close();
		cmd.close();
		return ds;
	}

	public int getGia(int malonhap) throws Exception {
		KetNoi();
		String sql = "select GiaBan from CTVacxin where MaLoNhap='" + malonhap + "'";
		cmd = cn.prepareStatement(sql);
		ResultSet rs = cmd.executeQuery();
		int giaban = 0;
		if (rs.next()) {
			giaban = rs.getInt("GiaBan");
		}
		rs.close();
		cmd.close();
		return giaban;
	}

	public int updateSoLuong(int malonhap) throws Exception {
		{
			KetNoi();
			String sql = "update CTVacXin set SoLuongConLai=SoLuongConLai-1 where  HanSuDung>GETDATE()-1 AND MaLoNhap ='"+malonhap+"'";
			cmd = cn.prepareStatement(sql);
			return cmd.executeUpdate();
		}
	}
	
	/*public int ktTrungMa(int makh) throws Exception{
		KetNoi();
		String sql="selec";
	}*/
	
}
