package Model.Bean;

public class tonkhobean {
	private String MaVacxin;
	private String TenVacxin;
	private int sl;
	public tonkhobean(String maVacxin, String tenVacxin, int sl) {
		super();
		MaVacxin = maVacxin;
		TenVacxin = tenVacxin;
		this.sl = sl;
	}
	public String getMaVacxin() {
		return MaVacxin;
	}
	public void setMaVacxin(String maVacxin) {
		MaVacxin = maVacxin;
	}
	public String getTenVacxin() {
		return TenVacxin;
	}
	public void setTenVacxin(String tenVacxin) {
		TenVacxin = tenVacxin;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	

}
