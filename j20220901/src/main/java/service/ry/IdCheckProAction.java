package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class IdCheckProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("IdCheckProAction Start..");
		System.out.println("request.getParameter(\"user_id\")-> "+request.getParameter("user_id"));
		String user_id = request.getParameter("user_id");
		String pageNum = request.getParameter("pageNum");
		try {
			MemberDao md = MemberDao.getInstance();
			int result = md.confirmId(user_id);			
			request.setAttribute("user_id", user_id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "idCheckPro.jsp";
	}

}
