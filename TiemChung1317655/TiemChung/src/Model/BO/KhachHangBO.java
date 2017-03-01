package Model.BO;

import java.util.ArrayList;
import java.util.regex.Pattern;

import Model.Bean.KhachHang;
import Model.DAO.KhachHangDAO;


public class KhachHangBO {
	
	KhachHangDAO kh = new KhachHangDAO();
	
	public ArrayList<KhachHang> getKhachHang()throws Exception{
		return kh.getKhachHang();
	}
	public int themKhachHang(String tenKH, int tuoi, boolean gioiTinh,String soDT, String diaChi, String email) throws Exception{
		return kh.themKhachHang(tenKH, tuoi, gioiTinh, soDT, diaChi, email);
	}
	public int suaKhachHang(int maKH ,String tenKH, int tuoi, boolean gioiTinh,String soDT, String diaChi, String email) throws Exception{
		return kh.suaKhachHang(maKH, tenKH, tuoi, gioiTinh, soDT, diaChi, email);
		
	}
	public int xoaKhachHang(String maKH)throws Exception{
		return kh.xoaKhachHang(maKH);
		
	}
	public ArrayList<KhachHang> timKiemKhachHang(String tenKH)throws Exception{
		return kh.timKiemKhachHang(tenKH);
	}
	public KhachHang getKhachHang(int maKH)throws Exception{
		return kh.getKhachHang(maKH);
	}
	
	public KhachHang getKhachHangTheoMa(String tenKH) throws Exception{
		return kh.getKhachHangTheoMa(tenKH);

	}
	public int LanTiem(int makhachhang ,int mavacxin)throws Exception{
		return kh.MaxLanTiem(makhachhang, mavacxin);
	}
	public int LayMaKhachHang(String tenkhachhang)throws Exception{
		return kh.layMaKhachHang(tenkhachhang);
	}
	public ArrayList<KhachHang> timKiemKhacHang(String tenkhachhang)throws Exception{
		return kh.timKiemKhachHang(tenkhachhang);
	}
	
	public boolean isExist(String tenKH) {
		ArrayList<KhachHang> list;
		try {
			list = this.getKhachHang();
			for(int i = 0; i< list.size();i++){
				if(tenKH.equals(list.get(i).getTenKH())){
					return true;
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public int kTDiaChi(String diachi)throws Exception{
		 Pattern pattern = Pattern.compile("\\d*");
        java.util.regex.Matcher matcher = pattern.matcher(diachi);
		if(matcher.matches()){
			return 2;
		}
		else{
			if(diachi.length()>150){
				return 0;
			}
		}
		return 1;
	}
	
	public int kTSoDienThoai(String sodt)throws Exception{
		 Pattern pattern = Pattern.compile("\\d*");
        java.util.regex.Matcher matcher = pattern.matcher(sodt);
		if(matcher.matches()){
			if(sodt.length()<=11 && sodt.length()>=10){
				return 1;
			}else{
				return 2;
			}
			
		}
		return 0;
	}
	public int kTTen(String tenkhachhang)throws Exception{
		 Pattern pattern = Pattern.compile("\\d*");
       java.util.regex.Matcher matcher = pattern.matcher(tenkhachhang);
		if(matcher.matches()){
			return 0;
			
		}
		return 1;
	}

}
