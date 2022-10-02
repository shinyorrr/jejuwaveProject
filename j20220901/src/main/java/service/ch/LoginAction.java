package service.ch;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MypageDao;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		MypageDao my = MypageDao.getInstance();
		
		String returnpage = null;
		
		try {
			String img = my.imageSelect(user_id);
			int result = my.check(user_id,user_pw);
			Member member = new Member();
			int user_gubun = member.getUser_gubun();
			
			if(result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", user_id);
				session.setAttribute("img", img);
			}
			
			request.setAttribute("user_gubun", user_gubun);
			request.setAttribute("user_pw", user_pw);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "ch/loginPro.jsp";
	}

}
