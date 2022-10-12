package service.dh;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
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
			//get parameter
			String pageNum = request.getParameter("pageNum");
			String user_id = request.getParameter("user_id");
			//get dao instance
			CommuDao cd = CommuDao.getInstance();
			// insert dao에 보낼 community_img table setting(form value 받기)
			System.out.println("img upload start...");
			List<Commu.CommuImg> commuImgList = new ArrayList<Commu.CommuImg>(); //이미지 담을 List
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMddHHmmssZ"); 
			String currentDate = simpleDateFormat.format(new Date()); // 이미지 파일 이름에 추가할 시간정보
			//part 인터페이스를 사용해 mulipart형식으로 보내진 데이터들 받기
			Collection<Part> parts = request.getParts(); // 모든 part들을 가져옴
			String realPath = request.getServletContext().getRealPath("dh/imgFileSave");
			File fileSaveDir = new File(realPath);
			if (!fileSaveDir.exists()) { //저장경로에 해당 폴더가 없으면 만들기
				fileSaveDir.mkdirs();
			}
			//파일 저장 및 이미지배열을 List에 담기
			for (Part p : parts) {
				System.out.println(p.getName());
				if (p.getHeader("Content-Disposition").contains("filename=")) {
					if(p.getSize() > 0) {
						String fileName = p.getSubmittedFileName();
						String filePath = realPath + File.separator + currentDate + fileName; //서버 저장경로
						String filePathV = "dh/imgFileSave/" + File.separator + currentDate + fileName; 
						String imgPath = filePathV.replace('\\', '/');//db에 입력할 경로
						System.out.println("filePath->" + filePath);
						System.out.println("filePathV->" + filePathV);
						p.write(filePath);
						//List에 이미지 담기
						Commu.CommuImg commuImg = new CommuImg();
						commuImg.setC_img_path(imgPath);
						commuImgList.add(commuImg);
					}
				}
			}
			// table에 저장될 file path
			//String imgPathBefore = "dh/imgFileSave\\" + originName;
			//String imgPath = imgPathBefore.replace('\\', '/');
			
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
