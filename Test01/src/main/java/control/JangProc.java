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

@WebServlet("/JangProc.do")
public class JangProc extends HttpServlet {
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
		
		// 메뉴 줄에서 장바구니 클릭 시 no 값은 null이 되므로 이 경우에 대한 예외처리를 한다.
		if(request.getParameter("no") != null && !request.getParameter("no").isEmpty()) {
			
			int no = Integer.parseInt(request.getParameter("no"));
			int cnt = Integer.parseInt(request.getParameter("cnt"));
			
			jdto.setNo(no);
			jdto.setImg(request.getParameter("img"));
			jdto.setName(request.getParameter("name"));
			jdto.setCnt(cnt);
			jdto.setPrice(Integer.parseInt(request.getParameter("price")));
			
			// 장바구니에 중복으로 상품이 담기는 오류를 해결
			int count = jdao.getNoCount(no);
			
			if(count==0) { // 장바구니에 선택한 상품이 없을 때 장바구니에 새로 추가(insert)한다.
				jdao.insertJang(jdto);
			}else { // 장바구니에 선택한 상품이 이미 존재하면 개수만 update 해준다.
				jdao.updateCnt1(cnt,no);
			}
		}
		
		ArrayList<JangDTO> jaList = jdao.getAllJang();
		request.setAttribute("jaList", jaList);
		
		RequestDispatcher rd = request.getRequestDispatcher("RentCarMain.jsp?sectionChange=JangList.jsp");
		rd.forward(request, response);
	}
}
