package service.dh;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Commu;
import dao.CommuDao;
import dao.Member;
import service.CommandProcess;

public class CommuContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuContentAction Service start...");
		
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		String pageNum = request.getParameter("pageNum");
		
		try {
			CommuDao cd = CommuDao.getInstance();
			// community table dao
			Commu                commu   = cd.select(c_num);
			// community_img table dao
			List<Commu.CommuImg> imgList = cd.selectImg(c_num);
			// member table dao(select user_image)
			Member member = cd.selectUserImg(c_num);
			
			// setAttribute
			request.setAttribute("c_num"  , c_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("commu"  , commu);
			request.setAttribute("imgList", imgList);
			request.setAttribute("member" , member);
			System.out.println("imgList->" + imgList);
		} catch (Exception e) {
			System.out.println("select, set try" + e.getMessage());
		}
		return "dh/commuContent.jsp";
	}

}
