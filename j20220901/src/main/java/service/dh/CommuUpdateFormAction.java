package service.dh;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Commu;
import dao.CommuDao;
import service.CommandProcess;

public class CommuUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); String user_id = (String)
		 * session.getAttribute("user_id"); if (user_id == null) {
		 * 
		 * }
		 */
		//session check는 jsp페이지에서 javascript 함수로 확인함
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		String pageNum = request.getParameter("pageNum");
		try {
			CommuDao cd = CommuDao.getInstance();
			Commu commu = cd.select(c_num);
			//수정 전 이미지 List select dao 요청
			List<Commu.CommuImg> imgList = cd.selectImg(c_num);
			//setAttribute
			request.setAttribute("c_num"  , c_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("commu"  , commu);
			request.setAttribute("imgList", imgList);
			System.out.println("imgList->" + imgList);
		} catch (Exception e) {
			System.out.println("select, set try" + e.getMessage());
		}
		return "dh/commuUpdateForm.jsp";
	}

}
