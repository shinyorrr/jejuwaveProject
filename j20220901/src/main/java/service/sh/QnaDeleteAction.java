package service.sh;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import service.CommandProcess;

public class QnaDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			int result = bd.delete(b_num);
			request.setAttribute("b_num", b_num);
			request.setAttribute("result", result );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}

		return "sh/qnaDelete.jsp";
	}

}
