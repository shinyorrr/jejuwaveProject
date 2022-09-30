package service.tw;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

public class mainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("mainAction Service start...");
		String returnpage = null;

		HttpSession session = request.getSession(false);
		String user_id = (String) session.getAttribute("user_id");
		// session 없으면, mainLogin
		if (user_id != null) {
			returnpage = "mainLogin.jsp";
		// 있으면, main
		} else {
			returnpage = "main.jsp";
		}
		System.out.println("session-->" + user_id);
		System.out.println("returnpage :" + returnpage);
		return returnpage;
	}

}
