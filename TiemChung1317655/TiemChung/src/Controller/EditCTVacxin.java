package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.BO.CTVacxinBO;
import Model.Bean.CTVacxin;

/**
 * Servlet implementation class EditCTVacxin
 */
@WebServlet("/EditCTVacxin")
public class EditCTVacxin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCTVacxin() {
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
			response.setCharacterEncoding("UTF-8");
			if(request.getParameter("quaylai")!=null){
				RequestDispatcher rd = request.getRequestDispatcher("ShowListCTVacxin");
				rd.forward(request, response);
			}
			
			SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
			//HttpSession session = request.getSession();
			CTVacxinBO ctVacxinBO = new CTVacxinBO();
			int mavacxin =Integer.parseInt( request.getParameter("mavacxin"));
			String giaban1= request.getParameter("giaban");
			String xuatxu =request.getParameter("xuatxu");
			String soluong1 = request.getParameter("soluong");
			String hansudung= request.getParameter("hansudung");
			int malonhap =Integer.parseInt(request.getParameter("malonhap"));
			System.out.println(hansudung);
			if("".equals(hansudung)||"".equals(xuatxu)||"".equals(giaban1)||"".equals(soluong1)){
				
				request.setAttribute("loi", "Thiếu thông tin!!");
				
			}else {
				int giaban = Integer.parseInt(giaban1);
				int soluong=  Integer.parseInt(soluong1);
				CTVacxin ct1 = new CTVacxin(0, xuatxu, sdf.parse(hansudung), giaban, soluong, mavacxin);
				session.setAttribute("ctvacxin", ct1);
				if(soluong <=0 ){
					request.setAttribute("loisoluong", "Số lượng phải lớn hơn 0");
				}else if(giaban <= 0){
					request.setAttribute("loigiaban", "Gía bán phải lớn hơn 0");
					
				}else{	
					ctVacxinBO.EditCTVacxin(xuatxu, malonhap, hansudung, giaban, soluong);
					request.setAttribute("thanhcong","Thêm chi tiết vacxin thành công");
					RequestDispatcher rd = request.getRequestDispatcher("ShowListCTVacxin");
					rd.forward(request, response);
				}
				
			}
		RequestDispatcher rd = request.getRequestDispatcher("ShowEditCTVacxin");
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
