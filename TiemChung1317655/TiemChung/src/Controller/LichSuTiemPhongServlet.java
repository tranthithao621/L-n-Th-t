package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Bean.LichSuTiemPhong;
import Model.BO.LichSuTiemPhongBO;

/**
 * Servlet implementation class LichSuTiemPhongServlet
 */
@WebServlet("/LichSuTiemPhongServlet")
public class LichSuTiemPhongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LichSuTiemPhongServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		if(session.getAttribute("nguoidung") == null){
			response.sendRedirect("Home.jsp");
			return;
		}
		try{
			LichSuTiemPhongBO tk = new LichSuTiemPhongBO();
		
			String tuKhoa = request.getParameter("s");
			String from = request.getParameter("from");
			String to = request.getParameter("to");

			List<LichSuTiemPhong> dstk = null;
			if( tuKhoa != null){
				dstk = tk.timKiemTheoTenKH(tuKhoa);
			}else if(from != null && to != null){
				dstk = tk.timKiemTheoNgay(from, to);
			}else{ 	
				dstk = tk.getLichSu();
			}
		int total_page = (int) Math.ceil(dstk.size()/10.0);
		request.setAttribute("total_page", total_page);
		request.setAttribute("dstk", dstk);
		RequestDispatcher rd = request.getRequestDispatcher("Lichsutiemphong.jsp");
		rd.forward(request, response);
	}catch(Exception tt){
		response.getWriter().println("<html><body>"+ tt.getMessage()+"</body></html>");
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
