package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.JangDAO;
import model.JangDTO;

@WebServlet("/RentUpdate.do")
public class RentUpdate extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JangDAO jdao = new JangDAO();
		JangDTO jdto = new JangDTO();
		
		String btn = request.getParameter("btn");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int no = Integer.parseInt(request.getParameter("no"));
		
		jdao.updateCnt2(cnt,no);
		
		ArrayList<JangDTO> jaList = jdao.getAllJang();
		request.setAttribute("jaList", jaList);
		
		RequestDispatcher rd = request.getRequestDispatcher("RentCarMain.jsp?sectionChange=JangList.jsp");
		rd.forward(request, response);
	}
}
