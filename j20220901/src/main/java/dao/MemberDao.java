package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {
	}

	public static MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}

	private Connection getConnection() throws SQLException {
		Connection conn = null;

		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return conn;
	}
	public int check(String user_id, String user_pw) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select  user_pw from member where user_id = ?";
		try {
			conn = getConnection();
			System.out.println("connection 연결" + conn);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String dbpasswd = rs.getString(1);
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
	public int confirmId(String user_id) throws SQLException {
		int result = 1;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		String Sql = "select* From member where user_id = ?";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(Sql);
			pstmt.setString(1, "user_id");
			rs = pstmt.executeQuery();
			if(rs.next()) result = 1;
			else 		 result = 0;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!= null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!= null) conn.close();
				}
		return result;
	}
	
	
	public int insert(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "insert into MEMBER values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, member.getUser_email());
			pstmt.setString(4, member.getUser_name());
			pstmt.setString(5, member.getUser_info());
			pstmt.setString(6, member.getUser_birth()); 
			pstmt.setString(7, member.getUser_gender());
			pstmt.setString(8, member.getUser_tel());
			pstmt.setInt(9, member.getUser_gubun());
			pstmt.setString(10, member.getUser_img());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if ( conn != null) conn.close();
			if ( pstmt != null) pstmt.close();
		}
		
		return result;
	}
	public Member select(String user_id) throws SQLException {
		Member member = new Member();	
		Connection conn = null;
		String sql  = "select * from member where user_id=?"; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member.setUser_id(rs.getString(1));
				member.setUser_pw(rs.getString(2));
				member.setUser_email(rs.getString(3));
				member.setUser_name(rs.getString(4));
				member.setUser_info(rs.getString(5));
				member.setUser_birth(rs.getString(6));
				member.setUser_gender(rs.getString(7));
				member.setUser_tel(rs.getString(8));
				member.setUser_gubun(rs.getInt(9));
				member.setUser_img(rs.getString(10));
			} 
		} catch(Exception e) { 
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return member;
	} 
	public int delete(String user_id, String user_pw) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql1 = "select user_pw from member where user_id=?";
		String sql = "delete from member where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPasswd = rs.getString(user_pw);
				if(dbPasswd.equals(user_pw)) {
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, user_id);
					result = pstmt.executeUpdate();
				}else result = 0;
			}	else result = -1;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null)pstmt.close();
		}
		
		
		return result;
	}
}
