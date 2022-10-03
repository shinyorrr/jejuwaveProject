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
			
		System.out.println("TravelDeleteAction Service Start");
		
		int t_num = Integer.parseInt(request.getParameter("t_num"));
		
		try {
			TravelDao td = TravelDao.getInstance();
			int result = td.delete(t_num);
			System.out.println("TravelDeleteAction requestPro travel ==>  " + result);
			request.setAttribute("result", result);
			request.setAttribute("t_num", t_num);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
			
		return "yn/travelDelete.jsp";
	}

}

