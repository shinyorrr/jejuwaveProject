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

public class Qna_BoardDao {
	private static Qna_BoardDao instance;
	private Qna_BoardDao() {}
	public static Qna_BoardDao getInstance() {
		if (instance == null) {	
			instance = new Qna_BoardDao();		
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
	
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "select count(*) from qna_board";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public List<Qna_Board> boardList() throws SQLException {
		List<Qna_Board> list = new ArrayList<Qna_Board>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		 String sql = "select * from qna_board";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Qna_Board board = new Qna_Board();
				board.setB_num(rs.getInt("b_num"));
				board.setUser_id(rs.getString("user_id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
				board.setB_date(rs.getDate("b_date"));
				list.add(board);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	public Qna_Board select(int b_num) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		String sql = "select * from qna_board where b_num="+b_num;
		Qna_Board board = new Qna_Board();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				board.setB_num(rs.getInt("b_num"));
				board.setUser_id(rs.getString("user_id"));
				board.setB_title(rs.getString("b_title"));
				board.setB_content(rs.getString("b_content"));
				board.setB_date(rs.getDate("b_date"));
				board.setB_success(rs.getString("b_success"));
				board.setB_theme(rs.getString("b_theme"));

			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return board;
	}	
	
	public int insert(Qna_Board board) throws SQLException {
		int b_num = board.getB_num();
		System.out.println(b_num);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		
		String sql1 = "select nvl(max(b_num),0) from qna_board";
		String sql = "insert into qna_board (b_num,user_id,b_date,b_title,b_content,b_success,b_theme) values(?,'aaaa',sysdate,?,?,?,?)";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs=pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1)+1;
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			//로그인 기능 추가하면//////////////////////////////////
			//pstmt.setString(2, board.getUser_id());
			pstmt.setString(2, board.getB_title());
			pstmt.setString(3, board.getB_content());
			pstmt.setString(4, board.getB_success());
			pstmt.setString(5, board.getB_theme());
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;	
	}

	public int update(Qna_Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update qna_board set b_title=?,b_content=?, b_theme=? where b_num=?";
		
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_theme());
			pstmt.setInt(4, board.getB_num());
			
			
			result = pstmt.executeUpdate()	;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			if(pstmt !=null) pstmt.close();
			if(conn != null) conn.close();
		}
		return result;			
	}
	
	public int delete(int b_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "delete from qna_board where b_num=?";
		
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(conn!=null)conn.close();
			if(pstmt!=null)pstmt.close();
		}
		return result;
		
	}
	
	
	
	
	
	
	/* 삭제할것 *////////////////////////////



	

//	
//	public void readCount(int num) throws SQLException {
//		Connection conn = null;	
//		PreparedStatement pstmt = null;
//		String sql = "update board set readcount=readcount+1 where num=?";
//		Board board = new Board();
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			if (pstmt != null) pstmt.close();
//			if (conn !=null) conn.close();
//		}	
//	}
	
	
	
	
}
