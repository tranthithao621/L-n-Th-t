package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.VacxinBO;

/**
 * Servlet implementation class EditVacxin
 */
@WebServlet("/EditVacxin")
public class EditVacxin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditVacxin() {
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
			if(request.getParameter("quaylai")!=null){
				RequestDispatcher rd = request.getRequestDispatcher("ShowListVacxin");
				rd.forward(request, response);
			}
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			VacxinBO vacxinBO = new VacxinBO();
			String tenvacxin= request.getParameter("tenvacxin");
			String tuoitoithieu1 =request.getParameter("tuoitoithieu");
			String tuoitoida1 = request.getParameter("tuoitoida");
			String somui1=request.getParameter("somui");
			int mavacxin=Integer.parseInt(request.getParameter("mavacxin"));
			if( "".equals(tenvacxin)||"".equals(tuoitoithieu1)||"".equals(somui1)||"".equals(tuoitoida1)){
				request.setAttribute("loiten", "Thiếu thông tin");
				
			}else if(vacxinBO.kiemTraTen2(tenvacxin ,mavacxin)==false){
				request.setAttribute("loiten", "Tên Vacxin đả có !!");
			}else{
				int tuoitoithieu =Integer.parseInt(request.getParameter("tuoitoithieu"));
				int tuoitoida = Integer.parseInt(request.getParameter("tuoitoida"));
				int maloaivacxin=Integer.parseInt(request.getParameter("maloaivacxin"));
				int somui=Integer.parseInt(request.getParameter("somui"));
				if((tuoitoithieu<=0 || tuoitoithieu >100) || (tuoitoida <=0|| tuoitoida>100)){
					request.setAttribute("loituoi", "Tuổi phải nằm trong khoảng từ 0 đến 100 ");
				}else if(somui<=0){
					request.setAttribute("loisomui", "Số mũi phải lớn hơn 0 ");
				}else{
					vacxinBO.editVacxin(tenvacxin, tuoitoithieu, tuoitoida, somui, maloaivacxin, mavacxin);
					request.setAttribute("thanhcong", "Thêm vacxin thành công");
					RequestDispatcher rd = request.getRequestDispatcher("ShowListVacxin");
					rd.forward(request, response);
				}
				
			}
			RequestDispatcher rd = request.getRequestDispatcher("ShowEditVacxin");
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
