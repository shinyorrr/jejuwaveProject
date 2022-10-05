package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class IdFindProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("IdFindProAction Start-->");
		try {
			String user_id = request.getParameter("user_id");
			String user_name = request.getParameter("user_name");
			System.out.println("request.getParameter(\"user_name\")"+request.getParameter("user_name"));
			String user_email = request.getParameter("user_email");
			System.out.println("request.getParameter(\"user_email\")"+request.getParameter("user_email"));
			
			MemberDao md = MemberDao.getInstance();
			String id = md.findId(user_name, user_email); 
			
			request.setAttribute("user_name", user_name);
			request.setAttribute("user_email", user_email);
			request.setAttribute("user_id", user_id);
			request.setAttribute("id", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} 
		return "idFindPro.jsp";
	}
	}


