package service.yn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		return "yn/travelContent.jsp";
	}

}
