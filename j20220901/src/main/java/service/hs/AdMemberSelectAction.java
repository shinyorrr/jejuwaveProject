package service.hs;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDao;
import dao.Member;
import service.CommandProcess;

public class AdMemberSelectAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("AdMemberSelectAction service start...");
		
		request.setCharacterEncoding("utf-8"); 
		response.setContentType("text/html;charset=utf-8");
		
		String keyField = request.getParameter("keyField");
		String keyWord  = request.getParameter("keyWord");
		System.out.println("keyField->"+keyField);
		System.out.println("keyWord->"+keyWord);
		
		AdminDao ad = AdminDao.getInstance();
		try {
			List<Member> list = ad.memSelect(keyField, keyWord);
			
			
			request.setAttribute("list", list);
			request.setAttribute("keyField", keyField);
			request.setAttribute("keyWord", keyWord);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "hs/adMemberSelect.jsp";
	}

}
