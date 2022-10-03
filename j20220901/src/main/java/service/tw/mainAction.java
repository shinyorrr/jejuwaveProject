package service.tw;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import service.CommandProcess;

public class mainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("mainAction Service start...");
		String returnpage = null;
		Qna_BoardDao bd = Qna_BoardDao.getInstance();
		
		try {
			int totCnt = bd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {pageNum = "1"; }
			int currentPage = Integer.parseInt(pageNum);		// 1
			int pageSize = 2, blockSize = 3;					// 갯수 2, 페이지 3
			int startRow = (currentPage - 1) * pageSize + 1;	// 1
			int endRow = startRow + pageSize - 1;				// 2
			
			// Board 조회
			List<Qna_Board> list = bd.boardList();
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);		//
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize -1;
			if(endPage > pageCnt) {
				endPage = pageCnt;
			}
			request.setAttribute("list", list);
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println("MainListAction e.getMessage() => "+e.getMessage());
		}
		

		HttpSession session = request.getSession(false);
		String user_id = (String) session.getAttribute("user_id");
		// session 없으면, mainLogin
		if (user_id != null) {
			returnpage = "mainLogin.jsp";
		// 있으면, main
		} else {
			returnpage = "main.jsp";
		}
		System.out.println("session-->" + user_id);
		System.out.println("returnpage :" + returnpage);
		return returnpage;
	}

}
