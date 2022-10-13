package service.tw;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Review;
import dao.ReviewDao;
import service.CommandProcess;

public class reviewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("reviewAction start...");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		String user_id = session.getAttribute("user_id").toString();
		System.out.println("user_id ====>"+ user_id);
		Review review = new Review();
		System.out.println("request.getParameter(\"r_avg\")=========>" +request.getParameter("r_avg"));
		System.out.println("request.getParameter(\"r_content\"=========>"+request.getParameter("r_content"));
		System.out.println("Integer.parseInt(request.getParameter(\"t_num\")=========>"+Integer.parseInt(request.getParameter("t_num")));
		review.setR_content(request.getParameter("r_content"));
		review.setR_avg(Integer.parseInt(request.getParameter("r_avg")));
		review.setUser_id(user_id);
		review.setT_num(Integer.parseInt(request.getParameter("t_num")));
		System.out.println(review.getT_num());
		
		ReviewDao rd = ReviewDao.getinstance();
		int result = 0;
		try {
			result = rd.insert(review);
			request.setAttribute("result", result);
			request.setAttribute("t_num", Integer.parseInt(request.getParameter("t_num")));
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return "tw/reviewPro.jsp";
	}

}
