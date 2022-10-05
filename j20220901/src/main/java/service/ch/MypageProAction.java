package service.ch;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MypageDao;
import service.CommandProcess;

public class MypageProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 // 이미지 업로드
		  HttpSession session = request.getSession();
	      request.setCharacterEncoding("utf-8");
	      String user_img = (String) session.getAttribute("img");
	      MultipartRequest multi = null;
	      // 이미지 사이즈 설정
	      int sizeLimit  = 5 * 1024 * 1024;
	      
	      String savePath = request.getServletContext().getRealPath("/fileSave");
	      System.out.println("savePath ==== > " + savePath);
	      
	      String serverSaveFilename = "";
	      
	      multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8" , new DefaultFileRenamePolicy());
	      Enumeration en = multi.getFileNames();
	      while(en.hasMoreElements()) {
	         String parameterName = (String) en.nextElement();
	         // 서버에 저장된 파일 이름
	         serverSaveFilename = multi.getFilesystemName(parameterName);
	         System.out.println("serverSaveFilename ====> " + serverSaveFilename);
	      }
	      if(serverSaveFilename != null) {
	    	  user_img = "fileSave\\" + serverSaveFilename; 	
	      } 
	      
	      String user_info = multi.getParameter("user_info");
	      
	      String user_birth = multi.getParameter("user_birth");
	      
	      String user_tel = multi.getParameter("user_tel");
	      
	      String user_email = multi.getParameter("user_email1") + "@" + multi.getParameter("user_email2");
	      System.out.println("user_email2 ===> " + multi.getParameter("user_email2"));
	      System.out.println("user_email2 request ===> " + request.getParameter("user_email2"));
	      
	  	  session.setAttribute("img", user_img);
	      String user_id = (String) session.getAttribute("user_id");
	      
	      
	      int result;
	      try {
	         MypageDao mypageDao = MypageDao.getInstance();
	         result = mypageDao.update(user_img,user_info,user_birth,user_tel,user_email,user_id);
	         request.setAttribute("result", result);         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      

		
		return "ch/mypageUpdatePro.jsp";
	}

}
