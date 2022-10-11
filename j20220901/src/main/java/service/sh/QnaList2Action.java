package service.sh;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import dao.Qna_Hash;
import service.CommandProcess;

public class QnaList2Action implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("QnAListAction Service start...");

		Qna_BoardDao bd = Qna_BoardDao.getInstance();
		
		try {
			int totCnt = bd.getTotalCnt(); 
			String pageNum = request.getParameter("pageNum");
			int sort = Integer.parseInt(request.getParameter("sort"));  //정렬 번호 받기 1. 등록순 2. 댓글갯수순
		
		
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
				
			int currentPage = Integer.parseInt(pageNum); // 1 2
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1; // 1 11
			int endRow = startRow + pageSize - 1; // 10 20
			int startNum = totCnt - startRow + 1; // 38- 11 +1 28

			List<Qna_Board> list = bd.getBoardList2(startRow, endRow, sort);

			int pageCnt = (int) Math.ceil((double) totCnt / pageSize); // 4
			// 2-1 / 10 *10 +1 //2
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1; // 1 2
			int endPage = startPage + blockSize - 1; // 10 11
			// 공갈 page 방지 11> 4
			if (endPage > pageCnt)			endPage = pageCnt;


			request.setAttribute("list", list); //게시글 리스트 넘겨주기
			request.setAttribute("sort", sort); //정렬방식 넘겨주기
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);

		} catch (Exception e) {
			System.out.println("Qna ListAction e.getMessage()->" + e.getMessage());
		}

		return "sh/qnaList2.jsp";
	}

}
