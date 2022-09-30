package service.yn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.eclipse.jdt.internal.compiler.ast.TryStatement;

import dao.Travel;
import dao.TravelDao;

public class TravelListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		System.out.println("ListAction Service Start");
		TravelDao td = TravelDao.getInstance();
	
	try {
		int totCnt = td.getTotalCnt();
	
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")) {pageNum ="1";}
		int currentPage = Integer.parseInt(pageNum);
		int pageSize = 8, blockSize = 8;
		int startRow = (currentPage - 1) * pageSize + 1;  // 1     10   
		int endRow   = startRow + pageSize - 1;           // 11    20 
		int startNum = totCnt - startRow + 1; 
			
		List<Travel> travel = td.traveList(startRow, endRow);
		
		int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
		
		int startPage = (int)(currentPage - 1)/blockSize*blockSize + 1;
		int endPage = startPage + blockSize - 1;
		if(endPage > pageCnt) endPage = pageCnt;
		
		request.setAttribute("travel", 		travel);
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
		return "travelListForm.jsp";
	}
}
