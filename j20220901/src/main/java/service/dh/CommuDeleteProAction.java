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
		// session check는 jsp 페이지에서 javascript function으로 체크함
		try {
			//get parameter
			int    c_num   = Integer.parseInt(request.getParameter("c_num"));
			String pageNum = request.getParameter("pageNum");
			System.out.println("DeProAc c_num->" + c_num);
			System.out.println("DeProAc pageNum->" + pageNum);
			//get dao instance
			CommuDao cd = CommuDao.getInstance();
			//delete dao 요청
			int result = cd.delete(c_num);
			System.out.println("DeProAc result->" + result);
			//setAttribute
			request.setAttribute("c_num"  , c_num);
			request.setAttribute("result" , result);
			request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			System.out.println("commuDeleteProAction try...err->" + e.getMessage());
		}
		return "dh/commuDeletePro.jsp";
	}

}
