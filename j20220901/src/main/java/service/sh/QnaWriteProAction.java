

package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
			String hashString = request.getParameter("hashString");
			System.out.println(hashString);
			
			//아이디 받아오기
			HttpSession session = request.getSession();
			String user_id = (String) session.getAttribute("user_id");
			System.out.println("user_id받아오기-->" + user_id);
			board.setUser_id(user_id);
			board.setB_title(request.getParameter("b_title"));
			board.setB_content(request.getParameter("b_content").replace("\r\n","<br>"));
			board.setB_theme(request.getParameter("b_theme"));
			
			Qna_BoardDao bd = Qna_BoardDao.getInstance();
			int result = bd.insert(board, hashString);
			
			System.out.println("QnaWriteProAction requestPro result -->"+result);
			request.setAttribute("result", result);
			request.setAttribute("b_num", board.getB_num());

			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "sh/qnaWritePro.jsp";
	}

}
