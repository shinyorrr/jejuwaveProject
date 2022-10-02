package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

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
	
	public int insert(Qna_Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		String sql1 = "select nvl(max(com_num),0) from qna_comment";
		String sql = "insert into qna_comment values(?,?,?,sysdate,?)";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			int cnum =rs.getInt(1) +1 ;
			rs.close();
			pstmt.close();
			
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, comment.getB_num());
			 pstmt.setInt(2, cnum);
			 pstmt.setString(3, comment.getUser_id());
			 pstmt.setString(4, comment.getCom_content());
			 result = pstmt.executeUpdate();
			 pstmt.close();
			 
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	
	
	
	
	
}
