package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypageDao;
import service.CommandProcess;

public class PwUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_pw = request.getParameter("pass2");
		// 유저 아아디 세션값 받기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		MypageDao mypageDao = MypageDao.getInstance();
		
		int result = mypageDao.pwUpdate(user_pw,user_id);
		System.out.println("PwUpdateAction result == >" + result);
		
		session.setAttribute("user_pw", user_pw);
		request.setAttribute("result", result);
		
		return "ch/passwordUpdate.jsp";
	}

}
