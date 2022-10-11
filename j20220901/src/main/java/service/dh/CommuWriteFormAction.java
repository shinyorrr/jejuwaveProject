package service.dh;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommandProcess;

public class CommuWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuWriteFormAction start...");
		//get session
		HttpSession session = request.getSession();
		String sessionUser_id = (String) session.getAttribute("user_id");
		//session check
		if (sessionUser_id == null || sessionUser_id.equals("")) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("ch/loginForm.jsp");
			dispatcher.forward(request, response);
		}
		try {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			request.setAttribute("sessionUser_id", sessionUser_id);
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			System.out.println("CommuWriteFormAction try..." + e.getMessage());
		}
		return "dh/commuWriteForm.jsp";
	}

}
