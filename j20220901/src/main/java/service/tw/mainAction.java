package service.tw;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class mainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("mainAction Service start...");
		request.setCharacterEncoding("utf-8");
		Qna_BoardDao bd = Qna_BoardDao.getInstance();
		TravelDao td = TravelDao.getInstance();
		
		// 검색 기능
		String column = request.getParameter("column");
		String search = request.getParameter("search");
		String isSearch = "n";
		
		if( column != null || search != null || !column.equals("")|| !search.equals("")) {isSearch = "y";}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("column", column);
		map.put("Search", search);
		map.put("isSearch", isSearch);
		Travel travel = new Travel();
		List<Travel> list = td.search(map);
		
		
		
		// QnA 게시판
		try {
			int totCnt = bd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {pageNum = "1"; }
			int currentPage = Integer.parseInt(pageNum);		// 1
			int pageSize = 2, blockSize = 3;					// 갯수 2, 페이지 3
			int startRow = (currentPage - 1) * pageSize + 1;	// 1
			int endRow = startRow + pageSize - 1;				// 2
			
			// Board 조회
			List<Qna_Board> list = bd.mainbdlist(startRow, endRow);
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
		
		//동행자 게시판
		try {
			int totCnt = td.getTotalCnt();
		
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals("")) {pageNum ="1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 4, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;  // 1     10   
			int endRow   = startRow + pageSize - 1;           // 11    20 
			int startNum = totCnt - startRow + 1; 
				
			List<Travel> travel = td.traveList(startRow, endRow);
			System.out.println("ListAction Service totCnt-->"+totCnt);
			System.out.println("ListAction Service travel.size()-->"+travel.size());
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			
			int startPage = (int)(currentPage - 1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if(endPage > pageCnt) endPage = pageCnt;
				
			request.setAttribute("travelList", 	travel);
			request.setAttribute("totCnt", 		totCnt);
			request.setAttribute("pageNum", 	pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", 	startNum);
			request.setAttribute("blockSize", 	blockSize);
			request.setAttribute("pageCnt", 	pageCnt);
			request.setAttribute("startPage", 	startPage);
			request.setAttribute("endPage", 	endPage);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		// 검색 기능 (동행자 게시판)
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return "main.jsp";
	}

}
