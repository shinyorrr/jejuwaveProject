package service.ch;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Member;
import dao.MypageDao;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		MypageDao my = MypageDao.getInstance();
		
		String returnpage = null;
		
		try {
			String img = my.imageSelect(user_id);
			int result = my.check(user_id,user_pw);
			Member member = my.select(user_id);

			
			if(result > 0) {
				String img_sub = img.substring(9);
				HttpSession session = request.getSession();
				// 유저 아이디 및 이미지 불러오기 위한 작업
				session.setAttribute("user_id", user_id);
				session.setAttribute("img", img);
				session.setAttribute("img_sub", img_sub);
				System.out.println("LoginAction img_sub ==>" + img_sub);
				System.out.println("LoginAction img ==> " + img);
				session.setAttribute("user_pw", user_pw);
				
				// 관리자 페이지 구분하기 위함
				session.setAttribute("user_gubun", member.getUser_gubun());
				System.out.println("LoginAction session ==>" + session.getAttribute(img_sub));
			}
			
			request.setAttribute("user_gubun", member.getUser_gubun());
			request.setAttribute("user_pw", user_pw);
			request.setAttribute("result", result);
		} catch (SQLException e) {
			e.printStackTrace();
		}  
		
		return "ch/loginPro.jsp";
	}

}
