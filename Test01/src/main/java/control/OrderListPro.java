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

@WebServlet("/OrderListPro.do")
public class OrderListPro extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		JangDAO jdao = new JangDAO();
		JangDTO jdto = new JangDTO();
		ArrayList<JangDTO> aList = new ArrayList<>();
		
		String loginId = request.getParameter("loginId");
		String chk = request.getParameter("chk");
		String chkArr[] = chk.split(" ");
		
		if(chk!=null && !chk.isEmpty()) {
			for(int i=0;i<chkArr.length;i++) {
				int check = Integer.parseInt(chkArr[i]);
				jdto = jdao.getJangSelect(check);
				
				aList.add(jdto);
				
			}
		}else { // 선택된 상품이 없을 때 주문 시 예외처리
			request.setAttribute("msgChk", "상품을 선택하세요");
			RequestDispatcher rd = request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
		}
		
		request.setAttribute("aList", aList);
		RequestDispatcher rd = request.getRequestDispatcher("RentCarMain.jsp?sectionChange=OrderList.jsp");
		rd.forward(request, response);
	}
}
