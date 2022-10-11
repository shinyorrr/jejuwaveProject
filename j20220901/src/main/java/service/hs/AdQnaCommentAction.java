package service.hs;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.Qna_Comment;
import service.CommandProcess;

public class AdQnaCommentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdQnaContentAction service start...");
		
		int 	 b_num = Integer.parseInt(request.getParameter("b_num"));
		String pageNum = request.getParameter("pageNum");
		
		try {
			AdminDao ad = AdminDao.getInstance();
			
			// qna 게시글에 따른 댓글 수 
			int comtot = ad.getQnaComCnt(b_num);
			
			List<Qna_Comment> list = ad.qnaComList(b_num); 
			
			request.setAttribute("b_num", b_num);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("comtot", comtot);
			request.setAttribute("list", list);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "hs/adQnaComment.jsp";
	}

}
