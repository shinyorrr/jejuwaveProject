package service.dh;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Commu;
import dao.Commu.CommuImg;
import dao.CommuDao;
import service.CommandProcess;

public class CommuWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
			 // 세션값 받아오기
			// HttpSession session = request.getSession();
			 //String user_id = (String) session.getAttribute("user_id");
			String user_id = "andew"; //임시 아이디
			CommuDao cd = CommuDao.getInstance();
			
			// community_img table insert pro
			System.out.println("img upload start...");
			int    maxSize     = 100 * 1024 * 1024;
			String imgFileSave = "dh/imgFileSave";
			String realPath    = request.getSession().getServletContext().getRealPath(imgFileSave);
			System.out.println("realPath ->" + realPath);
			//upload
			MultipartRequest multi = new MultipartRequest(request , realPath , maxSize , "utf-8" , new DefaultFileRenamePolicy());
			Enumeration      en    = multi.getFileNames();
			List<String> fileNames = new ArrayList<String>();
			// get path
			while (en.hasMoreElements()) {
				fileNames.add("imgFileSave\\" + multi.getFilesystemName((String)en.nextElement()));
			}
			// commuImg 에 path담기
			List<Commu.CommuImg> commuImgList = new ArrayList<Commu.CommuImg>();
			for (String fileName : fileNames) {
				Commu.CommuImg commuImg = new CommuImg();
				commuImg.setC_img_path(fileName);
				commuImgList.add(commuImg);
			}
			System.out.println("commuImgList->" + commuImgList);
			
			// community table insert pro
			Commu commu = new Commu();
			commu.setUser_id(user_id);
			commu.setC_content(multi.getParameter("c_content"));
			commu.setC_hash(multi.getParameter("c_hash"));
			System.out.println("writeActionPro user_id->" + user_id);
			System.out.println("writeActionPro c_content->" + multi.getParameter("c_content"));
			System.out.println("writeActionPro c_hash->" + multi.getParameter("c_hash"));
			// DAO insert 요청
			int[] results = cd.insert(commu , commuImgList);
			// request 객체에 result, pageNum
			request.setAttribute("results" , results);
			request.setAttribute("pageNum" , pageNum);
			System.out.println("results->" + results[0] + ", " + results[1]);
		} catch (Exception e) {
			System.out.println("CommuWriteProAction try...error" + e.getMessage());
		}
		return "dh/commuWritePro.jsp";
	}

}
