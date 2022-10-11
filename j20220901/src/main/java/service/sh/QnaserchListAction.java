package service.sh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ch.CommandProcess;

public class QnaserchListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		try {
			
			request.getParameter("");
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		

		
		return "sh/qnaList.jsp" ;
	}

}