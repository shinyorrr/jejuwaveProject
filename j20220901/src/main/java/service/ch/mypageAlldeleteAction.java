package service.ch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MypageDao;
import service.CommandProcess;

public class mypageAlldeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int result = 0;
		
		String[] chk_travel 	= request.getParameterValues("chk");
		String[] chk_commu 		= request.getParameterValues("commuChk");
		String[] chk_qna 		= request.getParameterValues("chk_qna");
		String[] chk_trvComment = request.getParameterValues("chk_trvComment");
		
		if(chk_travel != null) {
			System.out.println("mypageTrvAlldeleteAction chk_travel.length ==> " + chk_travel.length);
			
			/*
			 * for(int i = 0; i<chk_travel.length;i++) { MypageDao mypageDao =
			 * MypageDao.getInstance(); result = mypageDao.deleteTraveler(chk_travel[i]); }
			 */
			MypageDao mypageDao = MypageDao.getInstance();
			result = mypageDao.trvAllDel(chk_travel);
		}
		else if(chk_commu != null) {
			MypageDao mypageDao = MypageDao.getInstance();
			result = mypageDao.CommAllDel(chk_commu);
			if(result == 1) result = 2;
		} else if(chk_qna != null) {
			MypageDao mypageDao = MypageDao.getInstance();
			result = mypageDao.QnaAllDel(chk_qna);
			if(result == 1) result = 3;
		}  else if(chk_trvComment != null) {
			MypageDao mypageDao = MypageDao.getInstance();
			result = mypageDao.trvAllDel(chk_trvComment);
			if(result == 1) result = 4;
		} 
		
		
		
		request.setAttribute("result", result);
		
		
		
		return "ch/allDel.jsp";
	}

}
