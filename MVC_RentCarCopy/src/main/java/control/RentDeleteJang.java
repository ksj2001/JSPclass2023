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
		
		ArrayList<JangDTO> jaList = jdao.getAllJang();
		request.setAttribute("jaList", jaList);
		
		RequestDispatcher rd = request.getRequestDispatcher("JangProc.do");
		rd.forward(request, response);
	}
}
