package service.sh;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
			List<Qna_Comment> list = cd.commentList(b_num);
			
			List<Integer> inum = new ArrayList<Integer>(Arrays.asList(1,2,3,4));

			request.setAttribute("b_num", b_num);
			request.setAttribute("board", board);
			request.setAttribute("list", list);
			request.setAttribute("inum", inum);
			
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}

		//       View
		return "sh/qnaWriteCheck.jsp";
	}

}
