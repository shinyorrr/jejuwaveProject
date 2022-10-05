package service.hs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import service.CommandProcess;

public class AdQnaComDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdQnaComDeleteAction service start...");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		int com_num = Integer.parseInt(request.getParameter("com_num"));
		System.out.println("com_num->"+com_num);
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		try {
			AdminDao ad = AdminDao.getInstance();
			int result = ad.qnaComDelete(b_num, com_num);
			
			request.setAttribute("b_num", b_num);
			request.setAttribute("com_num", com_num);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs/adQnaComDelete.jsp";
	}

}
