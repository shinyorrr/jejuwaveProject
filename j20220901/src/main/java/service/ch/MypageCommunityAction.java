package service.ch;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Mypage;
import dao.MypageDao;
import service.CommandProcess;

public class MypageCommunityAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("MypageCommunityAction session 값 : " + user_id);
		MypageDao my = MypageDao.getInstance();
		
		// 검색 값 받아오기
		String search = request.getParameter("search");
		if(search == null) search = "fail";
		
		
		try {
			int totCnt = my.getTotalCntCommunity(user_id,search);
			String pageNum = request.getParameter("pageNum");
			if(pageNum == null || pageNum.equals("") || pageNum.equals("0")) {pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 5, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;
			System.out.println("MypageCommunityAction => " + startPage );
			int endPage = startPage + blockSize - 1;
			// 작성자가 쓴 글 조회
			List<Mypage> list = my.communityList(user_id,startRow,endRow,search);
			
			if (endPage > pageCnt) endPage = pageCnt; 
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("startRow", startRow);
			request.setAttribute("endRow", endRow);
			request.setAttribute("list", list);
			request.setAttribute("startNum", startNum);
			request.setAttribute("endPage", endPage);
			
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "ch/mypageCommunity.jsp";
	}

}
