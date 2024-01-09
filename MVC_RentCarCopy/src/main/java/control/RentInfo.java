package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RentDAO;
import model.RentDTO;

@WebServlet("/RentInfo.do")
public class RentInfo extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		RentDAO rdao = new RentDAO();
		RentDTO rdto = rdao.getOneCar(no);
		
		request.setAttribute("rdto", rdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?sectionChange=RentInfo.jsp");
		rd.forward(request, response);
	}
}
