package Model.BO;

import java.util.ArrayList;

import Model.Bean.CTVacxin;
import Model.DAO.CTVacxinDAO;

public class CTVacxinBO {
	
	CTVacxinDAO ct = new CTVacxinDAO();
	public ArrayList<CTVacxin> getCTVacxin()throws Exception{
		return ct.getCTVacxin();
	}
	
	public int addCTVacxin(int mavacxin, String hansudung, int giaban, String xuatxu, int soluong)throws Exception{
		return ct.addCTVacxin(mavacxin, hansudung, giaban, xuatxu, soluong);
	}
	
	public int deleteCTVacxin(int mactvacxin)throws Exception {
		return ct.deleteCTVacxin(mactvacxin);
	}
	
	public ArrayList<CTVacxin> timKiemXuatXu(String xuatxu )throws Exception{
		return ct.timKiemXuatXu(xuatxu);
	}
	
	public CTVacxin get1CTVacxin (int malonhap)throws Exception{
		return ct.get1CTVacxin(malonhap);
	}
	
	public int EditCTVacxin(String xuatxu, int malonhap, String hansudung, int giaban ,int soluong)throws Exception{
		return ct.EditCTVacxin(xuatxu, malonhap, hansudung, giaban, soluong);
	}
	
	public ArrayList<CTVacxin> getThongTin(int mavacxin)throws Exception{
		return ct.getThongTin(mavacxin);
	}
	public int getGia(int malonhap)throws Exception{
		return ct.getGia(malonhap);
	}
	public int updateSoLuong(int malonhap)throws Exception{
		return ct.updateSoLuong(malonhap);
	}
}
