package service.hs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.Commu;
import dao.Member;
import service.CommandProcess;

public class AdCommuDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdCommuDeleteAction service start...");
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		System.out.println("AdCommuDeleteAction c_num->"+c_num);
		String pageNum = request.getParameter("pageNum");
		
		try {
			AdminDao ad = AdminDao.getInstance();
			int result = ad.commuDelete(c_num);
			
			request.setAttribute("c_num", c_num);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "hs/adCommuDelete.jsp";
	}

}
