package service.sh;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class QnaWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QnaWriteFormAction start...");
		try {
			int b_num=0; 
			request.setAttribute("b_num", b_num);		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "qnaWriteForm.jsp";
	}

}
