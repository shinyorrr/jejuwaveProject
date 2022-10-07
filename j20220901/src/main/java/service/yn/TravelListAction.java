package service.yn;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Travel;
import dao.TravelDao;
import service.CommandProcess;

public class TravelListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

			System.out.println("=====================TravelListAction Service Start=====================");
			TravelDao td = TravelDao.getInstance();
			
			//view에서 들어오는 입력값
			String pageNum = request.getParameter("pageNum");
			String t_dealstatus = request.getParameter("t_dealstatus");
			String t_start 	= request.getParameter("t_start");
			String t_end 	= request.getParameter("t_end");
			String t_gubun 	= request.getParameter("t_gubun");
			String t_title	= request.getParameter("t_title");
			
			System.out.println("=====================TravelListAction 입력파라미터=====================");
			System.out.println("TravelListAction pageNum 		======> " + pageNum);            // 현재페이지   
			System.out.println("TravelListAction t_start 		======> " + t_start);            // 시작날짜   
			System.out.println("TravelListAction t_end 			======> " + t_end);              // 종료 날짜  
			System.out.println("TravelListAction t_dealstatus 	======> " + t_dealstatus);       // 모집완료상태 
			System.out.println("TravelListAction t_gubun 		======> " + t_gubun);            // 테마 구분  
			System.out.println("TravelListAction t_title 		======> " + t_title);            // 제목 검색
			System.out.println("====================================================================");
			
		try {
			
			//Travel 객체에 데이터 저장
			Travel tvl = new Travel();
			tvl.setT_start		(t_start);			// 시작날짜
			tvl.setT_end		(t_end);			// 종료 날짜
			tvl.setT_dealstatus (t_dealstatus);		// 모집완료상태
			tvl.setT_gubun		(t_gubun);			// 테마 구분
			tvl.setT_title		(t_title);			// 제목 검색
			
			
			//리스트 총 갯수 구하기
			int totCnt = td.getTotalCnt(tvl);
			
			System.out.println("TravelListAction 총 건수 		======> " + totCnt);
			
			/**
			 *페이징 계산 
			 */
			if(pageNum == null || pageNum.equals("")) {
				pageNum ="1";
			}
			int currentPage	= Integer.parseInt(pageNum);			//현재페이지
			int pageSize 	= 8, blockSize = 10;					// pageSize : 한페이지에 보여줄 갯수, blockSize : 페이징 버튼 갯수
			int startRow 	= (currentPage - 1) * pageSize + 1;  	// 1     10	시작 인덱스
			int endRow   	= startRow + pageSize - 1;           	// 11    20 끝 인덱스
			int startNum 	= totCnt - startRow + 1; 			  	//			시작 번호?
			int pageCnt 	= (int) Math.ceil((double)totCnt/pageSize);
			int startPage 	= (int)(currentPage - 1)/blockSize*blockSize + 1;
			int endPage 	= startPage + blockSize - 1;
			if(endPage > pageCnt) endPage = pageCnt;
			
			//동행 찾기 리스트 조회 쿼리					(시작인덱스, 끝인댁스, 조회조건)
			List<Travel> travel = td.traveListSearch(startRow, endRow, tvl);
			
			System.out.println("=====================TravelListAction 출력값=====================");
			System.out.println("TravelListAction 출력값[totCnt]  		=> "	+ totCnt);
			System.out.println("TravelListAction 출력값[pageNum]  	=> "	+  pageNum);
			System.out.println("TravelListAction 출력값[currentPage]	=> "	+ currentPage);
			System.out.println("TravelListAction 출력값[startNum]  	=> "	+  startNum);
			System.out.println("TravelListAction 출력값[blockSize]  	=> "	+ blockSize);
			System.out.println("TravelListAction 출력값[pageCnt]  	=> "	+  pageCnt);
			System.out.println("TravelListAction 출력값[startPage]  	=> "	+ startPage);
			System.out.println("TravelListAction 출력값[endPage]  	=> "	+  endPage);
			System.out.println("TravelListAction 출력값[t_dealstatus]	=> "	+ t_dealstatus);
			System.out.println("TravelListAction 출력값[t_start]  	=> "	+  t_start);
			System.out.println("TravelListAction 출력값[t_end]  		=> "	+ t_end);
			System.out.println("TravelListAction 출력값[t_gubun]  	=> "	+  t_gubun);
			System.out.println("TravelListAction 출력값[t_title]  	=> "	+  t_title);
			System.out.println("================================================================");
			
			
			
			/**
			 * 출력값 셋팅
			 */
			
			request.setAttribute("gubun", t_gubun);
			
			//테마 분리 처리
			if(t_gubun != null && t_gubun != "") {
				t_gubun = t_gubun.replaceAll("'", "");
				String[] gubunArr = t_gubun.split(",");
				for(int i = 0; i < gubunArr.length; i++) {
					switch(gubunArr[i]) {
					case"숙박":
						request.setAttribute("t_gubun2", "숙박");
						break;
					case"레저":
						request.setAttribute("t_gubun3", "레저");
						break;
					case"맛집":
						request.setAttribute("t_gubun4", "맛집");
						break;
					case"카풀":
						request.setAttribute("t_gubun5", "카풀");
						break;
					case"기타":
						request.setAttribute("t_gubun6", "기타");
						break;
					default:
						break;
					}
				}
			} else {
				//전체일때
				request.setAttribute("t_gubun1", 1);
			}
			
			
			request.setAttribute("travelList",		travel);
			request.setAttribute("totCnt",			totCnt);
			request.setAttribute("pageNum",			pageNum);
			request.setAttribute("currentPage",		currentPage);
			request.setAttribute("startNum",		startNum);
			request.setAttribute("blockSize",		blockSize);
			request.setAttribute("pageCnt",			pageCnt);
			request.setAttribute("startPage",		startPage);
			request.setAttribute("endPage",			endPage);
			request.setAttribute("t_dealstatus",	t_dealstatus);
			request.setAttribute("t_start",			t_start);
			request.setAttribute("t_end",			t_end);
			request.setAttribute("t_title",			t_title);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "yn/travelList.jsp";
	}
}
