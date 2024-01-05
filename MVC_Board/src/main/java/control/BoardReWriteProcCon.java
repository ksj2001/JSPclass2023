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

@WebServlet("/BoardReWriteProcCon.do")
public class BoardReWriteProcCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		BoardDAO bdao = new BoardDAO();
		BoardDTO bdto = new BoardDTO();
		
		bdto.setWriter(request.getParameter("writer"));
		bdto.setSubject(request.getParameter("subject"));
		bdto.setEmail(request.getParameter("email"));
		bdto.setPassword(request.getParameter("password"));
		bdto.setContent(request.getParameter("content"));
		bdto.setRef(Integer.parseInt(request.getParameter("ref")));
		bdto.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bdto.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		
		bdao.reInsertBoard(bdto);
		
	//	RequestDispatcher rd = request.getRequestDispatcher("BoardListCon.do");
	//	rd.forward(request, response);
	//	forward를 사용할 경우 주소 표시줄에 있는 위치로 새로고침이 무한정 이루어지므로 insert를 사용하기에는 부적합하다.
	//	insert할 경우에는 sendRedirect로 보내서 통신을 종료시킨다. 
		response.sendRedirect("BoardListCon.do");
	}
}
