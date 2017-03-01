package Model.BO;

import java.util.ArrayList;
import Model.Bean.LoaiVacxin;
import Model.DAO.LoaiVacxinDAO;

public class LoaiVacxinBO {

	LoaiVacxinDAO lv = new LoaiVacxinDAO();
	
	public ArrayList<LoaiVacxin> getLoaiVacxin()throws Exception{
		return lv.getLoaiVacxin();
	}
	public int themLoaiVacxin(String tenLoaiVacxin) throws Exception {
		return lv.themLoaiVacxin(tenLoaiVacxin);
	}
	
	public int suaLoaiVacxin(String tenLoaiVacxin, int maLoaiVacxin) throws Exception{
		return lv.suaLoaiVacxin(tenLoaiVacxin, maLoaiVacxin);
	}
	
	public int xoaLoaiVacxin(int maLoaiVacxin) throws Exception{
		return lv.xoaLoaiVacxin(maLoaiVacxin);
	}
	public LoaiVacxin getLoaiVacxin(int maLoaiVacxin) throws Exception {
		return lv.getLoaiVacxin(maLoaiVacxin);
	}
	public ArrayList<LoaiVacxin> timKiemLoaiVacxin(String tuKhoa) throws Exception{
		return lv.timKiemLoaiVacxin(tuKhoa);
	}
	public boolean isExist(String tenLoaiVacxin) throws Exception {
		ArrayList<LoaiVacxin> list = this.getLoaiVacxin();
		for(int i = 0;i< list.size();i++){
			if(tenLoaiVacxin.equals(list.get(i).getTenLoaiVacxin())){
				return true;
			}
		}
		return false;
	}

}
