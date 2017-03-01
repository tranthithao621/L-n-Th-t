package Model.BO;



import Model.DAO.DangKiDAO;



public class DangKiBO {
	DangKiDAO dangKiDAO = new DangKiDAO();
	public int datLichTiem(String ngay, int maKH, int maVacxin) throws Exception{
		return dangKiDAO.datLichTiem(ngay, maKH, maVacxin);
	}
	public int getSoLuongVacXin(int maVacxin,String xuatXu) throws Exception{
		return dangKiDAO.getSoLuongVacXin(maVacxin,xuatXu);
	}
	public int getSoLuongVacxinHienCo(int maVacxin,String xuatXu) throws Exception{
		return dangKiDAO.getSoLuongVacxinHienCo(maVacxin,xuatXu);
	}
	public int getLichDat(int makh)throws Exception {
		return dangKiDAO.getLichDat(makh);
	}
	
	public int getMavacixn(int makh)throws Exception{
		return dangKiDAO.getLichDat(makh);
	}
	public int getMaVacxin(int makh,int maLoNhap)throws Exception{
		return dangKiDAO.getMaVacxin(makh,maLoNhap);
	}
}
