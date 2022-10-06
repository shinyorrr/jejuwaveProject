package service.yn;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.*;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

import org.apache.commons.fileupload.*;

public class TravelWriteProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			request.setCharacterEncoding("utf-8");
			Travel result = null;
			System.out.println("getContextPath =======>" + request.getContextPath());
			System.out.println("getRealPath =======>" + request.getSession().getServletContext().getRealPath("/"));
//			String saveFolder = "C:\\Jsp\\jspSrc\\jejuwave_1001\\src\\main\\webapp\\images\\upload\\";
			String savePath = request.getServletContext().getRealPath("/images/upload");
			System.out.println("savePath ==== > " + savePath);
			String encType = "utf-8";
			int maxSize = 5* 1024 *1024;
		
			TravelDao td = TravelDao.getInstance();
			try {
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encType, new DefaultFileRenamePolicy());
				Enumeration file = multi.getFileNames();
				String name = (String) file.nextElement();
				
				String filename = multi.getFilesystemName(name);
//				String fullFolder = saveFolder + filename;
				
				System.out.println("filename=====>" + filename);
				 
				if(filename == null) {
					switch (multi.getParameter("t_gubun")) {
					case "숙박":
						filename = "random\\jejuRoom" + ((int)(Math.random()*4) + 1) + ".jpg";
						break;
					
					case "레저":
						filename = "random\\jejuLes" + ((int)(Math.random()*8) + 1) + ".jpg";
						break;
					
					case "맛집":
						filename = "random\\jejuEat" + ((int)(Math.random()*7) + 1) + ".jpg";
						break;
					
					case "카풀":
						filename = "random\\jejuCar" + ((int)(Math.random()*7) + 1) + ".jpg";
						break;
						
					case "기타":
						filename = "random\\jejuAll" + ((int)(Math.random()*7) + 1) + ".jpg";
						break;

					default:
						break;
					}
					
				}
				
				
				Travel travel = new Travel();
				HttpSession session = request.getSession();
				
				String user_id = session.getAttribute("user_id").toString();
				System.out.println("session===========>"+ user_id);
				System.out.println("t_title===========>"+ multi.getParameter("t_title"));
				System.out.println("t_content===========>"+ multi.getParameter("t_content"));
				System.out.println("t_img===========>"+ "images\\upload"+filename);
				System.out.println("t_start===========>"+ multi.getParameter("t_start"));
				System.out.println("t_end===========>"+ multi.getParameter("t_end"));
				System.out.println("t_gubun==============>" + multi.getParameter("t_gubun"));
				System.out.println("t_person==============>" + multi.getParameter("t_person"));
//				travel.setT_num(request.getParameter("t_num"));
				travel.setUser_id		(user_id);
				travel.setT_img			("images\\upload\\"+filename);
				travel.setT_title		(multi.getParameter("t_title"));
				travel.setT_content		(multi.getParameter("t_content").replace("\r\n","<br>"));
				travel.setT_gubun		(multi.getParameter("t_gubun"));
				travel.setT_person		(Integer.parseInt(multi.getParameter("t_person")));
				travel.setT_start		(multi.getParameter("t_start"));
				travel.setT_end			(multi.getParameter("t_end"));
				travel.setT_relevel		(0);
				travel.setT_restep		(0);
				travel.setT_dealstatus	("0");
				
				
				System.out.println("travle set 완료");
				
				// t_num 최댓값 구하기
				int maxTnum = td.getMaxT_num();
				
				// t_num 과 t_ref에 같은 값 넣어주기
				travel.setT_num(maxTnum);
				travel.setT_ref(maxTnum);
				
				// table insert
				result = td.insert(travel);
				System.out.println("travle insert 완료");
				
				// 출력값 셋팅
				request.setAttribute("result", result.getResult());
				request.setAttribute("t_num", result.getT_num());
				
			} catch (Exception e) {
				System.out.println("나는 에러");
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		return "yn/travelWritePro.jsp";
	}

}
