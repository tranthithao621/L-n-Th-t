package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.KhachHangBO;
import Model.Bean.KhachHang;


/**
 * Servlet implementation class KhachHangServlet
 */
@WebServlet("/KhachHangServlet")
public class KhachHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhachHangServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("nguoidung") == null) {
			response.sendRedirect("Home.jsp");
			return;
		}
		try {

			KhachHangBO khachHangBO = new KhachHangBO();
			boolean maKTSua1 = true;
			boolean maKTSua = true;
			boolean maKTThem = true;
			String maKHSua = request.getParameter("maKHSua");
			String btnThemKH = request.getParameter("btnthemkh");
			String btnSuaKH = request.getParameter("btnsuakh");
			String txtTimKiemKH = request.getParameter("txttimkiemkh");
			String btnTimKiemKH = request.getParameter("btntimkiemkh");
			
			int i=0;
			if (btnThemKH != null) {
				String tenKH = request.getParameter("txttenkh");
				String tuoi = request.getParameter("txttuoikh");
				String gioiTinh = request.getParameter("radiogioitinhkh");
				String diaChi = request.getParameter("txtdiachikh");
				String soDT = request.getParameter("txtsodtkh");
				String email = request.getParameter("txtemailkh");
				KhachHang KH = new KhachHang(tenKH, "".equals(tuoi) ? 0 : Integer.parseInt(tuoi),
						Boolean.parseBoolean(gioiTinh), soDT, diaChi, email);

				if ("".equals(tenKH)) {
					i++;
					maKTThem = false;
					request.setAttribute("kttenkh", "true");
					System.out.println("1");
				} if ("".equals(tuoi)) {
					i++;
					maKTThem = false;
					request.setAttribute("kttuoikh", "true");
					System.out.println("tuoisai");
				}else if (Integer.parseInt(tuoi) <= 0 || Integer.parseInt(tuoi) > 100) {
					maKTThem = false;
					request.setAttribute("kttuoikh1", "true");
					System.out.println("9");
				} if (khachHangBO.kTSoDienThoai(soDT) == 2) {
					i++;
					maKTThem = false;
					System.out.println("2");
					request.setAttribute("saisodt1", "Số điện thoại phải từ 10 đến 11 chữ số");
				} if ("".equals(diaChi)) {
					i++;
					maKTThem = false;
					request.setAttribute("loidc", "Vui lòng nhập địa chỉ");
					System.out.println("4");
				}  if ("".equals(soDT)) {
					i++;
					maKTThem = false;
					request.setAttribute("loidt", "Vui long nhập số đt");
					System.out.println("5");
				}  if (khachHangBO.kTDiaChi(diaChi) == 2) {
					i++;
					maKTThem = false;
					request.setAttribute("saidiachi1", "Địa chỉ phải la chữ");
					System.out.println("6");
				} if (khachHangBO.kTDiaChi(diaChi) == 0) {
					i++;
					maKTThem = false;
					request.setAttribute("saidiachi", "Địa chỉ quá lớn");
					System.out.println("8");
				}if("".equals(tenKH)==false && khachHangBO.kTTen(tenKH)==0){
					i++;
					maKTThem = false;
					request.setAttribute("loiten", "Tên khách hàng không chính xác");
					System.out.println("8");
				}if (i==0) {
						khachHangBO.themKhachHang(tenKH, Integer.parseInt(tuoi), Boolean.parseBoolean(gioiTinh), soDT,
								diaChi, email);
						System.out.println("thanh cong nhe");		
				}
				

				if (maKTThem == false) {
					request.setAttribute("khthem", KH);
					RequestDispatcher rd = request.getRequestDispatcher("ThemKhachHang.jsp");
					rd.forward(request, response);
				}

			}
			if (maKHSua != null) {

				maKTSua1 = false;
				request.setAttribute("khSua", khachHangBO.getKhachHang(Integer.parseInt(maKHSua)));
				RequestDispatcher rd = request.getRequestDispatcher("SuaTTKhachHang.jsp");
				rd.forward(request, response);
			}
			if (btnSuaKH != null) {
				//maKT = false;
				String tenKH = request.getParameter("txttenkhsua");
				String tuoi = request.getParameter("txttuoikhsua");
				String gioiTinh = request.getParameter("radiogioitinhkhsua");
				String diaChi = request.getParameter("txtdiachikhsua");
				String soDT = request.getParameter("txtsodtkhsua");
				String email = request.getParameter("txtemailkhsua");
				String maKHSua1 = request.getParameter("txtmakhsua");
				KhachHang KhachH = new KhachHang(Integer.parseInt(maKHSua1), tenKH, "".equals(tuoi)?0:Integer.parseInt(tuoi), Boolean.parseBoolean(gioiTinh), soDT, diaChi, email);
				request.setAttribute("khSua", KhachH);
				if ("".equals(tenKH)) {
					i++;
					maKTSua = false;
					request.setAttribute("kttenkh", "true");
					System.out.println("1");
				} if ("".equals(tuoi)) {
					i++;
					maKTSua = false;
					request.setAttribute("kttuoikh", "true");
					System.out.println("tuoisai");
				}else if (Integer.parseInt(tuoi) <= 0 || Integer.parseInt(tuoi) > 100) {
					maKTSua = false;
					request.setAttribute("kttuoikh1", "true");
					System.out.println("9");
				}
				if (khachHangBO.kTSoDienThoai(soDT) == 2) {
					i++;
					maKTSua = false;
					System.out.println("2");
					request.setAttribute("saisodt1", "Số điện thoại phải từ 10 đến 11 chữ số");
				} if ("".equals(diaChi)) {
					i++;
					maKTSua = false;
					request.setAttribute("loidc", "Vui lòng nhập địa chỉ");
					System.out.println("4");
				}  if ("".equals(soDT)) {
					i++;
					maKTSua = false;
					request.setAttribute("loidt", "Vui long nhập số đt");
					System.out.println("5");
				}  if (khachHangBO.kTDiaChi(diaChi) == 2) {
					i++;
					maKTSua = false;
					request.setAttribute("saidiachi1", "Địa chỉ phải la chữ");
					System.out.println("6");
				} if (khachHangBO.kTDiaChi(diaChi) == 0) {
					i++;
					maKTSua = false;
					request.setAttribute("saidiachi", "Địa chỉ quá lớn");
					System.out.println("8");
				}if("".equals(tenKH)==false && khachHangBO.kTTen(tenKH)==0){
					i++;
					maKTSua = false;
					request.setAttribute("loiten", "Tên khách hàng không chính xác");
					System.out.println("8");
				}if (i==0) {
						khachHangBO.suaKhachHang(Integer.parseInt(maKHSua1), tenKH, Integer.parseInt(tuoi),Boolean.parseBoolean(gioiTinh), soDT, diaChi, email);
						System.out.println("thanh cong nhe");		
				}
				
				
				if(maKTSua==false){
					RequestDispatcher rd = request.getRequestDispatcher("SuaTTKhachHang.jsp");
					rd.forward(request, response);
				}
				
			}

			ArrayList<KhachHang> listKhachHang = khachHangBO.getKhachHang();
			request.setAttribute("listKhachHang", listKhachHang);
			if (btnTimKiemKH != null) {
				ArrayList<KhachHang> listKH = khachHangBO.timKiemKhachHang(txtTimKiemKH);
				request.setAttribute("listKhachHang", listKH);
			}
			if (maKTSua == true || maKTThem == true) {
				RequestDispatcher rd = request.getRequestDispatcher("QuanLyKhachHang.jsp");
				rd.forward(request, response);
			}

		} catch (Exception tt) {
			response.getWriter().println("<html><body>" + tt.getMessage() + "</body></html>");

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
