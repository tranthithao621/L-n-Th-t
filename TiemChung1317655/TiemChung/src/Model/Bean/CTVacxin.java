package Model.Bean;

import java.util.Date;

public class CTVacxin {

		public CTVacxin(int maLoNhap, String xuatXu, Date hanSuDung, int giaBan, int soLuong, int maVacxin) {
		super();
		this.maLoNhap = maLoNhap;
		this.xuatXu = xuatXu;
		this.hanSuDung = hanSuDung;
		this.giaBan = giaBan;
		this.soLuong = soLuong;
		this.maVacxin = maVacxin;
	}
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
	public Date getHanSuDung() {
		return hanSuDung;
	}
	public void setHanSuDung(Date hanSuDung) {
		this.hanSuDung = hanSuDung;
	}
	public int getGiaBan() {
		return giaBan;
	}
	public void setGiaBan(int giaBan) {
		this.giaBan = giaBan;
	}
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public int getMaVacxin() {
		return maVacxin;
	}
	public void setMaVacxin(int maVacxin) {
		this.maVacxin = maVacxin;
	}
		private int maLoNhap;
		private String xuatXu;
		private Date hanSuDung;
		private int giaBan;
		private int soLuong;
		private int maVacxin;
		private String tenVacxin;
		public String getTenVacxin() {
			return tenVacxin;
		}
		public void setTenVacxin(String tenVacxin) {
			this.tenVacxin = tenVacxin;
		}
}
