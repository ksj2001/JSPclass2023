package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String userPw = request.getParameter("userPw");
		String dbPw = request.getParameter("dbPw");
		
		if(userPw.equals(dbPw)) {
			BoardDAO bdao = new BoardDAO();
			bdao.deleteBoard(num);
			
			request.setAttribute("msg", "1");
			RequestDispatcher rd = request.getRequestDispatcher("BoardListCon.do");
			rd.forward(request, response);
		}
		else {
			request.setAttribute("msg", "0");
			RequestDispatcher rd = request.getRequestDispatcher("BoardListCon.do");
			rd.forward(request, response);
		}
	}
}
