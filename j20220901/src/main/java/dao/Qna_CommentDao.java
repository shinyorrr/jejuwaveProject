package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Statement;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class Qna_CommentDao {
	private static Qna_CommentDao instance;
	private Qna_CommentDao() {
		
	}
	public static Qna_CommentDao getInstance() {
		if(instance == null) {
			instance = new Qna_CommentDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	

	public List<Qna_Comment> commentList(int b_num) throws SQLException{
		List<Qna_Comment> list = new ArrayList<Qna_Comment>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select q.*, fn_user_img(q.user_id) fn_user_img from qna_comment q where b_num=?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Qna_Comment comment = new Qna_Comment();
				comment.setUser_id(rs.getString("user_id"));
				comment.setCom_content(rs.getString("com_content"));
				comment.setCom_num(rs.getInt("com_num"));
				comment.setCom_date(rs.getDate("com_date"));
				comment.setCom_choose(rs.getString("com_choose"));
                comment.setFn_user_img(rs.getString("fn_user_img"));
				
				list.add(comment);
			}	
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)rs.close();
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}

		return list;
	}

	public Qna_Comment select(int b_num) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select user_id, com_content from qna_comment where b_num="+b_num;
		Qna_Comment comment = new Qna_Comment();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				comment.setUser_id(rs.getString("user_id"));
				comment.setCom_content(rs.getString("com_content"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null) rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		return comment;
	}
	
	public int insert(Qna_Comment comment) throws SQLException {
		System.out.println("qnaComment insert start..");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int com_num = comment.getCom_num();
		int result = 0;
		
		String sql1 = "select nvl(max(com_num),0) from qna_comment where b_num=?";
		String sql2 = "select nvl(max(com_cnt),0) from qna_board where b_num=?";
		String sql = "insert into qna_comment values(?,?,?,sysdate,?,?)";
		String sql3 = "update qna_board set com_cnt=? where b_num=?";
		
		try {
			conn = getConnection();
			//댓글번호 달기: 기존댓글번호 최대값받아와서 +1 
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, comment.getB_num());
			rs = pstmt.executeQuery();
			rs.next();
			int cnum =rs.getInt(1) +1 ;
			rs.close();
			pstmt.close();
			//댓글갯수 : 기존댓글갯수 최대값받아와서 +1
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, comment.getB_num());
			rs = pstmt.executeQuery();
			rs.next();
			int com_cnt =rs.getInt(1) +1 ;
			rs.close();
			pstmt.close();
			//qna_board 테이블에 댓글갯수 업데이트
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, com_cnt);
			pstmt.setInt(2, comment.getB_num());
			pstmt.executeUpdate();
			pstmt.close();
			
			//qna_comment 테이블에 데이터 등록
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, comment.getB_num());
			 pstmt.setInt(2, cnum);
			 pstmt.setString(3, comment.getUser_id());
			 pstmt.setString(4, comment.getCom_content());
			 pstmt.setString(5, "N");
			 result = pstmt.executeUpdate();
			 pstmt.close();
			 
			 
			 

		} catch (Exception e) {
			System.out.println("qna_comment insert error--> "+e.getMessage());
		} finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
		
		return result;
	}
	
	public int delete(int b_num, int com_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql = "delete from qna_comment where b_num=? and com_num=?";
		String sql1 = "select nvl(max(com_cnt),0) from qna_board where b_num=?";
		String sql2 = "update qna_board set com_cnt=? where b_num=?";
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.setInt(2, com_num);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt=conn.prepareStatement(sql1);
			pstmt.setInt(1, b_num);
			rs=pstmt.executeQuery();
			rs.next();
			int com_cnt = rs.getInt(1)-1;
			rs.close();
			pstmt.close();
			
			pstmt= conn.prepareStatement(sql2);
			pstmt.setInt(1, com_cnt);
			pstmt.setInt(2, b_num);
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		} return result;
		
	}
	
	
	
	
}
