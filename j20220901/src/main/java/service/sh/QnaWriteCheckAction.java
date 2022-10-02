package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import dao.Qna_Comment;
import dao.Qna_CommentDao;
import service.CommandProcess;


public class QnaWriteCheckAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("ContentAction Service start...");
		// 1. num , pageNum
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		try {
			// 2. BoardDao bd Instance
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			Qna_CommentDao cd = Qna_CommentDao.getInstance();
			
			Qna_Board board = bd.select(b_num);   
			Qna_Comment comment = cd.select(b_num);
			
			request.setAttribute("b_num", b_num);
			request.setAttribute("board", board);
			request.setAttribute("comment", comment);
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}

		//       View
		return "sh/qnaWriteCheck.jsp";
	}

}
