package Model.Bean;

import java.util.Date;

public class LichSuTiemPhong {
	
	private String maKH;
	private String tenKH;
	private String tenVacxin;
	private Date ngayTiem;
	private Date ngayTaiTiem;
	private int giaBan;
	private int lanTiem;
	public LichSuTiemPhong(String maKH, String tenKH, String tenVacxin, Date ngayTiem, Date ngayTaiTiem, int giaBan,
			int lanTiem) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.tenVacxin = tenVacxin;
		this.ngayTiem = ngayTiem;
		this.ngayTaiTiem = ngayTaiTiem;
		this.giaBan = giaBan;
		this.lanTiem = lanTiem;
	}
	public String getMaKH() {
		return maKH;
	}
	public void setMaKH(String maKH) {
		this.maKH = maKH;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}
	public String getTenVacxin() {
		return tenVacxin;
	}
	public void setTenVacxin(String tenVacxin) {
		this.tenVacxin = tenVacxin;
	}
	public Date getNgayTiem() {
		return ngayTiem;
	}
	public void setNgayTiem(Date ngayTiem) {
		this.ngayTiem = ngayTiem;
	}
	public Date getNgayTaiTiem() {
		return ngayTaiTiem;
	}
	public void setNgayTaiTiem(Date ngayTaiTiem) {
		this.ngayTaiTiem = ngayTaiTiem;
	}
	public int getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}
	public int getLanTiem() {
		return lanTiem;
	}
	public void setLanTiem(int lanTiem) {
		this.lanTiem = lanTiem;
	}

}
