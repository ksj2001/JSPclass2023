package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.JangDAO;
import model.JangDTO;

@WebServlet("/RentDeleteJang.do")
public class RentDeleteJang extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JangDAO jdao = new JangDAO();
		JangDTO jdto = new JangDTO();
		
		String chk = request.getParameter("chk");
		String[] chkArr = chk.split(" "); // ex) chk = "1 2 3 ... " → chkArr = [1,2,3 ...]
		
		
		for(int i=0;i<chkArr.length;i++) {
			
			int check = Integer.parseInt(chkArr[i]);
			jdao.deleteJang(check);
			System.out.println(check);
		}
		
		// 장바구니의 레코드 전체 개수를 session에 담는다.
		int rentJangCount = jdao.getAllJangCount();
		HttpSession session = request.getSession();
		session.setAttribute("rentJangCount", rentJangCount);
		session.setMaxInactiveInterval(-1); // 무한정으로 세션이 종료되지 않는다.
		
		/*
		 * if(rentJangCount==0) { // session.invalidate(); }else {
		 * session.setAttribute("rentJangCount", rentJangCount);
		 * session.setMaxInactiveInterval(-1); // 무한정으로 세션이 종료되지 않는다. }
		 */
		
		ArrayList<JangDTO> jaList = jdao.getAllJang();
		request.setAttribute("jaList", jaList);
		
		RequestDispatcher rd = request.getRequestDispatcher("JangProc.do");
		rd.forward(request, response);
	}
}
