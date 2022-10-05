package service.hs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import service.CommandProcess;

public class AdQnaDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdQnaDeleteAction service start...");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		String pageNum = request.getParameter("pageNum");
		
		try {
			AdminDao ad = AdminDao.getInstance();
			int result = ad.qnaDelete(b_num);
			
			request.setAttribute("result", result);
			request.setAttribute("b_num", b_num);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs/adQnaDelete.jsp";
	}

}
