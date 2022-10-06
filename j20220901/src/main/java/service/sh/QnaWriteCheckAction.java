package service.sh;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		
		//아이디 받아오기
		HttpSession session = request.getSession();
		String user_id = (String) session.getAttribute("user_id");
		
		try {
			// 2. BoardDao bd Instance
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			Qna_CommentDao cd = Qna_CommentDao.getInstance();
			
			//글 리스트
			Qna_Board board = bd.select(b_num); 
			//댓글 리스트
			List<Qna_Comment> list = cd.commentList(b_num);
			Qna_Comment comment = cd.select(b_num);
			
			
			List<Integer> inum = new ArrayList<Integer>(Arrays.asList(1,2,3,4));

  
			
			

			request.setAttribute("b_num", b_num);
			
			//글리스트 ---> board
			request.setAttribute("board", board);		
			//댓글리스트 ---> list
			request.setAttribute("list", list);
			//로그인한 아이디 넘겨줌
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
