package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Comment;
import dao.Qna_CommentDao;
import service.CommandProcess;

public class QnaCommentDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Qna_Comment comment = new Qna_Comment();
			Qna_CommentDao cd = Qna_CommentDao.getInstance();
			
			int b_num = Integer.parseInt(request.getParameter("b_num"));
			int com_num = Integer.parseInt(request.getParameter("com_num"));
			
			int result = cd.delete(b_num, com_num);
			request.setAttribute("result", result);
			request.setAttribute("b_num", b_num);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return "sh/qnaCommentDelete.jsp";
	}

}
