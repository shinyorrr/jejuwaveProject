package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MypageDao {
	private static final List<Mypage> List = null;
	private static MypageDao instance;
	private MypageDao() {}
	public static MypageDao getInstance() {
		if(instance == null) {
			instance = new MypageDao();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(conn);
		return conn;
	}
	public int getTotalCnt(String user_id) throws SQLException {
		int max = 0;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select count(*)from travel_board where user_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			System.out.println("getTotalCnt user id=>" + user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
				System.out.println("getTotalCnt ==> " + max);
			} else {
				System.out.println("getTotalCnt ==> 최댓값 실패(MypageDao)");
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		return max;
	}
	
	public int getTotalCntBoard(String user_id) throws SQLException {
		int max = 0;
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		String sql = "select count(*)from qna_board where user_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			System.out.println("getTotalCntBoard user id=>" + user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
				System.out.println("getTotalCnt ==> 최댓값 추출성공(MypageDao)" + max);
			} else {
				System.out.println("getTotalCnt ==> 최댓값 실패(MypageDao)");
			}
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		return max;
	}
	
	
	public List<Mypage> travelList(String user_id, int startRow, int endRow) throws SQLException {
		List<Mypage> list = new ArrayList<Mypage>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from"
				+	"(select rownum rn,a.* from"
				+		"(select * from travel_board order by t_date desc) a"
				+   ")where user_id = ? and rn BETWEEN ? and ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Mypage mypage = new Mypage();
				mypage.setT_num(rs.getInt("t_num"));
				mypage.setT_img(rs.getString("t_img"));
				mypage.setUser_id(rs.getString("user_id"));
				mypage.setT_title(rs.getString("t_title"));
				mypage.setT_content(rs.getString("t_content"));
				mypage.setT_gubun(rs.getString("t_gubun"));
				mypage.setT_date(rs.getDate("t_date"));
				mypage.setT_person(rs.getInt("t_person"));
				mypage.setT_start(rs.getDate("t_start"));
				mypage.setT_end(rs.getDate("t_end"));
				mypage.setT_dealstatus(rs.getString("t_dealstatus"));
				list.add(mypage);
			}
			System.out.println("list 값 찾기 :" + list);
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return list;
	}
	
	
	public int check(String user_id, String user_pw) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select  user_pw, user_gubun from member where user_id = ?";
		try {
			conn = getConnection();
			System.out.println("connection 연결" + conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Member member = new Member();
				String dbpasswd = rs.getString("user_pw");
				member.setUser_gubun(rs.getInt("user_gubun"));
				System.out.println("dbpasswd =>" + dbpasswd);
				System.out.println("user_pw : " + user_pw);
				System.out.println("db 탔음");
				if(dbpasswd.equals(user_pw)) result = 1;
				else result = 0;
			} else result = -1;
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return result;
	}
	
	public Member select(String user_id) throws SQLException {
		Member md = new Member();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select USER_INFO,USER_BIRTH,USER_TEL,USER_EMAIL,USER_IMG, USER_GUBUN from member where user_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				md.setUser_info(rs.getString("user_info"));
				System.out.println(md.getUser_info());
				md.setUser_birth(rs.getString("user_birth"));
				md.setUser_tel(rs.getString("user_tel"));
				md.setUser_email(rs.getString("user_email"));
				md.setUser_img(rs.getString("user_img"));
				md.setUser_gubun(rs.getInt("user_gubun"));
				System.out.println(md.getUser_img());
			}
		} catch (SQLException e) {
			System.out.println("MemberDao select문 오류 : " + e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return md;
	}
	public String imageSelect(String user_id) throws SQLException {
		String img = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select USER_IMG from member where user_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				img = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("MemberDao select문 오류 : " + e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return img;
	}
	public List<Mypage> boardList(String user_id, int startRow, int endRow) throws SQLException {
		List<Mypage> list = new ArrayList<Mypage>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select * from "
				+	"(select rownum rn, a.* from "
				+		"(select * from qna_board where user_id = ? order by b_num desc) a "
				+   ") where rn BETWEEN ? and ? ";
		System.out.println("boardList sql : " + sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			System.out.println("boardList user_id : " + user_id);
			System.out.println("boardList startRow : " + startRow);
			System.out.println("boardList endRow : " + endRow);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("boardList ResultSet=> " + rs);
			System.out.println("boardList rs.next() : " + rs.next());
			do {
				Mypage mypage = new Mypage();
				System.out.println("boardlist는 실행완료 : " + rs);
				mypage.setB_num(rs.getInt("b_num"));
				System.out.println("DAO boardList setB_num : " + mypage.getB_num());
				mypage.setUser_id(rs.getString("user_id"));
				mypage.setB_date(rs.getDate("b_date"));
				mypage.setB_title(rs.getString("b_title"));
				mypage.setB_content(rs.getString("b_content"));
				mypage.setB_success(rs.getString("b_success"));
				list.add(mypage);
			} while(rs.next());
		} catch(Exception e) {
			System.out.println("boardList e.getMessage()->"+e.getMessage());
		} finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		System.out.println("DAO boardList list.size()->"+list.size());
		
		return list;
	}
	public int getTotalCommentCnt(String user_id) throws SQLException {
		int max = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select (select count(*) from qna_comment where user_id = ?) + "
				+ "       (select count(*) from travel_board where user_id = ? and t_restep != 0) "
				+ " from dual";
		System.out.println("getTotalCommentCnt sql : " + sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_id);
			rs = pstmt.executeQuery();
			System.out.println("getTotalCommentCnt rs 실행되는지=> " + rs);
			if(rs.next()) {
				max = rs.getInt(1);
				System.out.println("getTotalCommentCnt : 실행완료" + max);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}  finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return max;
	}
	public List<Mypage> commentList(String user_id, int startRow, int endRow) throws SQLException {
		List<Mypage> list = new ArrayList<Mypage>();
		String sql = "select * from (\r\n"
				+ "                select rownum rn, a.* from "
				+ "                    (select t_content, t_date, b_content,b_date "
				+ "                    from qna_board q, travel_board t "
				+ "                    where q.user_id = t.user_id "
				+ "                    and q.user_id = ? "
				+ "                    and t.t_relevel != 0) a "
				+ "                ) "
				+ "WHERE rn BETWEEN ? and ?";
		System.out.println("commentList sql : " + sql);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			System.out.println("commentList : " + rs);
			System.out.println("commentList rs.next () : " + rs.next());
			
			do{
				Mypage mypage = new Mypage();
				mypage.setT_content(rs.getString("t_content"));
				mypage.setT_date(rs.getDate("t_date"));
				mypage.setB_content(rs.getString("b_content"));
				mypage.setB_date(rs.getDate("b_date"));
				list.add(mypage);
				System.out.println("commentList list : " + list);
			} while(rs.next());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}  finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		
		return list;
	}
	public int getTotalCntCommunity(String user_id) throws SQLException{
		int max = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from community where user_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getTotalCntCommunity 오류 : " + e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		
		return max;
	}
	public List<Mypage> communityList(String user_id, int startRow, int endRow) throws SQLException {
		List<Mypage> list = new ArrayList<Mypage>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " select * from( "
				+ "            select rownum rn, a.* from "
				+ "            (select i.c_num, c_hash, c_title, c_content, c_date, c_img_path "
				+ "            from community c, community_img i "
				+ "            where c.c_num = i.c_num "
				+ "            and rownum <= 1 "
				+ "            and c.user_id = ? "
				+ "            ) a) "
				+ "where rn between ? and ? ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			System.out.println("communityList rs next() :   " + rs.next());
			do {
				Mypage mypage = new Mypage();
				mypage.setC_num(rs.getInt("c_num"));
				mypage.setC_title(rs.getString("c_title"));
				mypage.setC_content(rs.getString("c_content"));
				mypage.setC_date(rs.getDate("c_date"));
				mypage.setC_hash(rs.getString("c_hash"));
				mypage.setC_img_path(rs.getString("c_img_path"));
				list.add(mypage);
			} while (rs.next());
		} catch (Exception e) {
			System.out.println("communityList 오류  :  " + e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		
		return list;
		
	}
	public int update(String user_img, String user_info, String user_birth, String user_tel, String user_email, String user_id) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "Update member set user_img = ?, user_info = ?,"
				+ " user_birth = ?, user_tel = ?, user_email = ? where user_id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_img);
			pstmt.setString(2, user_info);
			pstmt.setString(3, user_birth);
			pstmt.setString(4, user_tel);
			pstmt.setString(5, user_email);
			pstmt.setString(6, user_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("update 오류 : " + e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		}
		
		return result;
		
	}
	
	
}
