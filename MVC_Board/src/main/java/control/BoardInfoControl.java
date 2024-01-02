package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/")
public class BoardInfoControl extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = new BoardDTO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		bdto = bdao.getOneBoard(num);
		
		request.setAttribute("num", bdto.getNum());
		request.setAttribute("writer", bdto.getWriter());
		request.setAttribute("email", bdto.getEmail());
		request.setAttribute("subject", bdto.getSubject());
		request.setAttribute("reg_date", bdto.getReg_date());
		request.setAttribute("ref", bdto.getRef());
		request.setAttribute("re_step", bdto.getRe_step());
		request.setAttribute("re_level", bdto.getRe_level());
		request.setAttribute("readcount", bdto.getReadcount());
		request.setAttribute("content", bdto.getContent());
		
		RequestDispatcher rd = request.getRequestDispatcher("BoardInfo.jsp");
		rd.forward(request, response);
	}
}
