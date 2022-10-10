package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MypageDao;
import service.CommandProcess;

public class MypageCommunityDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String c_num = request.getParameter("c_num");

		
		MypageDao mypageDao = MypageDao.getInstance();
		
		int result = mypageDao.deleteCommunity(c_num);
		
		request.setAttribute("result", result);
		
		return "mypageCommunity.do";
	}

}
