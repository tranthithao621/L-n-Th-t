package Model.Bean;

import java.util.Date;

public class thongkebean {
	private String Mavacxin;
	private String TenVacxin;
	private Date NgayTiem;
	private int soluong;
	public String getMavacxin() {
		return Mavacxin;
	}
	public thongkebean(String mavacxin, String tenVacxin, Date ngayTiem, int soluong) {
		super();
		Mavacxin = mavacxin;
		TenVacxin = tenVacxin;
		NgayTiem = ngayTiem;
		this.soluong = soluong;
	}
	public void setMavacxin(String mavacxin) {
		Mavacxin = mavacxin;
	}
	public String getTenVacxin() {
		return TenVacxin;
	}
	public void setTenVacxin(String tenVacxin) {
		TenVacxin = tenVacxin;
	}
	public Date getNgayTiem() {
		return NgayTiem;
	}
	public void setNgayTiem(Date ngayTiem) {
		NgayTiem = ngayTiem;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
}
