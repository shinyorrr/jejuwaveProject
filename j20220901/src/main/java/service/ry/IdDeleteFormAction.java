package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MemberDao;
import service.CommandProcess;

public class IdDeleteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IdDeleteFormAction Start..");
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		try {
			String user_pw = request.getParameter("user_pw");
			String pageNum = request.getParameter("pageNum");
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(user_id);
			
			request.setAttribute("user_id", user_id);
			request.setAttribute("user_pw", user_pw);
			request.setAttribute("member", member);
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "ry/idDeleteForm.jsp";
	}

}
