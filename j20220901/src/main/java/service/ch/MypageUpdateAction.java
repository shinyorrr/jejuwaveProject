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

public class MypageUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MypageInsertAction 실행");
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		
		try {
			MypageDao my = MypageDao.getInstance();
			Member member = my.select(user_id);
			request.setAttribute("user_id", user_id);
			request.setAttribute("member", member);
			System.out.println("MypageUpdateAction : " + member);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "ch/mypageUpdate.jsp";
	}

}
