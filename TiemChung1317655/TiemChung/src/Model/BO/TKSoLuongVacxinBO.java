package Model.BO;

import java.sql.SQLException;
import java.util.ArrayList;

import Model.Bean.TKSoLuongVacxin;
import Model.DAO.TKSoLuongVacxinDAO;

public class TKSoLuongVacxinBO {
	TKSoLuongVacxinDAO tk = new TKSoLuongVacxinDAO();
	public ArrayList<TKSoLuongVacxin> getByDay(String ngay) throws Exception{
		return tk.getByDay(ngay);
	}
}
