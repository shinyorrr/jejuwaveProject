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

public class MypageBoardAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 // 세션값 받아오기
		 HttpSession session = request.getSession();
		 String user_id = (String) session.getAttribute("user_id");
		 System.out.println("session 값 : "  + user_id);
		 
		 // 검색 값 받아오기
		 String search = request.getParameter("search");
		 if(search == null) search = "fail";
		 
		 
		 MypageDao my = MypageDao.getInstance();
		 
		 
		 try {
			 int totCnt = my.getTotalCntBoard(user_id);
			 String pageNum = request.getParameter("pageNum"); 
			 if(pageNum==null || pageNum.equals("") || pageNum.equals("0")){pageNum = "1";}
			 int currentPage = Integer.parseInt(pageNum);
			 int pageSize = 5 , blockSize = 10;
			 int startRow = (currentPage - 1) * pageSize + 1;
			 int endRow = startRow + pageSize -1;
			 int startNum = totCnt - startRow + 1;
			 System.out.println("MypageBoardAction : " + startRow); 
			 // 작성자가 쓴 글 조회
			 List<Mypage> list =my.boardList(user_id,startRow,endRow,search);
			 
		 int pageCnt = (int) Math.ceil((double)totCnt/pageSize);
		 
		 int startPage = (int)(currentPage-1)/blockSize*blockSize + 1; 
		 int endPage = startPage + blockSize - 1;
		 
		 if (endPage > pageCnt) endPage = pageCnt; 
		 request.setAttribute("totCnt",totCnt);
		 request.setAttribute("pageNum", pageNum);
		 request.setAttribute("currentPage", currentPage);
		 request.setAttribute("startNum", startNum);
		 request.setAttribute("list",list);
		 request.setAttribute("blockSize", blockSize);
		 request.setAttribute("startPage", startPage);
		 request.setAttribute("endPage", endPage);
		 request.setAttribute("user_id", user_id);
		 System.out.println("MypageBoardAction : " + list);
		  
		 } catch(Exception e) { 
			 System.out.println("MypageBoardAction 오류 -->" + e.getMessage());
		 	}
		 
		return "ch/mypageBoard.jsp";
	}

}
