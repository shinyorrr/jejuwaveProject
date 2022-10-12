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
	
	public int totalRev(int t_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int totRe = 0;
		String sql = "select count(t_num) from review where t_num=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totRe = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		System.out.println("totRe -->"+ totRe);
		return totRe;
	}
	
	
	
	public List<Review> revList(int revStartRow, int revEndRow, int t_num) throws SQLException{
		List<Review> list = new ArrayList<Review>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * "
					+"from(select rownum rn, a.*"
					+"from (select * from review where t_num = ?  order by r_date asc) a)"
					+"where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_num);
			pstmt.setInt(2, revStartRow);
			pstmt.setInt(3, revEndRow);
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
	
	// ============ 리뷰 등록 ==================//
	public int insert(Review review) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into review values (review_seq.nextval,?,?,sysdate,?,?)";
		try {
			System.out.println(review.getUser_id());
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, review.getUser_id());
			pstmt.setString(2, review.getR_content());
			
			pstmt.setInt(3, review.getR_avg());
			pstmt.setInt(4, review.getT_num());

			result = pstmt.executeUpdate();
			if(result > 0) {
				System.out.println("insert 완료");
			} else {
				System.out.println("insert 실패");
			}
			
			System.out.println("result -->"+result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	
		return result;
	}

	public int select(int t_num) throws SQLException {
		System.out.println("ReviewDao select Strart.....");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int avgReview = 0;
		String sql = "select ROUND(sum (r_avg)/count(*), 0) as user_avg From review where t_num=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			avgReview = rs.getInt("user_avg");
			
			System.out.println("reviewDao select user_avg -->"+rs.getInt("user_avg"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		System.out.println("avgReview --->"+avgReview);
		return avgReview;
	}
}
