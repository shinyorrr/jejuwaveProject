package service.hs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import service.CommandProcess;

public class AdTravelDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdTravelDeleteAction service start...");
		int t_num     = Integer.parseInt(request.getParameter("t_num"));
		int t_relevel = Integer.parseInt(request.getParameter("t_relevel"));
		int pageNum   = Integer.parseInt(request.getParameter("pageNum"));
		
		try {
			AdminDao ad = AdminDao.getInstance();
			int result = 0;
			if( t_relevel == 0 ) {
				result = ad.travelDelete(t_num);
			}else {
				result = ad.travelReplyDelete(t_num);	
			}

			request.setAttribute("result", result);
			request.setAttribute("t_num", t_num);
			request.setAttribute("t_relevel", t_relevel);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs/adTravelDelete.jsp";
	}

}
