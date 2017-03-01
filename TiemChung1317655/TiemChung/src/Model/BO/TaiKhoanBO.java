package Model.BO;



import Model.Bean.TaiKhoan;
import Model.DAO.TaiKhoanDAO;

public class TaiKhoanBO {
	TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();
	public TaiKhoan checkLogin(String tenDangNhap, String matKhau) throws Exception{
		return taiKhoanDAO.checkLogin(tenDangNhap, matKhau);
	}
}
