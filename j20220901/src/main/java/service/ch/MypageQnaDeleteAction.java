package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Mypage;
import dao.MypageDao;
import service.CommandProcess;

public class MypageQnaDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String b_num = request.getParameter("b_num");
		
		MypageDao mypageDao = MypageDao.getInstance();
		
		int result = mypageDao.deleteboard(b_num);
		
		request.setAttribute("result", result);
		
		return "ch/mypageQnadelete.jsp";
		
		
	}

}
