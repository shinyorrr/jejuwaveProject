package service.dh;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Commu;
import dao.CommuDao;
import dao.Commu.CommuImg;
import service.CommandProcess;

public class CommuUpdateProAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("CommuUpdateProAction start...");
		try {
			request.setCharacterEncoding("utf-8");
			// 수정페이지에서 새로받아온 이미지 저장
			System.out.println("img upload start...");
			List<Commu.CommuImg> commuImgList = new ArrayList<Commu.CommuImg>(); //새로 insert할 이미지 List 초기화
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMddHHmmssZ");
			String currentDate = simpleDateFormat.format(new Date()); //파일명에 추가할 현재시간
			//part 인터페이스를 사용해 mulipart형식으로 보내진 데이터들 받기
			Collection<Part> parts = request.getParts(); // 모든 part들을 가져옴
			System.out.println("request.getParts ->" + parts);
			System.out.println("parts.size ->" + parts.size());
			String realPath = request.getServletContext().getRealPath("dh/imgFileSave");
			File fileSaveDir = new File(realPath); //경로에 폴더 없으면 폴더 만들기
			if (!fileSaveDir.exists()) {
				fileSaveDir.mkdirs();
			}
			//파일 저장 및 이미지배열을 List에 담기
			for (Part p : parts) {
				System.out.println(p.getName());
				if (p.getHeader("Content-Disposition").contains("filename=")) {
					if(p.getSize() > 0) {
						String fileName = p.getSubmittedFileName();
						String filePath = realPath + File.separator + currentDate + fileName; //서버 저장경로
						String filePathV = "dh/imgFileSave/" + File.separator + currentDate + fileName; //db에 입력할 경로
						System.out.println("filePath->" + filePath);
						System.out.println("filePathV->" + filePathV);
						String imgPath = filePathV.replace('\\', '/');//db에 입력할 경로
						p.write(filePath);
						//List에 이미지 담기
						Commu.CommuImg commuImg = new CommuImg();
						commuImg.setC_num(Integer.parseInt(request.getParameter("c_num")));
						commuImg.setC_img_path(imgPath);
						commuImgList.add(commuImg);
					}
				}
			}
			System.out.println("after setting commuImgList ->" + commuImgList);	
			
			// 파라미터 받아오기
			String pageNum  = request.getParameter("pageNum");
			String user_id  = request.getParameter("user_id");
			System.out.println("req.pageNum->" + pageNum);
			System.out.println("req.user_id->" + user_id);
			
			//삭제할 파일 배열 만들기 시작(수정 전 후 비교)
			String[]  b_c_img_nums = new String[] {}; //수정 전 이미지 리스트 미리 선언
			if (request.getParameterValues("b_c_img_num") != null) { //배열이 null인지 확인
				b_c_img_nums = request.getParameterValues("b_c_img_num"); //수정 전 이미지 리스트
			}
			String[]  c_img_nums   = new String[] {}; // 수정 전 이미지 리스트중 삭제된 이미지가 제외된 리스트 미리 선언
			if (request.getParameterValues("c_img_num") != null) {
				c_img_nums = request.getParameterValues("c_img_num"); // 수정 전 이미지 리스트중 삭제된 이미지가 제외된 리스트
			}
			System.out.println(b_c_img_nums);
			System.out.println(c_img_nums);
			
			// get instance
			CommuDao cd = CommuDao.getInstance();
			//수정 이전 이미지 리스트에서 수정 후 삭제된 이미지 번호 리스트 구하기 targetNums
			//removeAll 사용하기 위한 형변환
			Collection<String> listBefore = new ArrayList<String>(Arrays.asList(b_c_img_nums));
			Collection<String> listAfter = new ArrayList<String>(Arrays.asList(c_img_nums));
			List<String> targetList1 = new ArrayList<String>(listBefore);
			List<String> targetList2 = new ArrayList<String>(listAfter);
			targetList1.removeAll(targetList2); // 두 배열 비교하여 같은 값은 제거, 다른값만 남는다.
			System.out.println("targetList1->" + targetList1.toString());
			//list 가 string 타입이므로 integer로 형변환
			List<Integer> targetNums = targetList1.stream().map(s -> Integer.parseInt(s)).collect(Collectors.toList());
			// deleteImg dao 요청 (수정form에서 삭제된 이미지 삭제)
			int resultDeleteImg = cd.deleteImg(targetNums);	
			
			// Community_img insert (수정form에서 새로 추가된 이미지 추가)
			int resultInsertImg = 0;
			if (commuImgList.isEmpty()) {resultInsertImg = -1;}
			else                        {resultInsertImg = cd.insertImg(commuImgList);}                
			// Community value setting(이미지 제외)
			Commu commu = new Commu();
			commu.setC_num    (Integer.parseInt(request.getParameter("c_num")));
			commu.setC_content(request.getParameter("c_content"));
			commu.setC_hash   (request.getParameter("c_hash"));
			// Community Update
			int resultUpdateCommu = cd.update(commu);
			System.out.println("Action pro resultUpdateCommu -->" + resultUpdateCommu);
			System.out.println("Action pro resultDeleteImg -->"   + resultDeleteImg);
			System.out.println("Action pro resultInsertImg -->"   + resultInsertImg);
			//updatePro page로 보낼 setAttribute
			request.setAttribute("resultDeleteImg"  , resultDeleteImg);
			request.setAttribute("resultUpdateCommu", resultUpdateCommu);
			request.setAttribute("resultInsertImg"  , resultInsertImg);
			request.setAttribute("c_num"            , commu.getC_num());
			request.setAttribute("pageNum"          , pageNum);
		} catch (Exception e) {
			System.out.println("CommuUpdateProAction err ->" + e.getMessage());
		}
		return "dh/commuUpdatePro.jsp";
	}

}
