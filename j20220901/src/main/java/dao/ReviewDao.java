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

public class ReviewDao {
	private static ReviewDao instance;
	private ReviewDao() {}
	public static ReviewDao getinstance() {
		if(instance == null) {
			instance = new ReviewDao();
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
	
	public int getTotalRev() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from review";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if( rs != null) rs.close();
			if( stmt != null) stmt.close();
			if( conn != null) conn.close();
		}
		return tot;	
	}
	
	public List<Review> revList(int revStartRow, int revEndRow) throws SQLException{
		List<Review> list = new ArrayList<Review>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from(select rownum rn, a.*"
					+"from (select * from review order by r_num desc) a)"
					+"where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, revStartRow);
			pstmt.setInt(2, revEndRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Review review = new Review();
				review.setR_num(rs.getInt("r_num"));
				review.setT_num(rs.getInt("t_num"));
				review.setUser_id(rs.getString("user_id"));
				review.setR_content(rs.getString("r_content"));
				review.setR_date(rs.getDate("r_date"));
				review.setR_avg(rs.getInt("r_avg"));
				list.add(review);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
}
