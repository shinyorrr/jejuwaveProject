package service.yn;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		System.out.println("=====================TravelDeleteAction Service Start=====================");
		
		int t_num = Integer.parseInt(request.getParameter("t_num"));
		int t_ref = Integer.parseInt(request.getParameter("t_ref"));
		int t_relevel = Integer.parseInt(request.getParameter("t_relevel"));
		
		System.out.println("TravelDeleteAction requestPro t_num = " + t_num);
		System.out.println("TravelDeleteAction requestPro t_ref = " + t_ref);
		try {
			TravelDao td = TravelDao.getInstance();
			int result = 0;
			
			
			if(t_relevel > 0) {
				//댓글 삭제인 경우
				result = td.deleteReply(t_num);
			} else {
				//Content 삭제인 경우
				result = td.delete(t_num);
			}
			
			
			System.out.println("TravelDeleteAction requestPro travel ==>  " + result);
			request.setAttribute("result", result);
			request.setAttribute("t_num", t_num);
			request.setAttribute("t_ref", t_ref);
			
			System.out.println("=====================TravelDeleteAction Service End=====================");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
			
		return "yn/travelDelete.jsp";
	}

}

