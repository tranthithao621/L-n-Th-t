package Model.Bean;

public class QuanLyTiemChung {
	private int maKH;
	private String tenKH;
	private int tuoi;
	private int gioiTinh;
	private String diaChi;
	private String sodt;
	private String email;
	public QuanLyTiemChung(int maKH, String tenKH, int tuoi, int gioiTinh, String diaChi, String sodt, String email) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.tuoi = tuoi;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.sodt = sodt;
		this.email = email;
	}
	public int getMaKH() {
		return maKH;
	}
	public void setMaKH(int maKH) {
		this.maKH = maKH;
	}
	public String getTenKH() {
		return tenKH;
	}
	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}
	public int getTuoi() {
		return tuoi;
	}
	public void setTuoi(int tuoi) {
		this.tuoi = tuoi;
	}
	public int getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(int gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getSodt() {
		return sodt;
	}
	public void setSodt(String sodt) {
		this.sodt = sodt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
		

}
