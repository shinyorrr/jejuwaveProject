package service.dh;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class CommuWriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuWriteFormAction start...");
		
		try {
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			System.out.println("CommuWriteFormAction try..." + e.getMessage());
		}
		return "dh/commuWriteForm.jsp";
	}

}
