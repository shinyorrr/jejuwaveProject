package service.yn;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			int result = 0;
			
//			String saveFolder = "C:\\Jsp\\jspSrc\\jejuwave_1001\\src\\main\\webapp\\images\\upload\\";
			String savePath = request.getServletContext().getRealPath("/images/upload/");
			String encType = "utf-8";
			int maxSize = 5* 1024 *1024;
			
			TravelDao td = TravelDao.getInstance();
			
			try {
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
				Enumeration file = multi.getFileNames();
				String name = (String) file.nextElement();
				
				String filename = multi.getFilesystemName(name);
				String fullFolder = filename;
				
				
				Travel travel = new Travel();
				
				System.out.println("t_num===========>"+ multi.getParameter("t_num"));
				System.out.println("t_title===========>"+ multi.getParameter("t_title"));
				System.out.println("t_content===========>"+ multi.getParameter("t_content"));
				System.out.println("t_oriImg===========>"+ multi.getParameter("t_oriImg"));
				System.out.println("t_img2===========>"+ fullFolder);
				System.out.println("t_start===========>"+ multi.getParameter("t_start"));
				System.out.println("t_end===========>"+ multi.getParameter("t_end"));
				System.out.println("t_gubun==============>" + multi.getParameter("t_gubun"));
				System.out.println("t_gubun==============>" + multi.getParameter("t_person"));
				if(fullFolder == null ) {
					fullFolder = multi.getParameter("t_oriImg");
				} else {
					fullFolder = "images\\upload\\" +  fullFolder;
				}
				travel.setT_img			(fullFolder);
				travel.setT_title		(multi.getParameter("t_title"));
				travel.setT_num			(Integer.parseInt(multi.getParameter("t_num")));
				travel.setT_content		(multi.getParameter("t_content").replace("\r\n","<br>"));
				travel.setT_gubun		(multi.getParameter("t_gubun"));
				travel.setT_person		(Integer.parseInt(multi.getParameter("t_person")));
				travel.setT_start		(multi.getParameter("t_start"));
				travel.setT_end			(multi.getParameter("t_end"));
				
				result = td.update(travel);
				System.out.println("travle insert 완료");
				
				request.setAttribute("result", result);
				request.setAttribute("t_num", multi.getParameter("t_num"));
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
				System.out.println("나는 Update 에러");
				e.printStackTrace();
			}
		
		return "yn/travelUpdatePro.jsp";
	}

}
