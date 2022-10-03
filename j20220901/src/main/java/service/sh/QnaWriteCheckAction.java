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
		// 회원이랑 연결하고 나면 !!!!  String user_id = request.getParameter("user_id");
		String user_id = "aaaa";
		
		try {
			// 2. BoardDao bd Instance
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			Qna_CommentDao cd = Qna_CommentDao.getInstance();

			List<Qna_Comment> list = cd.commentList(b_num);
			
			List<Integer> inum = new ArrayList<Integer>(Arrays.asList(1,2,3,4));


			Qna_Board board = bd.select(b_num);   
			Qna_Comment comment = cd.select(b_num);
			

			request.setAttribute("b_num", b_num);
			request.setAttribute("board", board);

			request.setAttribute("list", list);
			request.setAttribute("user_id", user_id);
			request.setAttribute("inum", inum);
			

			request.setAttribute("comment", comment);

		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}

		//       View
		return "sh/qnaWriteCheck.jsp";
	}

}
