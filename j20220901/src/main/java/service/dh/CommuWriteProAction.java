package service.dh;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
			
			// insert dao에 보낼 community_img table setting(form value 받기)
			System.out.println("img upload start...");
			List<Commu.CommuImg> commuImgList = new ArrayList<Commu.CommuImg>();
			Collection<Part> parts = request.getParts(); // 모든 part들을 가져옴
			System.out.println("request.getParts ->" + parts);
			for (Part file : parts) {
				System.out.println("for start...");
				if(!file.getName().equals("file")) continue; // name이 file인 경우에만 실행
				// 사용자가 업로드한 파일 이름 알아오기
				String originName = file.getSubmittedFileName();
				//
				
				// 사용자가 업로드한 파일에 input stream 연결
				InputStream fis = file.getInputStream();
				// 저장할 경로
				String realPath = request.getServletContext().getRealPath("dh/imgFileSave");
				// 파일 경로
				String filePath = realPath + File.separator + originName;
				System.out.println("파일경로 filePath ->" + filePath);
				// 파일 저장
				FileOutputStream fos = new FileOutputStream(filePath);
				// table에 저장될 file path
				String imgPath = "dh/imgFileSave\\" + originName;
				byte[] buf = new byte[1024];
				int size = 0;
				while ((size = fis.read(buf)) != -1) {
					fos.write(buf, 0, size);
				}
				// commuImgList에 파일경로 setting
				Commu.CommuImg commuImg = new CommuImg();
				commuImg.setC_img_path(imgPath);
				commuImgList.add(commuImg);
				
				fis.close();
				fos.close();
				
			}
			System.out.println("after setting commuImgList ->" + commuImgList);
			// insert dao에 보낼 community table setting(form value데이터 받기)
			Commu commu = new Commu();
			commu.setUser_id(user_id);
			commu.setC_content(request.getParameter("c_content"));
			commu.setC_hash(request.getParameter("c_hash"));
			System.out.println("writeActionPro user_id->" + user_id);
			System.out.println("writeActionPro c_content->" + request.getParameter("c_content"));
			System.out.println("writeActionPro c_hash->" + request.getParameter("c_hash"));
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
