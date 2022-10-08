package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypageDao;
import service.CommandProcess;

public class MypageCommentTravelDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String t_num = request.getParameter("t_num");
		System.out.println("t_num->"+t_num);
		
		try {
			MypageDao mypageDao = MypageDao.getInstance();
			int result = mypageDao.TravelComDelete(t_num);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "ch/mypageCommentTravelDel.jsp";
	}

}
