package service.ch;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Mypage;
import dao.MypageDao;
import service.CommandProcess;

public class MypageTravelerAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("mypageBoardAction Service start.....");
		
		 // 세션값 받아오기
		 int t_dealstatus = 0;
		 HttpSession session = request.getSession();
		 String user_id = (String) session.getAttribute("user_id");
		 System.out.println("값이 넘어오는지 확인하기 : " + request.getParameter("t_dealstatus"));
		 if(request.getParameter("t_dealstatus") != null) {
			 t_dealstatus = Integer.parseInt(request.getParameter("t_dealstatus"));
		 } else t_dealstatus = 1;
		 System.out.println("session 값 : "  + user_id);
		 MypageDao my = MypageDao.getInstance();
		 
		 try {
			 int totCnt = my.getTotalCnt(user_id);
			 String pageNum = request.getParameter("pageNum"); 
			 if(pageNum==null || pageNum.equals("") || pageNum.equals("0")){pageNum = "1";}
			 int currentPage = Integer.parseInt(pageNum);
			 int pageSize = 6 , blockSize = 10;
			 int startRow = (currentPage - 1) * pageSize + 1;
			 int endRow = startRow + pageSize -1;
			 int startNum = totCnt - startRow + 1;
			 System.out.println(startRow); // 작성자가 쓴 글 조회
			 List<Mypage> list =my.travelList(user_id,startRow,endRow,t_dealstatus);
			 
			 
		 int pageCnt = (int) Math.ceil((double)totCnt/pageSize);
		 System.out.println("");
		 
		 int startPage = (int)(currentPage-1)/blockSize*blockSize + 1; 
		 int endPage = startPage + blockSize - 1;
		 System.out.println("MypageTravelerAction endpage"+ endPage);
		 
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
		  
		 } catch(Exception e) { 
			 System.out.println("MypageBoardAction 오류 -->" + e.getMessage());
		 	}
		

		return "ch/mypageTraveler.jsp";
	}

}
