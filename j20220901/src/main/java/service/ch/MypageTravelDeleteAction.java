package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypageDao;
import service.CommandProcess;

public class MypageTravelDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MypageTravelDeleteAction 시작!!!");
		String t_num = request.getParameter("t_num");
		
		MypageDao mypageDao = MypageDao.getInstance();
		
		int result = mypageDao.deleteTraveler(t_num);
		
		request.setAttribute("result", result);
		return "ch/mypageTravelerDelte.jsp";
		
	}

}
