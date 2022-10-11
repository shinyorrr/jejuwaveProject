package service.hs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.Member;
import service.CommandProcess;

public class AdMemUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdMemUpdateProAction service start...");
		
		request.setCharacterEncoding("utf-8");
		String pageNum = request.getParameter("pageNum");
		int result;
		
		try {
			Member member = new Member();
			member.setUser_id(request.getParameter("user_id"));
			member.setUser_gubun(Integer.parseInt(request.getParameter("user_gubun")));
			
			
			AdminDao ad = AdminDao.getInstance();
			result 		= ad.update(member);
			request.setAttribute("result", result);
			request.setAttribute("user_id", member.getUser_id());
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs/adMemUpdatePro.jsp";
	}

}
