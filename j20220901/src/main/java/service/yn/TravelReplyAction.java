package service.yn;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.*;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

import org.apache.commons.fileupload.*;

public class TravelReplyAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			Travel result = null;
		
			TravelDao td = TravelDao.getInstance();
			try {
				Travel travel = new Travel();
				HttpSession session = request.getSession();
				
				String user_id = session.getAttribute("user_id").toString();
				System.out.println("session===========>"+ user_id);
				System.out.println("t_num======>" + request.getParameter("t_num"));
				travel.setUser_id		(user_id);
				travel.setT_ref			(Integer.parseInt(request.getParameter("t_num")));
				travel.setT_content		(request.getParameter("t_content").replace("\r\n","<br>"));
				travel.setT_relevel		(Integer.parseInt(request.getParameter("t_relevel")));
				
				System.out.println("reply set 완료");
				//t_num 최대값 구해오기
				int maxNum = td.getMaxT_num();
				
				travel.setT_num(maxNum);

				if(request.getParameter("t_restep") == null) {
					//t_restep 최대값 구해오기
					int maxStep = td.getMaxT_restep(Integer.parseInt(request.getParameter("t_num")));
					travel.setT_restep		(maxStep);
				} else {
					travel.setT_restep		(Integer.parseInt(request.getParameter("t_restep")));
				}
					
				
				//댓글 INSERT 
				result = td.insert(travel);
				System.out.println("travle reply 완료");
				
				
				//출력값 SETTING
				request.setAttribute("result", result.getResult());
				request.setAttribute("t_num", Integer.parseInt(request.getParameter("t_num")));
				
				
			} catch (Exception e) {
				System.out.println("나는 reply 에러");
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		return "yn/travelReplyPro.jsp";
	}

}
