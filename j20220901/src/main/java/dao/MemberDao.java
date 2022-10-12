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
	private MemberDao() {} // 프라이빗으로 만들어 줘야 진짜 싱글턴 패턴
	
	public static MemberDao getInstance() {
		if(instance==null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	public int confirmId(String user_id) throws SQLException {
		int result = 1;
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;
		String sql = "select user_id From member where user_id = ?";
		System.out.println("confirmId sql ->"+ sql);
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
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
			System.out.println("dao user_gubun" + member.getUser_gubun());
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
	
	public int select(String user_name,String user_tel) throws SQLException {
		int result = 1;
		Connection conn = null;
		String sql  = "select user_id from member where user_name=? and user_tel=?"; 
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_tel);
			if (rs.next()) {
				Member member = new Member();
				member.setUser_id(rs.getString(1));
				result = 1;
			} 
			else result = 0;
		} catch(Exception e) { 
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	} 
	
	
	public int delete(String user_id, String user_pw) throws SQLException {
		System.out.println("delete Start.....");
		int result = 0;
		Connection conn = null;
		ResultSet rs = null;
		String sql1 = "select user_pw from member where user_id = ?";
		String sql = "delete member where user_id = ?";
		PreparedStatement pstmt = null;
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPasswd = rs.getString(1);
				System.out.println("dbPasswd->"+dbPasswd);
				if(dbPasswd.equals(user_pw)) {
					System.out.println("if dbPasswd->"+dbPasswd);
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, user_id);
					System.out.println("setString(1, \"user_id\")->"+user_id);
					result = pstmt.executeUpdate();
					System.out.println("delete result ->"+ result);
					
				}else result = 0;
			}	else result = -1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(conn != null) conn.close();
			if(pstmt != null)pstmt.close();
		}
		System.out.println("delete sql ->"+ sql);
		System.out.println("delete result : "+result);
		return result;
	}
	
	public String findId(String user_name, String user_email) throws SQLException {
		String id = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_id from member where user_name = ? and user_email = ?";
		System.out.println("findId sql start -> "+ sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_name);
			pstmt.setString(2, user_email);
			rs = pstmt.executeQuery();
			if(rs.next())
				id = rs.getString("user_id");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		return id;
	}
	public String findpw(String  user_id, String user_name, String user_email) throws SQLException {
		String pw = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_pw from member where user_id = ? and user_name = ? and user_email = ?";
		System.out.println("findId sql start -> "+ sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, user_name);
			pstmt.setString(3, user_email);
			rs = pstmt.executeQuery();
			if(rs.next())
				pw = rs.getString("user_pw");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		}
		return pw;
	}
}
