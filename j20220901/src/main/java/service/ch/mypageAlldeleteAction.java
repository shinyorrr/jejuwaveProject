package service.ch;

import java.io.IOException;
import java.util.Arrays;

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
		String[] chk_com		= request.getParameterValues("chk_com");
		
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
		}  else if(chk_com != null) {
			
			// checkbox에서 받은 두개의 값을 자르기 위한 작업
			String chk_com1 = Arrays.toString(chk_com);
			System.out.println("mypageAlldeleteAction chk_com1 ==> " + chk_com1); 
			String newchk = chk_com1.replace(" ", "")
							.replace("[", "")
							.replace("]", "");
			System.out.println("mypageAlldeleteAction newchk ==> " + newchk); 
			String [] com_result = newchk.split(",");
			
			System.out.println("mypageAlldeleteAction com_result ==> " + com_result);
			System.out.println("mypageAlldeleteAction com_result 길이 ==> " + com_result.length);
			
			MypageDao mypageDao = MypageDao.getInstance();
			result = mypageDao.ComAllDel(com_result);
			if(result == 1) result = 5;
		}
		
		
		
		request.setAttribute("result", result);
		
		
		
		return "ch/allDel.jsp";
	}

}
