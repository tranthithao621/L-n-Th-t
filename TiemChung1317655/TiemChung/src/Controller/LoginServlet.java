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

import Model.Bean.TaiKhoan;
import Model.BO.TaiKhoanBO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		TaiKhoanBO taiKhoanBO = new TaiKhoanBO();
		if(request.getParameter("dangnhap")!= null){
			String tenDangNhap = request.getParameter("tenTaiKhoan");
			String matKhau = request.getParameter("matKhau");
			
			try {
				TaiKhoan taiKhoan = taiKhoanBO.checkLogin(tenDangNhap, matKhau);
				if(taiKhoan != null){
					HttpSession session = request.getSession();
					session.setAttribute("nguoidung", taiKhoan.getTenKH());
					session.setAttribute("maKH", taiKhoan.getMaKH());
					if(taiKhoan.isQuyen()){
						response.sendRedirect("ThemLoaiVacxinServlet");
					}else{
						response.sendRedirect("DangKiServlet");
					}	
				}else{
					request.setAttribute("error", "Đăng nhập thất bại");
					RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else{
			RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
			rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
