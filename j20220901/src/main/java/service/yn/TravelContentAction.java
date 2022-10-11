package service.yn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Review;
import dao.ReviewDao;
import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		System.out.println("=====================TravelContentAction Service Start=====================");
			
		//화면에서 들어오는 입력 파라미터
		int 	t_num 	= Integer.parseInt(request.getParameter("t_num"));
		String 	pageNum = request.getParameter("pageNum");
		
		System.out.println("=====================TravelContentAction 입력파라미터=====================");
		System.out.println("TravelListAction pageNum 		======> " + pageNum);            // 현재페이지   
		System.out.println("TravelListAction t_num 			======> " + t_num);              // 동행자글번호   
		System.out.println("====================================================================");	
		try {
			/**
			 * 동행글 조회 시작
			 */
			TravelDao td = TravelDao.getInstance();
			
			//동행자 글 조회
			Travel travel = td.select(t_num);
			
			//댓글 목록 조회
			List<Travel> replyList = td.replyList(travel.getT_ref());
			
			System.out.println("=====================TravelContentAction 출력값=====================");
			System.out.println("TravelContentAction 출력값[travel]  			=> "	+ travel);
			System.out.println("TravelContentAction 출력값[replyList]  		=> "	+ replyList);
			System.out.println("================================================================");
			
			/***************
			 * 출력값 셋팅   *
			 ***************/
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("travelContent", travel);
			request.setAttribute("replyList", replyList);
			System.out.println("=====================TravelContentAction Service End=====================");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
		// review Action
		System.out.println("review Action Start...");
		ReviewDao rd = ReviewDao.getinstance();
		try {
			int totRev = rd.getTotalRev();
			
			String revPageNum = request.getParameter("revPageNum");
			
			if (revPageNum == null || revPageNum.equals("")) {revPageNum = "1";}
			
			int revCurrentPage = Integer.parseInt(revPageNum); // 1
			int revPageSize = 15, revBlockSize = 10;
			int revStartRow = (revCurrentPage - 1) * revPageSize + 1; //  
			int revEndRow = revStartRow + revPageSize - 1;
			int revStartNum = totRev - revStartRow + 1;
			System.out.println("revPageNum -->"+revPageNum);
			
	
			// review 조회						1			4
			List<Review> revlist = rd.revList(revStartRow,revEndRow,t_num);
	
			int revPageCnt = (int)Math.ceil((double)totRev/revPageSize);
			//								1				10			10
			int revStartPage = (int)(revCurrentPage-1)/revBlockSize*revBlockSize + 1;
			//					1				10
			int revendPage = revStartPage + revBlockSize - 1;
			// 공갈 Page 방지
			if (revendPage > revPageCnt) revendPage = revPageCnt;
			
			// 평균 값 조회
			int avgReview = rd.select(t_num);
			
			// 받은 후기 갯수 
			int totalRev = rd.totalRev(t_num);
						
			System.out.println("revlist -->"+revlist);
			
			request.setAttribute("revlist", revlist);
			request.setAttribute("totRev", totRev);
			request.setAttribute("revPageNum", revPageNum);
			request.setAttribute("revCurrentPage", revCurrentPage);
			request.setAttribute("revStartNum", revStartNum);
			request.setAttribute("revBlockSize", revBlockSize);
			request.setAttribute("revPageCnt", revPageCnt);
			request.setAttribute("revStartPage", revStartPage);
			request.setAttribute("revendPage", revendPage);
			request.setAttribute("avgReview", avgReview);
			request.setAttribute("totalRev", totalRev);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	
		return "yn/travelContent.jsp";
	}
}
