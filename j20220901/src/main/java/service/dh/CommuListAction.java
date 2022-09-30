package service.dh;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Commu;
import dao.CommuDao;
import service.CommandProcess;

public class CommuListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuListAction Start...");
		CommuDao cd = CommuDao.getInstance();
		try {
			int totCnt = cd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage  = Integer.parseInt(pageNum);
			int pageSize     = 4;
			int blockSize    = 10;
			int startRow     = (currentPage - 1) * pageSize + 1;
			int endRow       = startRow + pageSize - 1;
			int startNum     = totCnt   - startRow + 1;
			request.setAttribute("totCnt", totCnt);
			List<Commu> list = cd.CommuList(startRow , endRow);
			int pageCnt      = (int)Math.ceil((double)totCnt / pageSize);
			int startPage    = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage      = startPage + blockSize - 1;
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			request.setAttribute("list"        , list);
			request.setAttribute("totCnt"      , totCnt);
			request.setAttribute("pageNum"     , pageNum);
			request.setAttribute("currentPage" , currentPage);
			request.setAttribute("startNum"    , startNum);
			request.setAttribute("blockSize"   , blockSize);
			request.setAttribute("startPage"   , startPage);
			request.setAttribute("endPage"     , endPage);
			System.out.println("list ->" + list);
			
		} catch (Exception e) {
			System.out.println("commuListAction try ..." + e.getMessage());
		}
		
		return "dh/commuList.jsp";
	}

}
