package service.ry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Member;
import dao.MemberDao;

public class JoinProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("JoinFormAction Start..");
		
		String pageNum = request.getParameter("pageNum");
		String user_id = request.getParameter("user_id"); 
		String user_pw = request.getParameter("user_pw");
		String user_email = request.getParameter("user_email");
		String user_name = request.getParameter("user_name");
		String user_info = request.getParameter("user_info");
		String user_birth = request.getParameter("user_birth");
		String user_gender = request.getParameter("user_gender");
		String user_tel = request.getParameter("user_tel");
		String user_img = request.getParameter("user_img");
		
		try {
			MemberDao md = MemberDao.getInstance();
			Member member = new Member();
			member.setUser_id(request.getParameter("user_id"));
			member.setUser_pw(request.getParameter("user_pw"));
			member.setUser_email(request.getParameter("user_email"));
			member.setUser_name(request.getParameter("user_name"));
			member.setUser_info(request.getParameter("user_info"));
			member.setUser_birth(request.getParameter("user_birth"));
			member.setUser_gender(request.getParameter("user_gender"));
			member.setUser_tel(request.getParameter("user_tel"));
			member.setUser_img(request.getParameter("user_img"));
			int result = md.insert(member);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "joinPro.jsp";
	}

}
