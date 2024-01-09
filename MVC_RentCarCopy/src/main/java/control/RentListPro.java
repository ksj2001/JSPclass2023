package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.RentDAO;
import model.RentDTO;

@WebServlet("/RentListPro.do")
public class RentListPro extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모든 RentCar 상품 목록 보기
		RentDAO rdao = new RentDAO();
		ArrayList<RentDTO> aList = rdao.getAllCar();
		
		request.setAttribute("aList", aList);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?sectionChange=RentList.jsp");
		rd.forward(request, response);
	}
}
