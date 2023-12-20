package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDTO;

@WebServlet("/Mproc.do") //MemberJoinMVC의 form 태그의 action 대상을 mapping한다.
public class MemberJoinProc extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MemberDTO mdto = new MemberDTO();
		String id = request.getParameter("id");
		mdto.setId(id);
		mdto.setPw(request.getParameter("pw"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setAddress(request.getParameter("address"));
		
		// jsp로 자료를 넘겨주기 위해서 setAttribute에 담아둬야 함
		request.setAttribute("mdto", mdto);
		
		// jsp를 호출해서 자료를 떠넘겨주려면 RequestDispatcher 객체를 반드시 선언해야 한다.
		RequestDispatcher rd = request.getRequestDispatcher("MemberView.jsp"); // 화면을 보여줄거면 .jsp, proc로 갈 것이면 .do
		rd.forward(request, response);
	}
}
