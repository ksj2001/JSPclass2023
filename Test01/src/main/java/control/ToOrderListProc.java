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
import model.ProductDTO;

@WebServlet("ToOrderListProc.do")
public class ToOrderListProc extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		JangDAO jdao = new JangDAO();
		ProductDTO pdto = new ProductDTO();
		BuyDTO bdto = new BuyDTO();
		ArrayList<ProductDTO> arr = new ArrayList<>();
		
		// OrderList.jsp에서 입력받은 값은 동시에 2개 이상 선택할 수 있으므로 배열에 저장한다.
		String[] no_arr = request.getParameterValues("no");
		String[] img_arr = request.getParameterValues("img");
		String[] name_arr = request.getParameterValues("name");
		String[] cnt_arr = request.getParameterValues("cnt");
		String[] price_arr = request.getParameterValues("price");
		
		// Order_product 테이블에 order_no 필드명의 값은 오늘 날짜와 order_date 날짜가 같으면 1씩 증가시키는 메서드로 작성한다.
		int order_no = jdao.orderNoSelect();
		
		String loginId = request.getParameter("loginId");
		String buy_name = request.getParameter("buy_name");
		String phone01 = request.getParameter("phone01");
		String phone02 = request.getParameter("phone02");
		String phone03 = request.getParameter("phone03");
		String email = request.getParameter("email");
		String postcode = request.getParameter("postcode");
		String roadAddress = request.getParameter("roadAddress");
		String detailAddress = request.getParameter("detailAddress");
		
		// order_product에 insert
		for(int i=0;i<no_arr.length;i++) {
			pdto.setOrder_date(pdto.getOrder_date());
			pdto.setOrder_no(order_no);
			pdto.setNo(Integer.parseInt(no_arr[i]));
			pdto.setImg(img_arr[i]);
			pdto.setName(name_arr[i]);
			pdto.setCnt(Integer.parseInt(cnt_arr[i]));
			pdto.setPrice(Integer.parseInt(cnt_arr[i]));
			pdto.setTotal(Integer.parseInt(cnt_arr[i]) * Integer.parseInt(cnt_arr[i]));
			pdto.setId(loginId);
			arr.add(pdto);
			jdao.productInsert(pdto);
		}
		
		// order_address에 insert
		bdto.setOrder_date(pdto.getOrder_date());
		bdto.setOrder_no(pdto.getOrder_no());
		bdto.setBuy_name(buy_name);
		bdto.setBuy_phone(phone01+"-"+phone02+"-"+phone03);
		bdto.setBuy_email(email);
		bdto.setBuy_postcode(Integer.parseInt(postcode));
		bdto.setBuy_roadaddress(roadAddress+"   "+detailAddress);
		bdto.setId(loginId);
		jdao.buyInsert(bdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("Main.jsp?sectionChange=ToOrderList.jsp");
		rd.forward(request, response);
	}
}
