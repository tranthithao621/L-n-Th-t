package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.BO.VacxinBO;
import Model.Bean.Vacxin;

/**
 * Servlet implementation class AddVacxin
 */
@WebServlet("/AddVacxin")
public class AddVacxin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddVacxin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			if (request.getParameter("quaylai") != null) {
				RequestDispatcher rd = request.getRequestDispatcher("ShowListVacxin");
				rd.forward(request, response);
			}
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			VacxinBO vacxinBO = new VacxinBO();
			String tuoitoithieu = request.getParameter("tuoitoithieu");
			String tuoitoida = request.getParameter("tuoitoida");
			String somui = request.getParameter("somui");
			String tenvacxin = request.getParameter("tenvacxin");
			String maloaivacxin = request.getParameter("maloaivacxin");
			Vacxin v= new Vacxin(0, tenvacxin, Integer.parseInt(maloaivacxin), "".equals(tuoitoithieu)?0:Integer.parseInt(tuoitoithieu),
					"".equals(tuoitoida)?0:Integer.parseInt(tuoitoida), "".equals(somui)?0:Integer.parseInt(somui));
			if ("".equals(tenvacxin) || "".equals(tuoitoithieu) ||"".equals(somui) || "".equals(tuoitoida)) {
				request.setAttribute("loiten", "Thiếu thông tin");
					
			} else if (vacxinBO.kiemTraTen(tenvacxin) == false) {
				request.setAttribute("loiten", "Tên Vacxin đả có !!");
				

			} else {

				if ((Integer.parseInt(tuoitoithieu) <= 0 || Integer.parseInt(tuoitoithieu) > 100)
						|| (Integer.parseInt(tuoitoida) <= 0 | Integer.parseInt(tuoitoida) > 100)) {
					request.setAttribute("loituoi", "Tuổi phải nằm trong khoảng từ 0 đến 100 ");
				} else if (Integer.parseInt(somui) <= 0) {
					request.setAttribute("loisomui", "Số mũi phải lớn hơn 0 ");

				} else {
					vacxinBO.addVacxin(tenvacxin, Integer.parseInt(tuoitoithieu), Integer.parseInt(tuoitoida), Integer.parseInt(somui),Integer.parseInt( maloaivacxin));
					request.setAttribute("thanhcong", "Thêm vacxin thành công");
				}

			}
			request.setAttribute("vacxin", v);
			RequestDispatcher rd = request.getRequestDispatcher("ShowAddVacxin");
			rd.forward(request, response);
		} catch (Exception tt) {
			response.getWriter().println("<html><body> Loi : " + tt.getMessage() + "</body><html>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
