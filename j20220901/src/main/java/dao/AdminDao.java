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

public class AdminDao {
	private static AdminDao instance;
	private AdminDao() {
	}
	public static AdminDao getInstance() {
		if(instance == null) {
			instance = new AdminDao();
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
		return conn;
	}
	
	public int getTotalCnt() throws SQLException {
		int tot = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from member";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) 	rs.close();
			if(stmt!=null)  stmt.close();
			if(conn!=null)  conn.close();
		}
		return tot;
		
	}
	
	public int getTravelCnt() throws SQLException {
		int tot = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from travel_board";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) 	rs.close();
			if(stmt!=null)  stmt.close();
			if(conn!=null)  conn.close();
		}
		return tot;
	}
	
	public List<Member> memList(int startRow, int endRow) throws SQLException {
		List<Member> list = new ArrayList<Member>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from"
				+ "       ( select rownum rn, a.* from (select * from member order by user_gubun) a)"
				+ "where rn between ? and ?";
		System.out.println("Dao memList sql->"+sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);;
			System.out.println("startRow->"+startRow);
			System.out.println("endRow->"+endRow);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					Member m = new Member();
					m.setUser_id(rs.getString("user_id"));
					m.setUser_pw(rs.getString("user_pw"));
					m.setUser_email(rs.getString("user_email"));
					m.setUser_name(rs.getString("user_name"));
					m.setUser_info(rs.getString("user_info"));
					m.setUser_birth(rs.getDate("user_birth"));
					m.setUser_gender(rs.getString("user_gender"));
					m.setUser_tel(rs.getString("user_tel"));
					m.setUser_gubun(rs.getInt("user_gubun"));
					m.setUser_img(rs.getString("user_img"));
					list.add(m);
				}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) 	rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null)  conn.close();
		}
		return list;
	}
	
	public Member select(String user_id) throws SQLException {
		Member m = new Member();
		Connection conn = null;
		String sql = "select * from member where user_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m.setUser_id(rs.getString("user_id"));
				m.setUser_pw(rs.getString("user_pw"));
				m.setUser_email(rs.getString("user_email"));
				m.setUser_name(rs.getString("user_name"));
				m.setUser_info(rs.getString("user_info"));
				m.setUser_birth(rs.getDate("user_birth"));
				m.setUser_gender(rs.getString("user_gender"));
				m.setUser_tel(rs.getString("user_tel"));
				m.setUser_gubun(rs.getInt("user_gubun"));
				m.setUser_img(rs.getString("user_img"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) 	rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null)  conn.close();
		}
		return m;
	}
	
	public List<Member> list() throws SQLException {
		List<Member> list = new ArrayList<Member>();
		Connection conn = null;
		String sql = "select * from member";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				do {
					Member m = new Member();
					m.setUser_id(rs.getString("user_id"));
					m.setUser_pw(rs.getString("user_pw"));
					m.setUser_email(rs.getString("user_email"));
					m.setUser_name(rs.getString("user_name"));
					m.setUser_info(rs.getString("user_info"));
					m.setUser_birth(rs.getDate("user_birth"));
					m.setUser_gender(rs.getString("user_gender"));
					m.setUser_tel(rs.getString("user_tel"));
					m.setUser_gubun(rs.getInt("user_gubun"));
					m.setUser_img(rs.getString("user_img"));
					list.add(m);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) 	rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null)  conn.close();
		}
		return list;
	}
	
	
	public int update(Member member) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update member set user_gubun=? where user_id=?";
		System.out.println("Dao update sql->"+sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getUser_gubun());
			pstmt.setString(2, member.getUser_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt!=null) pstmt.close();
			if(conn!=null)  conn.close();
		}
		return result;
	}
	
	public List<Travel> travelList(int startRow, int endRow) throws SQLException {
		List<Travel> list = new ArrayList<Travel>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * "
					+ "		from (select rownum rn, a.* from (select * from travel_board order by t_ref desc, t_restep) a) "
					+ "where rn between ? and ?";
		System.out.println("Dao travelList sql->"+sql);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			System.out.println("travelList startRow->"+startRow);
			System.out.println("travelList endRow->"+endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Travel t = new Travel();
				t.setT_num(rs.getInt("t_num"));
				t.setUser_id(rs.getString("user_id"));
				t.setT_img(rs.getString("t_img"));
				t.setT_title(rs.getString("t_title"));
				t.setT_content(rs.getString("t_content"));
				t.setT_gubun(rs.getString("t_gubun"));
				t.setT_date(rs.getDate("t_date"));
				t.setT_person(rs.getInt("t_person"));
				t.setT_start(rs.getString("t_start"));
				t.setT_end(rs.getString("t_end"));
				t.setT_dealstatus(rs.getString("t_dealstatus"));
				t.setT_ref(rs.getInt("t_ref"));
				t.setT_relevel(rs.getInt("t_relevel"));
				t.setT_restep(rs.getInt("t_restep"));
				list.add(t);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs!=null) 	rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null)  conn.close();
		}
		return list;
	}
}
