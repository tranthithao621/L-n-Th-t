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

import Model.BO.VacxinBO;
import Model.Bean.Vacxin;

/**
 * Servlet implementation class FindVacxin
 */
@WebServlet("/FindVacxin")
public class FindVacxin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindVacxin() {
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
			request.setCharacterEncoding("UTF-8");
			VacxinBO vacxin = new VacxinBO();
			String tenvacxin = request.getParameter("tenvacxin");
			ArrayList<Vacxin> ds =vacxin.timKiemVacxin(tenvacxin);
			

			int total_page = (int) Math.ceil(ds.size()/2.0);
			request.setAttribute("total_page", total_page);
			
			request.setAttribute("vacxin", ds);
			RequestDispatcher rd = request.getRequestDispatcher("ShowListVacxin.jsp");
			rd.forward(request, response);
			
		}catch(Exception tt){
			response.getWriter().println("<html><body> Loi : "+tt.getMessage()+"</body><html>");
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
