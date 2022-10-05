package service.sh;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Qna_Board;
import dao.Qna_BoardDao;
import dao.Qna_Hash;
import service.CommandProcess;

public class QnaListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("QnAListAction Service start...");

		Qna_BoardDao bd = Qna_BoardDao.getInstance();

		try {
			int totCnt = bd.getTotalCnt(); 

			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			System.out.println("pageNum 출력");
			System.out.println(request.getParameter("pageNum"));
			System.out.println("pageNum 출력완료");
			
		
			int currentPage = Integer.parseInt(pageNum); // 1 2
			int pageSize = 5, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1; // 1 11
			int endRow = startRow + pageSize - 1; // 10 20
			int startNum = totCnt - startRow + 1; // 38- 11 +1 28

			System.out.println("ListAction startRow->" + startRow);
			System.out.println("ListAction endRow->" + endRow);

			List<Qna_Board> list = bd.getBoardList(startRow, endRow);

			int pageCnt = (int) Math.ceil((double) totCnt / pageSize); // 4
			// 2-1 / 10 *10 +1 //2
			int startPage = (int) (currentPage - 1) / blockSize * blockSize + 1; // 1 2
			int endPage = startPage + blockSize - 1; // 10 11
			// 공갈 page 방지 11> 4
			if (endPage > pageCnt)
				endPage = pageCnt;

			request.setAttribute("list", list);
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

		return "sh/qnaList.jsp";
	}

}
