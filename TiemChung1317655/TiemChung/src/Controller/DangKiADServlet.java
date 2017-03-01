package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.DangKiBO;
import Model.BO.LichDatTiemBO;
import Model.BO.LoaiVacxinBO;
import Model.BO.VacxinBO;
import Model.Bean.LichDatTiem;
import Model.Bean.LoaiVacxin;
import Model.Bean.Vacxin;

/**
 * Servlet implementation class DangKiADServlet
 */
@WebServlet("/DangKiADServlet")
public class DangKiADServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKiADServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("nguoidung") == null){
			response.sendRedirect("Home.jsp");
			return;
		}
		//int maKH = Integer.parseInt(session.getAttribute("maKH").toString());
		int maKH = Integer.parseInt(request.getParameter("maKH"));
		LichDatTiemBO lichDatTiemBO = new LichDatTiemBO();
		try {
			ArrayList<LichDatTiem> listLichDatTiem = lichDatTiemBO.getLichTiem(maKH);
			request.setAttribute("listLichDatTiem",listLichDatTiem );
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		VacxinBO vacxinBO = new VacxinBO();
		LoaiVacxinBO loaiVacxinBO = new LoaiVacxinBO();
		
		String tuoi = request.getParameter("t");
		String maLoaiVacxin = request.getParameter("l");
		ArrayList<Vacxin> listVacxin;
		ArrayList<LoaiVacxin> listLoaiVacxin = null;
		try {
			listLoaiVacxin = loaiVacxinBO.getLoaiVacxin();
		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
		try {
			if(tuoi == "" && maLoaiVacxin !=  null ){
				listVacxin = vacxinBO.timKiemVacxin1(-1, Integer.parseInt(maLoaiVacxin),null);
			}else if(tuoi != "" && maLoaiVacxin != null){
				listVacxin = vacxinBO.timKiemVacxin1(Integer.parseInt(tuoi), Integer.parseInt(maLoaiVacxin),null);
			}
			else{
				listVacxin = vacxinBO.getVacxin1();
			}
			
			DangKiBO dangKiBO = new DangKiBO();
			if(request.getParameter("dangki") != null){
				String ngayDat = request.getParameter("ngayDat");
				String maVacxin = request.getParameter("maVacxin");
				try {
					dangKiBO.datLichTiem(ngayDat, maKH, Integer.parseInt(maVacxin));
					request.setAttribute("thongbao", "Bạn đã đăng ký thành công tiêm Vacxin vào ngày " + ngayDat);
					RequestDispatcher rd=request.getRequestDispatcher("DSDatLichServlet?maKH="+request.getParameter("maKH"));
					rd.forward(request, response);
				} catch (NumberFormatException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					request.setAttribute("error", "Vacxin này bạn đã đăng ký.");
					RequestDispatcher rd=request.getRequestDispatcher("DSDatLichServlet?maKH="+request.getParameter("maKH"));
					rd.forward(request, response);
				}
			}else{
		
				for(int i = 0;i< listVacxin.size();i++){
					try {
						int sl = dangKiBO.getSoLuongVacXin(listVacxin.get(i).getMaVacxin(),listVacxin.get(i).getXuatXu());
						int slHienCo = dangKiBO.getSoLuongVacxinHienCo(listVacxin.get(i).getMaVacxin(),listVacxin.get(i).getXuatXu());
						listVacxin.get(i).setSoLuongConLai(sl);
						listVacxin.get(i).setSoLuongHienCo(slHienCo);
					} catch (SQLException e) {
					
						e.printStackTrace();
					}
				}
				
				int total_page = (int) Math.ceil(listVacxin.size()/10.0);
				request.setAttribute("total_page", total_page);
				
				request.setAttribute("listLoaiVacxin", listLoaiVacxin);
				request.setAttribute("listVacxin", listVacxin);
				RequestDispatcher rd=request.getRequestDispatcher("DangKiAD.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e1) {
			e1.printStackTrace();			
		}
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
