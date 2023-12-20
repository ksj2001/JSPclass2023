package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDAO;
import model.MemberDTO;

@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// getAllMember를 ArrayList에 담는다.
		MemberDAO mdao = new MemberDAO();
		//MemberDTO mdto = new MemberDTO();
		
		ArrayList<MemberDTO> aList = mdao.getAllMember();
		request.setAttribute("aList", aList);
		RequestDispatcher rd = request.getRequestDispatcher("MemberList.jsp");
		rd.forward(request, response);
	}
}
