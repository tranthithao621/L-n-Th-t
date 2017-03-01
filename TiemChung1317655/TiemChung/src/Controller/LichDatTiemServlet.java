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

import Model.Bean.LichDatTiem;
import Model.Bean.TKSoLuongVacxin;
import Model.BO.LichDatTiemBO;
import Model.BO.TKSoLuongVacxinBO;

/**
 * Servlet implementation class LichDatTiemServlet
 */
@WebServlet("/LichDatTiemServlet")
public class LichDatTiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LichDatTiemServlet() {
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
		try{
			
			LichDatTiemBO tk = new LichDatTiemBO();
			TKSoLuongVacxinBO tk1 = new TKSoLuongVacxinBO();
			
			ArrayList<LichDatTiem> dstk = null;
			ArrayList<TKSoLuongVacxin> tksl = null;
			
			String tuKhoa = request.getParameter("s");
		
			int total_page = 0;
			if( tuKhoa != null && request.getParameter("xem") != null){
			
					dstk = tk.timKiemTheoTenVacxin(tuKhoa);
					total_page = (int) Math.ceil(dstk.size()/10.0);
			}else if(tuKhoa != null && request.getParameter("thongke") != null){
	//	http://localhost:8080/TiemChung/ShowListCTVacxin
				tksl = tk1.getByDay(tuKhoa);
				 total_page = (int) Math.ceil(tksl.size()/10.0);
			}else if(tuKhoa != null){
				dstk = tk.timKiemTheoTenVacxin(tuKhoa);
				 total_page = (int) Math.ceil(dstk.size()/10.0);
			}else{
				dstk = tk.getDatLich();
				 total_page = (int) Math.ceil(dstk.size()/10.0);
			}
		
			
			request.setAttribute("tksl", tksl);
			request.setAttribute("total_page", total_page);
			request.setAttribute("dstk", dstk);
			RequestDispatcher rd = request.getRequestDispatcher("Lichdattiem.jsp");
			rd.forward(request, response);
		}catch(Exception tt){
			tt.printStackTrace();
			//response.getWriter().println("<html><body>"+ tt.getMessage()+"</body></html>");
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
