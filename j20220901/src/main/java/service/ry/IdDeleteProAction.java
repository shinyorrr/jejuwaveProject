package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class IdDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IdDeleteProAction Start...");
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		System.out.println("IdDeleteProAction+user_id"+user_id);
		try {
			String user_pw = request.getParameter("user_pw");
			System.out.println("user_pw -> "+user_pw);
			String pageNum = request.getParameter("pageNum");
			
			MemberDao md = MemberDao.getInstance();
			int result = md.delete(user_id, user_pw);
			if(result==1) {
				session.invalidate(); 
			}
			request.setAttribute("user_id", user_id);
			request.setAttribute("user_pw", user_pw);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "ry/idDeletePro.jsp";
	}

}
