package Model.BO;

import java.util.ArrayList;

import Model.Bean.LichDatTiem;
import Model.DAO.LichDatTiemDAO;



public class LichDatTiemBO {
	LichDatTiemDAO s = new LichDatTiemDAO();
	public ArrayList<LichDatTiem> getDatLich() throws Exception{
		return s.getDatLich();
	}
	public ArrayList<LichDatTiem> getTheoMaKH(int maKH)  throws Exception{
		return s.getTheoMaKH(maKH);

	}
	public ArrayList<LichDatTiem> timKiemTheoTenVacxin(String tenKH) throws Exception{
		return s.timKiemTheoTenVacxin(tenKH);
	}
	public ArrayList<LichDatTiem> timKiemTheoNgay(String date) throws Exception{
		return s.timKiemTheoNgay(date);
	}
	public int huyLichDatTiem(int maKH,int maVacxin, String ngayDat) throws Exception{
		return s.huyLichDatTiem(maKH, maVacxin, ngayDat);
	}
	public ArrayList<LichDatTiem> getLichTiem(int maKH) throws Exception{
		return s.getLichTiem(maKH);
	}
}
