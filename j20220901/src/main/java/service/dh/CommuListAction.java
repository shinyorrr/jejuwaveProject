package service.dh;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Commu;
import dao.CommuDao;
import dao.Member;
import service.CommandProcess;

public class CommuListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuListAction Start...");
		//get session
		HttpSession session = request.getSession();
		String sessionUser_id = (String) session.getAttribute("user_id");
		//get Dao Instance
		CommuDao cd = CommuDao.getInstance();
		try {
			//getTotalCount
			int totCnt = cd.getTotalCnt();
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage  = Integer.parseInt(pageNum);
			int pageSize     = 5;
			int blockSize    = 10;
			int startRow     = (currentPage - 1) * pageSize + 1;
			int endRow       = startRow + pageSize - 1;
			int startNum     = totCnt   - startRow + 1;
			request.setAttribute("totCnt", totCnt);
			//Commu list dao 요청
			List<Commu> list = cd.CommuList(startRow , endRow);
			int pageCnt      = (int)Math.ceil((double)totCnt / pageSize);
			int startPage    = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage      = startPage + blockSize - 1;
			if (endPage > pageCnt) {
				endPage = pageCnt;
			}
			//img list select dao 요청
			List<Commu.CommuImg> imgList     = cd.CommuListImg(startRow , endRow);
			//userImage select dao 요청
			List<Member>         userImgList = cd.selectUserImgList(startRow , endRow);
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
			//hash tag split
			List<String[]> hashList = new ArrayList<String[]>(); //hashTag 배열을 담을 List 초기화
			for (Commu commu : list) {
				String hashTags = commu.getC_hash();
				System.out.println("hashTags->" + hashTags);
				String[] hashTagArray = hashTags.trim().split("\\s+"); // 띄어쓰기로 구분 후 공백제거 후 배열에 담기
				System.out.println("hashTagArray[0] ->" + hashTagArray[0]);
				System.out.println("hashTagArray->" + hashTagArray);
				hashList.add(hashTagArray); //hashTag 배열을 List에 담기
			}
			request.setAttribute("hashList", hashList);
			System.out.println("hashList->" + hashList);
		} catch (Exception e) {
			System.out.println("commuListAction try ..." + e.getMessage());
		}
		
		return "dh/commuList.jsp";
	}

}
