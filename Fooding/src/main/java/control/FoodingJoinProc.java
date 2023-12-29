package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fooding.FoodingDAO;
import fooding.FoodingDTO;

@WebServlet("/FoodingJoinProc.do")
public class FoodingJoinProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		FoodingDAO fdao = new FoodingDAO();
		FoodingDTO fdto = new FoodingDTO();
		
		
		fdto.setName(request.getParameter("name"));
		// ID 중복체크
		String id = request.getParameter("id");
		fdto.setId(id);
		String checkId = fdao.oneCheckId(id);
				
		// PW 확인
		String pw = request.getParameter("pw");
		String checkPw = request.getParameter("pwchk");
		fdto.setPw(pw);
				
		fdto.setTel(request.getParameter("tel"));
		fdto.setEmail(request.getParameter("email"));
		fdto.setAddress(request.getParameter("address"));
				
		//예외처리 1) 아이디가 중복이면 alert 띄우기
		// 2) 패스워드가 일치하지 않으면 alert 띄우기
		// 3) 위의 조건을 모두 만족하면 insert 한다.
		if(id.equals(checkId) || id==null) {
			request.setAttribute("msgId", "이미 존재하는 아이디입니다.");
			RequestDispatcher rd = request.getRequestDispatcher("LoginIdError.jsp");
			rd.forward(request, response);
		}else if(!pw.equals(checkPw)) {
			request.setAttribute("msgPw", "패스워드가 일치하지 않습니다.");
			RequestDispatcher rd = request.getRequestDispatcher("LoginError.jsp");
			rd.forward(request, response);
		}else {
			fdao.insertFooding(fdto);
			RequestDispatcher rd = request.getRequestDispatcher("FoodingListCon.do");
			rd.forward(request, response);
		}
	}
}
