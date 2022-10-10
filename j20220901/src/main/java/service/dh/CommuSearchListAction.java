package service.dh;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Commu;
import dao.CommuDao;
import dao.Member;
import service.CommandProcess;

public class CommuSearchListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuListAction Start...");
		HttpSession session = request.getSession();
		String sessionUser_id = (String) session.getAttribute("user_id");
		String searchWord = request.getParameter("searchWord");
		System.out.println("action searchWord ->" + searchWord);
		CommuDao cd = CommuDao.getInstance();
		try {
			int totCnt = cd.searchTotalCnt(searchWord);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage  = Integer.parseInt(pageNum);
			int pageSize     = 9;
			int blockSize    = 10;
			int startRow     = (currentPage - 1) * pageSize + 1;
			int endRow       = startRow + pageSize - 1;
			int startNum     = totCnt   - startRow + 1;
			request.setAttribute("totCnt", totCnt);
			List<Commu> list = cd.CommuSearchList(searchWord, startRow , endRow);
			int pageCnt      = (int)Math.ceil((double)totCnt / pageSize);
			int startPage    = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage      = startPage + blockSize - 1;
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			
			//img list select dao 요청
			List<Commu.CommuImg> imgList = cd.searchListImg(searchWord, startRow , endRow);
			//userImage select dao 요청
			List<Member> userImgList = cd.searchUserImgList(searchWord, startRow , endRow);
			//set commu list
			request.setAttribute("list"        , list);
			request.setAttribute("totCnt"      , totCnt);
			request.setAttribute("pageNum"     , pageNum);
			request.setAttribute("currentPage" , currentPage);
			request.setAttribute("startNum"    , startNum);
			request.setAttribute("blockSize"   , blockSize);
			request.setAttribute("startPage"   , startPage);
			request.setAttribute("endPage"     , endPage);
			System.out.println("list ->" + list);
			//set session id
			request.setAttribute("sessionUser_id", sessionUser_id);
			//set commu imgList
			request.setAttribute("imgList", imgList);
			System.out.println("imgList" + imgList);
			//set commu list user_img list
			request.setAttribute("userImgList", userImgList);
			//set search word
			request.setAttribute("searchWord", searchWord);
		} catch (Exception e) {
			System.out.println("searchListAction try ..." + e.getMessage());
		}
		
		return "dh/commuSearchResult.jsp";
	}

}
