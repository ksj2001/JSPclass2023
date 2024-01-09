package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.RentDAO;

@WebServlet("/MemberLoginProc.do")
public class MemberLoginProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("id");
		String userPw = request.getParameter("pw");
		
		// userId와 userPw가 비어있을 때 예외처리
		if(userId!=null && !userId.isEmpty() && userPw!=null && !userPw.isEmpty()) {
			
			//userId와 userPw가 회원 id, pw와 일치하는지 예외처리
			RentDAO rdao = new RentDAO();
			String dbPw = rdao.getMemberPw(userId);
			if(userPw.equals(dbPw)) {
				//Session에 id를 setAttribute에 담아준다.
				HttpSession session = request.getSession(); //Servlet에서 session을 생성하는 방식
				session.setAttribute("loginId", userId);
				session.setAttribute("loginPw", userPw);
				
				RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("msg", "아이디와 패스워드를 확인하세요.");
				RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
				rd.forward(request, response);
			}

		}else {
			request.setAttribute("msg", "아이디와 패스워드를 입력하세요.");
			RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
		}
	}
}
