package Model.Bean;

import java.util.Date;

public class LichDatTiem {
	
	private Date ngayDat;
	private int trangThai;
	private int maKH;
	private String tenKH;
	private String tenVacxin;
	private int maVacxin;
	private int maLoNhap;
	private String xuatXu;
	
	public int getMaLoNhap() {
		return maLoNhap;
	}

	public void setMaLoNhap(int maLoNhap) {
		this.maLoNhap = maLoNhap;
	}

	public String getXuatXu() {
		return xuatXu;
	}

	public void setXuatXu(String xuatXu) {
		this.xuatXu = xuatXu;
	}

	public LichDatTiem(Date ngayDat, int trangThai, int maKH, String tenKH,String tenVacxin) {
		super();
		this.ngayDat = ngayDat;
		this.trangThai = trangThai;
		this.maKH = maKH;
		this.tenVacxin = tenVacxin;
		this.tenKH = tenKH;
	}
	
	public int getMaVacxin() {
		return maVacxin;
	}


	public void setMaVacxin(int maVacxin) {
		this.maVacxin = maVacxin;
	}


	public Date getNgayDat() {
		return ngayDat;
	}
	
	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}
	public int getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
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
	public int getMaKH() {
		return maKH;
	}
	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}
	
	
}
