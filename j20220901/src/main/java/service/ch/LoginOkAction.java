package service.ch;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MypageDao;
import service.CommandProcess;

public class LoginOkAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		try {
			MypageDao my = MypageDao.getInstance();
			String img = my.imageSelect(user_id);
			request.setAttribute("user_id", user_id);
			request.setAttribute("img", img);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		String returnpage = null;
		if(user_id != null) {
			System.out.println("session"+ user_id);
			returnpage = "mainLogin.jsp";
		} else returnpage = "ch/loginForm.jsp";
		return returnpage;
	}

}
