package service.sh;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import service.CommandProcess;

public class QnaUpdateFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("updateFormAction..");
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		
		try {
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			Qna_Board board = bd.select(b_num);
			request.setAttribute("board", board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "qnaUpdateForm.jsp";
	}

}
