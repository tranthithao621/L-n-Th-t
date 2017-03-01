package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.ThongKeBO;
import Model.Bean.thongkebean;


/**
 * Servlet implementation class hethanSV
 */
@WebServlet("/hethanSV")
public class hethanSV extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hethanSV() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			ThongKeBO a = new ThongKeBO();
//			String n1=request.getParameter("txtn1");
//			String n2 = request.getParameter("txtn2");
//			//HttpSession ses = request.getSession();
//			if(n1==""||n1==null||n2==null||n2=="")
//				request.setAttribute("lk",a.getthongke());
//			else
//			{
				ArrayList<thongkebean> k= a.getthongke2();
				request.setAttribute("lk",k);	
				
			//}
			int total_page = (int) Math.ceil(k.size()/10.0);
			request.setAttribute("total_page", total_page);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("hethan.jsp");
			requestDispatcher.forward(request, response);
//			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().println("<html><body>"+e.getMessage()+"</body></html>");	
		}
		request.setCharacterEncoding("utf-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
