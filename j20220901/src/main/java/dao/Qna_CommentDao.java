package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	public int insert(Qna_Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		 
		String sql = "insert into qna_comment values(?,?,?,sysdate,?)";
		
		
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, comment.getB_num());
			 pstmt.setInt(2, comment.getCom_num());
			 pstmt.setString(3, comment.getUser_id());
			 pstmt.setString(4, comment.getCom_content());
			 pstmt.executeUpdate();
			 pstmt.close();
			 
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	
	
	
	
	
}
