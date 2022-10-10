package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypageDao;
import service.CommandProcess;

public class MypageCommentDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdQnaComDeleteAction service start...");
		String b_num = request.getParameter("b_num");
		String com_num = request.getParameter("com_num");
		System.out.println("com_num->"+com_num);
		
		try {
			MypageDao mypageDao = MypageDao.getInstance();
			int result = mypageDao.qnaComDelete(b_num, com_num);
			
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "ch/mypageCommentDelete.jsp";
	}

}
