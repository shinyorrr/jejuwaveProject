package service.ch;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypageDao;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		MypageDao my = MypageDao.getInstance();
		
		try {
			int result = my.check(user_id,user_pw);
			if(result > 0) {
				HttpSession session = request.getSession();
				session.setAttribute("user_id", user_id);
			}
			request.setAttribute("user_id", user_id);
			request.setAttribute("user_pw", user_pw);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "ch/loginPro.jsp";
	}

}
