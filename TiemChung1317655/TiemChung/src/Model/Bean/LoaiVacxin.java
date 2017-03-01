package Model.Bean;

public class LoaiVacxin {
	public LoaiVacxin(int maLoaiVacxin, String tenLoaiVacxin) {
		super();
		this.maLoaiVacxin = maLoaiVacxin;
		this.tenLoaiVacxin = tenLoaiVacxin;
	}
	public LoaiVacxin(){
		
	}
	public int getMaLoaiVacxin() {
		return maLoaiVacxin;
	}
	public void setMaLoaiVacxin(int maLoaiVacxin) {
		this.maLoaiVacxin = maLoaiVacxin;
	}
	public String getTenLoaiVacxin() {
		return tenLoaiVacxin;
	}
	public void setTenLoaiVacxin(String tenLoaiVacxin) {
		this.tenLoaiVacxin = tenLoaiVacxin;
	}
	private int maLoaiVacxin;
	private String tenLoaiVacxin;
}
