package service.yn;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

			System.out.println("ListAction Service Start");
			TravelDao td = TravelDao.getInstance();
			
			//view에서 들어오는 입력값
			String pageNum = request.getParameter("pageNum");
			String t_dealstatus = request.getParameter("t_dealstatus");
			String t_start = request.getParameter("t_start");
			String t_end = request.getParameter("t_end");
			String t_gubun = request.getParameter("t_gubun");
			
			System.out.println("TravelListAction t_start ======>" + t_start);
			System.out.println("TravelListAction t_end ======>" + t_end);
			System.out.println("TravelListAction t_dealstatus ======>" + t_dealstatus);
			System.out.println("TravelListAction t_gubun ======>" + t_gubun);
			
		try {
			Travel tvl = new Travel();
			tvl.setT_start		(t_start);
			tvl.setT_end		(t_end);
			tvl.setT_dealstatus (t_dealstatus);
			tvl.setT_gubun		(t_gubun);
			
			
			int totCnt = td.getTotalCnt(tvl);
			
			if(pageNum == null || pageNum.equals("")) {pageNum ="1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 8, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;  // 1     10   
			int endRow   = startRow + pageSize - 1;           // 11    20 
			int startNum = totCnt - startRow + 1; 
			
			//출력값 LIST를 위한 변수
			List<Travel> travel = new ArrayList<>(); 
			
			//조회값 담기
			travel = td.traveListSearch(startRow, endRow, tvl);
			
			System.out.println("ListAction Service totCnt-->"+totCnt);
			System.out.println("ListAction Service travel.size()-->"+travel.size());
			
			int pageCnt = (int) Math.ceil((double)totCnt/pageSize);
			
			int startPage = (int)(currentPage - 1)/blockSize*blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if(endPage > pageCnt) endPage = pageCnt;
			
			System.out.println("Action totCnt  =>"		+ totCnt);
			System.out.println("Action pageNum  =>"		+ pageNum);
			System.out.println("Action currentPage  =>"	+ currentPage);
			System.out.println("Action startNum  =>"	+ startNum);
			System.out.println("Action blockSize  =>"	+ blockSize);
			System.out.println("Action pageCnt  =>"		+ pageCnt);
			System.out.println("Action startPage  =>"	+ startPage);
			System.out.println("Action endPage  =>"		+ endPage);
			System.out.println("Action t_dealstatus  =>"		+ t_dealstatus);
			System.out.println("Action t_start  =>"		+ t_start);
			System.out.println("Action t_end  =>"		+ t_end);
			
			request.setAttribute("travelList",		travel);
			request.setAttribute("totCnt",			totCnt);
			request.setAttribute("pageNum",			pageNum);
			request.setAttribute("currentPage",		currentPage);
			request.setAttribute("startNum",		startNum);
			request.setAttribute("blockSize",		blockSize);
			request.setAttribute("pageCnt",			pageCnt);
			request.setAttribute("startPage",		startPage);
			request.setAttribute("endPage",			endPage);
			request.setAttribute("t_dealstatus",	t_dealstatus);
			request.setAttribute("t_start",			t_start);
			request.setAttribute("t_end",			t_end);
//			request.setAttribute("t_start",		request.getParameter(t_gubun);
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "yn/travelList.jsp";
	
	}
}
