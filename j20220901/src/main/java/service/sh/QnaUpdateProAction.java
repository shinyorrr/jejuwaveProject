package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import service.CommandProcess;

public class QnaUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("updateProAction..");
		
		try {
			Qna_Board board = new Qna_Board();
			board.setB_num(Integer.parseInt(request.getParameter("b_num")));
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content"));
			board.setB_theme(request.getParameter("b_theme"));
			
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			int result = bd.update(board); 
			
			request.setAttribute("result", result);
			request.setAttribute("b_num", board.getB_num());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "sh/qnaUpdatePro.jsp";
		
	}

}
