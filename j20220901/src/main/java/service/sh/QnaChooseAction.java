package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_BoardDao;
import service.CommandProcess;

public class QnaChooseAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			int com_num= Integer.parseInt(request.getParameter("com_num"));
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			int result = bd.choose(b_num, com_num);
			request.setAttribute("result", result);
			request.setAttribute("b_num", b_num);
			//request.setAttribute("com_num", com_num);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
		return "sh/qnaChoose.jsp";
	}

}
