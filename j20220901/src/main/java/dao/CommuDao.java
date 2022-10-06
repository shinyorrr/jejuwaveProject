package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dao.Commu.CommuImg;
import oracle.net.aso.r;

public class CommuDao {
	private static CommuDao instance;
	private CommuDao() {};
	public static CommuDao getInstance() {
		if (instance == null) {
			instance = new CommuDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context    ctx = new InitialContext();
			DataSource ds  = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	// 게시글 count
	public int getTotalCnt() throws SQLException {
		int totCnt = 0;
		String sql = "select count(*) from community";
		Connection conn = null;
		Statement  stmt = null;
		ResultSet    rs = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs   = stmt.executeQuery(sql);
			if (rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalCnt e" + e.getMessage());
		} finally {
			if (rs   != null) rs.close(); 
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close(); 
		}
		return totCnt;
	}
	// 게시글 list get
	public List<Commu> CommuList(int startRow , int endRow) throws SQLException {
		List<Commu> list = new ArrayList<Commu>();
		String sql = "select * from ( select rownum rn , a.* from (select * from community order by c_num desc) a) where rn between ? and ?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		
		try {
			//community select(c_img 제외)
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Commu commu = new Commu();
				commu.setC_num(rs.getInt("c_num"));
				commu.setUser_id(rs.getString("user_id"));
				commu.setC_content(rs.getString("c_content"));
				commu.setC_date(rs.getDate("c_date"));
				commu.setC_hash(rs.getString("c_hash"));
				list.add(commu);
			}
		} catch (Exception e) {
			System.out.println("commuList select try...err" + e.getMessage());
		} finally {
			if (rs    != null) rs.close(); 
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		
		return list;
	}
	// 게시글 list rownum startRow, endRow 유저이미지 list get
	public List<Member> selectUserImgList(int startRow , int endRow) throws SQLException {
		List<Member> userImgList = new ArrayList<Member>();
		String sql = "select crn.user_id, m.user_img "
				+ " from (select * from ( select rownum rn , a.* from (select * from community order by c_num desc) a) where rn between ? and ?) crn , member m "
				+ " where crn.user_id = m.user_id";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Member member = new Member();
				member.setUser_id(rs.getString(1));
				member.setUser_img(rs.getString(2));
				userImgList.add(member);
			}
		} catch (Exception e) {
			System.out.println("selectUserImgList try...err ->" + e.getMessage());
		} finally {
			if (rs    != null) rs.close(); 
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return userImgList;
	}
	
	// 게시글 list 대표이미지 list get
	public List<Commu.CommuImg> CommuListImg(int startRow , int endRow) throws SQLException {
		List<Commu.CommuImg> imgList = new ArrayList<Commu.CommuImg>();
		String sql = "select * "
				+ "from ( "
				+ "        select rownum rn , a.* "
				+ "        from ("
				+ "                select ci.c_num, min(c_img_path) keep (DENSE_RANK last order by ci.c_num) as f_c_img_path "
				+ "                from community c, community_img ci "
				+ "                where c.c_num = ci.c_num group by ci.c_num "
				+ "                order by ci.c_num desc "
				+ "             ) a "
				+ "     ) "
				+ "where rn between ? and ?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		
		try {
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Commu.CommuImg commuImg = new Commu.CommuImg();
				commuImg.setC_img_path(rs.getString("f_c_img_path"));
				imgList.add(commuImg);
			}
		} catch (Exception e) {
			System.out.println("commuList select try...err" + e.getMessage());
		} finally {
			if (rs    != null) rs.close(); 
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return imgList;
	}
	
	// commu content select
	public Commu select(int c_num) throws SQLException {
		Commu commu = new Commu();

		String sql = "select * from community where c_num=" + c_num;
		Connection conn  = null;
		Statement  stmt  = null;
		ResultSet  rs    = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				commu.setC_num(rs.getInt("c_num"));
				commu.setUser_id(rs.getString("user_id"));
				commu.setC_content(rs.getString("c_content"));
				commu.setC_date(rs.getDate("c_date"));
				commu.setC_hash(rs.getString("c_hash"));
			}
		} catch (Exception e) {
			System.out.println("commu content select try...err" + e.getMessage());
		} finally {
			if (rs    != null) rs.close(); 
			if (stmt  != null) stmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return commu;
	}
	
