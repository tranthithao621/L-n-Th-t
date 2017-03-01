package Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.LoaiVacxinBO;
import Model.Bean.LoaiVacxin;

/**
 * Servlet implementation class SuaLoaiVacxinServlet
 */
@WebServlet("/SuaLoaiVacxinServlet")
public class SuaLoaiVacxinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuaLoaiVacxinServlet() {
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
		String maLoaiVacxin = request.getParameter("id");
		LoaiVacxinBO loaiVacxinBO = new LoaiVacxinBO();
		String tenLoaiVacxin = request.getParameter("tenLoaiVacxin");
		if(request.getParameter("sua") != null && tenLoaiVacxin != ""){
			
			try {
				loaiVacxinBO.suaLoaiVacxin(tenLoaiVacxin, Integer.parseInt(maLoaiVacxin));
				RequestDispatcher rd=request.getRequestDispatcher("ThemLoaiVacxinServlet");
				rd.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(request.getParameter("sua") != null && tenLoaiVacxin == ""){
			try {
				request.setAttribute("loi", "Không được nhập rỗng!");
				LoaiVacxin loaiVacxin = loaiVacxinBO.getLoaiVacxin(Integer.parseInt(maLoaiVacxin));
				
				request.setAttribute("loaiVacxin", loaiVacxin);
				RequestDispatcher rd=request.getRequestDispatcher("SuaLoaiVacxin.jsp");
				rd.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}else if(request.getParameter("quaylai") != null){
			RequestDispatcher rd=request.getRequestDispatcher("ThemLoaiVacxinServlet");
			rd.forward(request, response);
		}
		else{
			try {
				LoaiVacxin loaiVacxin = loaiVacxinBO.getLoaiVacxin(Integer.parseInt(maLoaiVacxin));
				
				request.setAttribute("loaiVacxin", loaiVacxin);
				RequestDispatcher rd=request.getRequestDispatcher("SuaLoaiVacxin.jsp");
				rd.forward(request, response);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
