package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageSize = 5;
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
		
		int count = 0;
		int number = 0;
		
		int currentPage = Integer.parseInt(pageNum);
		
		BoardDAO bdao = new BoardDAO();
		count = bdao.getAllCount();
		
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		ArrayList<BoardDTO> aList = bdao.getAllBoard(startRow, pageSize);
		
		number = count - (currentPage - 1) * pageSize;
		
		int pageCount = 0;
		int pageBlock = 3;
		int startPage = 1;
		int endPage = 0;
		
		if(count>0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			
			if(currentPage % pageBlock != 0) {
				startPage = (currentPage / pageBlock) * pageBlock + 1;
			}else {
				startPage = ((currentPage / pageBlock)-1) * pageBlock + 1;
			}
			
			endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
		}
		
		request.setAttribute("aList", aList);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		RequestDispatcher rd = request.getRequestDispatcher("BoardList.jsp");
		rd.forward(request, response);
	}
}
