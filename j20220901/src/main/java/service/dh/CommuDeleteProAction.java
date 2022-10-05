package service.dh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommuDao;
import service.CommandProcess;

public class CommuDeleteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int    c_num   = Integer.parseInt(request.getParameter("c_num"));
			String pageNum = request.getParameter("pageNum");
			System.out.println("DeProAc c_num->" + c_num);
			System.out.println("DeProAc pageNum->" + pageNum);
			CommuDao cd = CommuDao.getInstance();
			
			int result = cd.delete(c_num);
			System.out.println("DeProAc result->" + result);
			request.setAttribute("c_num"  , c_num);
			request.setAttribute("result" , result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println("commuDeleteProAction try...err->" + e.getMessage());
		}
		return "dh/commuDeletePro.jsp";
	}

}
