package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Comment;
import dao.Qna_CommentDao;
import service.CommandProcess;

public class QnaCommentWriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			Qna_Comment comment = new Qna_Comment();
			comment.setCom_content(request.getParameter("com_content"));
			comment.setB_num(Integer.parseInt(request.getParameter("b_num")));
			comment.setUser_id(request.getParameter("user_id"));
			Qna_CommentDao cd = Qna_CommentDao.getInstance();
			int result = cd.insert(comment);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "sh/qnaCommnetWrite.jsp";
	}

}
