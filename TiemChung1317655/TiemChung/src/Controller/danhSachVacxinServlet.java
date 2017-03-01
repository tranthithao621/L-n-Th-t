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
import Model.BO.VacxinBO;
import Model.Bean.Vacxin;

/**
 * Servlet implementation class danhSachVacxinServlet
 */
@WebServlet("/danhSachVacxinServlet")
public class danhSachVacxinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public danhSachVacxinServlet() {
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
		try {
			Model.BO.VacxinBO vx = new VacxinBO();
			DangKiBO dangKiBO = new DangKiBO();
			if(request.getParameter("makh") != null && request.getParameter("maVacxin")!=null){
				int maKH = Integer.parseInt(request.getParameter("makh"));
				//int maVacxin = dangKiBO.getLichDat(maKH);
				int maLoNhap = Integer.parseInt(request.getParameter("maVacxin"));
			//	System.out.println("maLoNhap = "+maLoNhap);
				int maVacxin = dangKiBO.getMaVacxin(maKH,maLoNhap);
				//System.out.println("MaVacxin = "+maVacxin);
				request.setAttribute("maVacxin", maVacxin);
			}
			
			List<Vacxin> lstvx = vx.getVacxin();
			request.setAttribute("lstvx", lstvx);
			
			RequestDispatcher rd = request.getRequestDispatcher("danhSachVacxin.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
