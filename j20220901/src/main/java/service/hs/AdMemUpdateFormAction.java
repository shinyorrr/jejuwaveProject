package service.hs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.Member;
import service.CommandProcess;

public class AdMemUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdMemUpdateFormAction service start...");
		String user_id = request.getParameter("user_id");
		System.out.println("AdMemUpdateFormAction user_id->"+user_id);
		String pageNum = request.getParameter("pageNum");
		
		try {
			AdminDao ad = AdminDao.getInstance();
			Member member = ad.select(user_id);
			
			request.setAttribute("user_id", user_id);
			request.setAttribute("member", member);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "hs/adMemUpdateForm.jsp";
	}

}
