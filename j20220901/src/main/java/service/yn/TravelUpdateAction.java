package service.yn;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			System.out.println("TravelUpdateAction Service Start");
		
			int t_num = Integer.parseInt(request.getParameter("t_num"));
			
		try {
			TravelDao td = TravelDao.getInstance();
			Travel travel = td.select(t_num);
			System.out.println("TravelUpdateAction requestPro travel ==>  " + travel);
			
			
			travel.setT_content(travel.getT_content().replace("<br>", "\r\n"));
			request.setAttribute("travelContent", travel);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
			
		return "yn/travelUpdate.jsp";
	}

}
