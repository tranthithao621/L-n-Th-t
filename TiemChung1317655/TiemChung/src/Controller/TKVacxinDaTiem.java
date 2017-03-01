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
import Model.Bean.ThongKe;

/**
 * Servlet implementation class TKVacxinDaTiem
 */
@WebServlet("/TKVacxinDaTiem")
public class TKVacxinDaTiem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TKVacxinDaTiem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ThongKeBO tk = new ThongKeBO();
		try {
			ArrayList<ThongKe> list = null;
			
			String tuKhoa = request.getParameter("s");
			String dk = request.getParameter("dk");
			if(tuKhoa != null){
				list = tk.search(tuKhoa);
		
			}else{
				if(dk == null){
					dk = "ASC";
				}
				list = tk.get(dk);	
			
			}
			int total_page = (int) Math.ceil(list.size()/10.0);
			request.setAttribute("total_page", total_page);
			request.setAttribute("listVacxinDaTiem", list);
			RequestDispatcher rd=request.getRequestDispatcher("TKVacxinDaTiem.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			
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