	// community_img select(content)
	public List<Commu.CommuImg> selectImg(int c_num) throws SQLException {
		List<Commu.CommuImg> imgList = new ArrayList<Commu.CommuImg>();
		String sql = "select c.c_num , ci.c_img_num , ci.c_img_path "
					+ "from community c , community_img ci "
					+ "where c.c_num = ci.c_num "
					+ "and c.c_num = ? "
					+ "order by ci.c_img_num";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Commu.CommuImg commuImg = new CommuImg();
				commuImg.setC_num(rs.getInt("c_num"));
				commuImg.setC_img_num(rs.getInt("c_img_num"));
				commuImg.setC_img_path(rs.getString("c_img_path"));
				System.out.println("img_path->" + rs.getString("c_img_path"));
				imgList.add(commuImg);
			}
		} catch (Exception e) {
			System.out.println("selectImg try..." + e.getMessage());
		} finally {
			if (rs    != null) rs.close(); 
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return imgList;
	}
	
	// user_img select(content)
	public Member selectUserImg(int c_num) throws SQLException {
		Member member = new Member();
		String sql = "select c_num, user_img\r\n"
				+ "from community c , member m\r\n"
				+ "where c.user_id = m.user_id\r\n"
				+ "and c.c_num = ?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setUser_img(rs.getString(2));
			}
		} catch (Exception e) {
			System.out.println("content Action user img select dao try... err ->" + e.getMessage());
		} finally {
			if (rs    != null) rs.close(); 
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return member;
	}
	
	// write - community , community_img insert
	public int[] insert(Commu commu , List<Commu.CommuImg> commuImgList) throws SQLException {
		int[] results = new int[2];
		String sql = "insert into community values(? , ? , ? , sysdate , ? )";
		String sql1 = "select nvl(max(c_num) , 0) from community";
		String sql2 = "insert into community_img values(? , seq_COM_IMG.nextval , ?)";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		try {
			int commuResult = 0;
			int imgResultSum = 0;
			
			//max c_num 받아서 c_num+1 
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1) + 1;
			System.out.println("get 게시글 number->" + number);
			rs.close();
			pstmt.close();
			System.out.println("insert commu start...");
			// insert community
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt   (1 , number);
			pstmt.setString(2 , commu.getUser_id());
			pstmt.setString(3 , commu.getC_content());
			pstmt.setString(4 , commu.getC_hash());
			System.out.println("insert user_id->" + commu.getUser_id());
			System.out.println("insert c_content->" + commu.getC_content());
			System.out.println("insert c_hash->" + commu.getC_hash());
			commuResult = pstmt.executeUpdate();
			System.out.println("dao commuResult->" + commuResult);
			pstmt.close();
			// insert community_img
			System.out.println("insert img start...");
			System.out.println("before insert commiImgList->" + commuImgList);
			List<Integer> imgResults = new ArrayList<>(); //img insert result list
			for (Commu.CommuImg commuImg : commuImgList) {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt   (1 , number);
				pstmt.setString(2 , commuImg.getC_img_path());
				System.out.println("insert img 게시글 number->" + number);
				System.out.println("insert img c_img_path->" + commuImg.getC_img_path());
				int imgResult = pstmt.executeUpdate();
				System.out.println("imgResult->" + imgResult);
				imgResults.add(imgResult);
				pstmt.close();
			}
			imgResultSum = imgResults.stream().mapToInt(Integer::intValue).sum();
			System.out.println("imgResultSum->" + imgResultSum);
			results[0] = commuResult;
			results[1] = imgResultSum;

		} catch (Exception e) {
			System.out.println("insert dao e.n->" + e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		System.out.println("dao last results->" + results[0] + ", " + results[1]);
		return results;
	}
	
	// (수정용)deleteImages
	public int deleteImg(List<Integer> targetNums) throws SQLException {
		System.out.println("deleteImg dao start..");
		int resultDeleteImg = 0;
		String sql = "delete community_img where c_img_num=?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			for (Integer targetNum : targetNums) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, targetNum);
				resultDeleteImg += pstmt.executeUpdate();
				pstmt.close();
			}
		} catch (Exception e) {
			System.out.println("deleteImg try...err" + e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return resultDeleteImg;
	}
	
	// (수정용)Community_img insert
	public int insertImg(List<Commu.CommuImg> commuImgList) throws SQLException {
		int resultInsertImg = 0;
		String sql = "insert into community_img values(? , seq_COM_IMG.nextval , ?)";
		Connection        conn  = null;
		PreparedStatement pstmt = null;		
		try {
			System.out.println("insert img start...");
			System.out.println("before insert commuImgList->" + commuImgList);
			List<Integer> imgResults = new ArrayList<>(); //img insert result list
			conn = getConnection();
			for (Commu.CommuImg commuImg : commuImgList) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt   (1 , commuImg.getC_num());
				pstmt.setString(2 , commuImg.getC_img_path());
				System.out.println("insert img 게시글 number->" + commuImg.getC_num());
				System.out.println("insert img c_img_path->" + commuImg.getC_img_path());
				int imgResult = pstmt.executeUpdate();
				System.out.println("imgResult->" + imgResult);
				imgResults.add(imgResult);
				pstmt.close();
			}
			resultInsertImg = imgResults.stream().mapToInt(Integer::intValue).sum();
		} catch (Exception e) {
			System.out.println("update insertImg try...err ->" + e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return resultInsertImg;
	}
	
	
	// (수정용)Community table update(이미지제외)
	public int update(Commu commu) throws SQLException {
		System.out.println("Community table update start...");
		int resultUpdateCommu = 0;
		String sql = "update community set c_content = ? , c_hash = ? where c_num = ?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt   (3 , commu.getC_num());
			pstmt.setString(1 , commu.getC_content());
			pstmt.setString(2 , commu.getC_hash());
			resultUpdateCommu = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("commu update try...err -> " + e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 	
		}
		return resultUpdateCommu;
	}
	
	// 게시글 삭제
	public int delete(int c_num) throws SQLException {
		int result = 0;
		String sql = "delete community where c_num = ?";
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, c_num);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("deleteDAO try...err->" + e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close(); 
			if (conn  != null) conn.close(); 
		}
		return result;
	}
}
