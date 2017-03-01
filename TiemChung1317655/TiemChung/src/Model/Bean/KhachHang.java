package Model.Bean;

public class KhachHang {
	
	private int maKH;
	private String tenKH;
	private int tuoi;
	private boolean gioiTinh;
	private String soDT;
	private String diaChi;
	private String email;
	
	
	
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
	public boolean isGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(boolean gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getsoDT() {
		return soDT;
	}
	public void setsoDT(String sDT) {
		this.soDT = sDT;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public KhachHang(String tenKH, int tuoi, boolean gioiTinh, String soDT,
			String diaChi, String email) {
		super();
		this.tenKH = tenKH;
		this.tuoi = tuoi;
		this.gioiTinh = gioiTinh;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.email = email;
	}
	public KhachHang(int maKH, String tenKH, int tuoi, boolean gioiTinh,
			String soDT, String diaChi, String email) {
		super();
		this.maKH = maKH;
		this.tenKH = tenKH;
		this.tuoi = tuoi;
		this.gioiTinh = gioiTinh;
		this.soDT = soDT;
		this.diaChi = diaChi;
		this.email = email;
	}
	
	
	
}
