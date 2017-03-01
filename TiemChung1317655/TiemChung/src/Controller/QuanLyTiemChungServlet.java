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

import Model.BO.DangKiBO;
import Model.BO.KhachHangBO;
import Model.BO.VacxinBO;
import Model.Bean.KhachHang;
import Model.Bean.Vacxin;


/**
 * Servlet implementation class QuanLyTiemChungServlet
 */
@WebServlet("/QuanLyTiemChungServlet")
public class QuanLyTiemChungServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanLyTiemChungServlet() {
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
			Model.BO.VacxinBO vx = new VacxinBO();
			KhachHangBO khachhang = new KhachHangBO();
			//QuanLyTiemChungBO kh= new QuanLyTiemChungBO();			
			List<KhachHang> lstkh = khachhang.getKhachHang();
			List<Vacxin> lstvx = vx.getVacxin();
			if(request.getParameter("makh")!=null)
			{	
				String makh=request.getParameter("makh");
				KhachHang nv1= khachhang.getKhachHangTheoMa(makh);
				DangKiBO dk = new DangKiBO();
				request.setAttribute("vacxin", dk.getMavacixn(Integer.parseInt(makh)));
				request.setAttribute("kh",nv1);
			}else	request.setAttribute("kh",null);
			request.setAttribute("lstkh", lstkh);
			request.setAttribute("lstvx", lstvx);
			request.setAttribute("loivacxin", session.getAttribute("loivacxin"));
			session.removeAttribute("loivacxin");
			RequestDispatcher rd = request.getRequestDispatcher("Quanlytiemchung.jsp");
			rd.forward(request, response);
		}catch (Exception tt){
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
