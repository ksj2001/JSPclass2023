package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BuyDTO;
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
		
		// 물건을 구매한 적이 있는 회원의 배송지 정보를 떠넘기는 코드
		BuyDTO bdto = new BuyDTO();
		bdto = jdao.getOneAddress(loginId);
		// 이미 물건을 구매한 회원의 로그인 아이디와 order_address의 아이디를 비교한다.
		if(loginId.equals(bdto.getId())) {
			String phone02 = bdto.getBuy_phone().substring(4, 8);
			String phone03 = bdto.getBuy_phone().substring(9, 13);
			
			int stringNum = bdto.getBuy_roadaddress().indexOf("   ");
			String roadAddress = bdto.getBuy_roadaddress().substring(0, stringNum);
			String detailAddress = bdto.getBuy_roadaddress().substring(stringNum+3);
			
			request.setAttribute("bdto", bdto);
			request.setAttribute("phone02", phone02);
			request.setAttribute("phone03", phone03);
			request.setAttribute("roadAddress", roadAddress);
			request.setAttribute("detailAddress", detailAddress);
		}
		
		request.setAttribute("aList", aList);
		RequestDispatcher rd = request.getRequestDispatcher("RentCarMain.jsp?sectionChange=OrderList.jsp");
		rd.forward(request, response);
	}
}
