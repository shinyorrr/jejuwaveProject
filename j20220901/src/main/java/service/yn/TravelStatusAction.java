package service.yn;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelStatusAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		System.out.println("TravelStatusAction Service Start");
		
		int t_num = Integer.parseInt(request.getParameter("t_num"));
		
		try {
			TravelDao td = TravelDao.getInstance();
			int result = td.statusUpdate(t_num);
			System.out.println("TravelStatusAction requestPro travel ==>  " + result);
			request.setAttribute("result", result);
			request.setAttribute("t_num", t_num);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
			
		return "yn/travelStatus.jsp";
	}

}
