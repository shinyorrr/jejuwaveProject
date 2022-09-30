package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import service.CommandProcess;

public class QnaWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QnaWriteProAction start...");
		try {
			Qna_Board board = new Qna_Board();
			board.setB_num(Integer.parseInt(request.getParameter("b_num")));
			String b_theme = request.getParameter("b_theme");
			//로그인 기능 받아오고 나서!!!!!!!!!!!!!!!!!!!!!!
			//board.setUser_id(request.getParameter("user_id"));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
			board.setB_theme(request.getParameter("b_theme"));
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			int result = bd.insert(board);
			
			request.setAttribute("result", result);
			request.setAttribute("b_num", board.getB_num());

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "sh/qnaWritePro.jsp";
	}

}
