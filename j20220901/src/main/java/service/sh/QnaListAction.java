package service.sh;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import service.CommandProcess;

public class QnaListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("ListAction Service start...");
		
		Qna_BoardDao bd = Qna_BoardDao.getInstance();
		
		try {
			int totCnt = bd.getTotalCnt();   // 37
			request.setAttribute("totCnt", totCnt);
			List<Qna_Board> list = bd.boardList(); 
			request.setAttribute("list", list);   // ***

		} catch (Exception e) {
			System.out.println("ListAction e.getMessage()->"+e.getMessage());
		}
  
		return "sh/qnaList.jsp";
	}

}
