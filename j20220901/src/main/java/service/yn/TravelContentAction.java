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
			
				System.out.println("TravelContentAction Service Start");
			
				int t_num = Integer.parseInt(request.getParameter("t_num"));
				String pageNum = request.getParameter("pageNum");
				
					
			try {
				TravelDao td = TravelDao.getInstance();
				Travel travel = td.select(t_num);
				System.out.println("requestPro travel ==>  " + travel);
				
				List<Travel> replyList = td.replyList(travel.getT_ref());
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("travelContent", travel);
				request.setAttribute("replyList", replyList);
				
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
				int revCurrentPage = Integer.parseInt(revPageNum);
				int revPageSize = 4, revBlockSize = 10;
				int revStartRow = (revCurrentPage - 1) * revPageSize + 1;
				int revEndRow = revStartRow + revPageSize - 1;
				int revStartNum = totRev - revStartRow + 1;
				System.out.println("revPageNum -->"+revPageNum);
				
				List<Review> revlist = rd.revList(revStartRow,revEndRow);
				int revPageCnt = (int)Math.ceil((double)totRev/revPageSize);
				int revStartPage = (int)(revCurrentPage-1)/revBlockSize*revBlockSize + 1;
				int revendPage = revStartPage + revBlockSize - 1;
				if (revendPage > revPageCnt) revendPage = revPageCnt;
				System.out.println("revlist -->"+totRev);
				request.setAttribute("revlist", revlist);
				request.setAttribute("totRev", totRev);
				request.setAttribute("revPageNum", revPageNum);
				request.setAttribute("revCurrentPage", revCurrentPage);
				request.setAttribute("revStartNum", revStartNum);
				request.setAttribute("revBlockSize", revBlockSize);
				request.setAttribute("revPageCnt", revPageCnt);
				request.setAttribute("revStartPage", revStartPage);
				request.setAttribute("revendPage", revendPage);
	
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
			
			return "yn/travelContent.jsp";
	}
}
