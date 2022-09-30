package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

public class IdDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IdDeleteProAction Start...");
		
		try {
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String pageNum = request.getParameter("pageNum");
			
			MemberDao md = MemberDao.getInstance();
			int result = md.delete(user_id, user_pw);
			
			request.setAttribute("user_id", user_id);
			request.setAttribute("user_pw", user_pw);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
			
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "idDeletePro.jsp";
	}

}
