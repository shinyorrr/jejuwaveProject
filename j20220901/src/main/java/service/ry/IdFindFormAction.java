package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFindFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IdFindFormAction");
		
		try {
			String user_id = request.getParameter("user_id");
			String user_name = request.getParameter("user_name");
			String user_date = request.getParameter("user_date");
			String user_email = request.getParameter("user_email");
			String user_tel = request.getParameter("user_tel");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
