package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Qna_BoardDao {
	private static Qna_BoardDao instance;

	private Qna_BoardDao() {
	}

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
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from qna_board";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())
				tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return tot;
	}


	public List<Qna_Board> getBoardList(int startRow , int endRow, int sort) throws SQLException {
		List<Qna_Board> list = new ArrayList<Qna_Board>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(sort==1) {
			String sql = "select * from ( select rownum rn, a.*, fn_user_img(a.user_id) fn_user_img from (select A.B_NUM, A.user_id , A.b_title,A.b_content,A.b_success, A.b_date,b.l_hash1,b.l_hash2,b.l_hash3   from qna_board A, \r\n"
					+ "		 	qna_hash B WHERE A.B_NUM = B.B_NUM order by A.b_date desc) a )\r\n"
					+ "		 		 where rn between ? and ?";
			
			System.out.println("Qna_BoardDao getBoardList sql->"+sql);
			System.out.println("Qna_BoardDao getBoardList startRow->"+startRow);
			System.out.println("Qna_BoardDao getBoardList endRow->"+endRow);
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				System.out.println(startRow);
				System.out.println(endRow);
				
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
	
					Qna_Board board = new Qna_Board();
					board.setB_num(rs.getInt("b_num"));
					System.out.println(rs.getInt("b_num"));
					board.setUser_id(rs.getString("user_id"));
					board.setB_title(rs.getString("b_title"));
					board.setB_content(rs.getString("b_content"));
					board.setFn_user_img(rs.getString("fn_user_img"));
	
					board.setL_hash1(rs.getString("l_hash1"));
					System.out.println("Qna_BoardDao getBoardList l_hash1->"+rs.getString("l_hash1"));
					board.setL_hash2(rs.getString("l_hash2"));
					System.out.println("Qna_BoardDao getBoardList l_hash2->"+rs.getString("l_hash2"));
					board.setL_hash3(rs.getString("l_hash3"));
					System.out.println("Qna_BoardDao getBoardList l_hash3->"+rs.getString("l_hash3"));
	
					if (rs.getString("b_success").equals("Y")) {
						board.setB_success("채택완료");
	
					} else {
						board.setB_success("답변대기");
					}
					list.add(board);
				}
			} catch (Exception e) {
				System.out.println("Qna_BoardDao getBoardList getMessage->"+e.getMessage());
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
		
		}
		
		if(sort==2) {
			String sql = "select * from ( select rownum rn, a.*, fn_user_img(a.user_id) fn_user_img from (select A.B_NUM, A.user_id , A.b_title,A.b_content,A.b_success, A.b_date,b.l_hash1,b.l_hash2,b.l_hash3   from qna_board A, \r\n"
					+ "		 	qna_hash B WHERE A.B_NUM = B.B_NUM order by A.com_cnt desc) a )\r\n"
					+ "		 		 where rn between ? and ?";
			
			System.out.println("Qna_BoardDao getBoardList sql->"+sql);
			System.out.println("Qna_BoardDao getBoardList startRow->"+startRow);
			System.out.println("Qna_BoardDao getBoardList endRow->"+endRow);
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				System.out.println(startRow);
				System.out.println(endRow);
				
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
	
					Qna_Board board = new Qna_Board();
					board.setB_num(rs.getInt("b_num"));
					System.out.println(rs.getInt("b_num"));
					board.setUser_id(rs.getString("user_id"));
					board.setB_title(rs.getString("b_title"));
					board.setB_content(rs.getString("b_content"));
					board.setFn_user_img(rs.getString("fn_user_img"));
	
					board.setL_hash1(rs.getString("l_hash1"));
					System.out.println("Qna_BoardDao getBoardList l_hash1->"+rs.getString("l_hash1"));
					board.setL_hash2(rs.getString("l_hash2"));
					System.out.println("Qna_BoardDao getBoardList l_hash2->"+rs.getString("l_hash2"));
					board.setL_hash3(rs.getString("l_hash3"));
					System.out.println("Qna_BoardDao getBoardList l_hash3->"+rs.getString("l_hash3"));
	
					if (rs.getString("b_success").equals("Y")) {
						board.setB_success("채택완료");
	
					} else {
						board.setB_success("답변대기");
					}
					list.add(board);
				}
			} catch (Exception e) {
				System.out.println("Qna_BoardDao getBoardList getMessage->"+e.getMessage());
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
	
		}
				
		return list;
	}

	public Qna_Board select(int b_num) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select A.B_NUM, A.user_id , A.b_title,A.b_content,A.b_success,A.b_theme,A.b_date,b.l_hash1, b.l_hash2,b.l_hash3,fn_user_img(a.user_id) fn_user_img \r\n"
				+ "		 		from qna_board A, qna_hash B \r\n" + "		 		WHERE A.B_NUM = B.B_NUM \r\n"
				+ "                and a.b_num =" + b_num;

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
				board.setL_hash1(rs.getString("l_hash1"));
				board.setL_hash2(rs.getString("l_hash2"));
				board.setL_hash3(rs.getString("l_hash3"));
				board.setB_theme(rs.getString("b_theme"));
				board.setFn_user_img(rs.getString("fn_user_img"));

				if (rs.getString("b_success").equals("Y")) {
					board.setB_success("채택완료");

				} else {
					board.setB_success("답변대기");
				}

			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return board;
	}

	   public int insert(Qna_Board board, String hashString) throws SQLException {
		      int b_num = board.getB_num();
		      System.out.println(b_num);
		      Connection conn = null;
		      PreparedStatement pstmt = null;
		      ResultSet rs = null;
		      int result = 0;
		         System.out.println("hashString-->"+hashString);
		      String[] hasharray = hashString.split("#");
		      //배열을 list로 변환. add해야하기 때문 (aslist만 하면 add함수 쓸수없음)
		      List<String> hash = new ArrayList<String>(Arrays.asList(hasharray));
		      
		      //해시태그 3개 미만 입력했을때 빈칸 null로 채우기
		      if(hash.size()==2) {
		    	  hash.add(2, null);
		    	  hash.add(3, null);
		    	  
		      }
		      if(hash.size()==3) {
		    	  hash.add(3, null);
		      }
		      
		      if(hash.size()==1) {
		    	  hash.add(1,null);
		    	  hash.add(2,null);
		    	  hash.add(3,null);
		      }
		      

		      String sql1 = "select nvl(max(b_num),0) from qna_board";
		      String sql = "insert into qna_board (b_num,user_id,b_date,b_title,b_content,b_success,b_theme) values(?,?,sysdate,?,?,?,?)";
		      //해시태그
		      String sql2 = "insert into qna_hash (b_num, l_hash1 , l_hash2 , l_hash3 ) values(?,?,?,?)";
		      System.out.println("Qna_BoardDao insert sql2-->"+sql2);
		      try {
		         conn = getConnection();
		         pstmt = conn.prepareStatement(sql1);
		         rs = pstmt.executeQuery();
		         rs.next();
		         int number = rs.getInt(1) + 1;
		         rs.close();
		         pstmt.close();

		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, number);

		         pstmt.setString(2, board.getUser_id());
		         pstmt.setString(3, board.getB_title());
		         pstmt.setString(4, board.getB_content());
		         pstmt.setString(5, "N");
		         pstmt.setString(6, board.getB_theme());
		         // Board Update
		          result=pstmt.executeUpdate();
		         
		         pstmt.close();

		     
		          pstmt = conn.prepareStatement(sql2); 
		          pstmt.setInt(1,number);
		          System.out.println("hash1 -->"+hash.get(1));
		          pstmt.setString(2, hash.get(1));
		          System.out.println("hash 2-->"+hash.get(2));
		          pstmt.setString(3, hash.get(2));
		          System.out.println("hash 3-->"+hash.get(3));
		          pstmt.setString(4, hash.get(3));
		           
		         
		          result=pstmt.executeUpdate();
		           
		          
		      } catch (Exception e) {
		          System.out.println("Qna_BoardDao insert e.getMessage()->"+e.getMessage());
		      } finally {
		         if (rs != null)
		            rs.close();
		         if (pstmt != null)
		            pstmt.close();
		         if (conn != null)
		            conn.close();
		      }
		       System.out.println("Qna_BoardDao insert result->"+result);
		      return result;
		   }

	public int update(Qna_Board board, String hashString) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update qna_board set b_title=?,b_content=?, b_theme=? where b_num=?";
		String sql2 = "update qna_hash set l_hash1=?, l_hash2=?, l_hash3=? where b_num=?";
		//해시태그 받아서 쪼개기
		String[] hasharray = hashString.split("#");
		   //배열을 list로 변환. add해야하기 때문 (aslist만 하면 add함수 쓸수없음)
	      List<String> hash = new ArrayList<String>(Arrays.asList(hasharray));
	      
	      //해시태그 3개 미만 입력했을때 빈칸 null로 채우기
	      if(hash.size()==1) {
	    	  hash.add(1,null);
	    	  hash.add(2,null);
	    	  hash.add(3,null);
	      }
	      if(hash.size()==2) {
	    	  hash.add(2, null);
	    	  hash.add(3, null);
	    	  
	      }
	      if(hash.size()==3) {
	    	  hash.add(3, null);
	      }
	      

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_title());
			pstmt.setString(2, board.getB_content());
			pstmt.setString(3, board.getB_theme());
			pstmt.setInt(4, board.getB_num());

			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, hash.get(1));
			pstmt.setString(2, hash.get(2));
			pstmt.setString(3, hash.get(3));
			pstmt.setInt(4, board.getB_num());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public int delete(int b_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql1 = "delete from qna_hash where b_num=?";
		String sql2 = "delete from qna_comment where b_num=?";
		String sql3 = "delete from qna_board where b_num=?";


		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, b_num);
			pstmt.executeUpdate();		
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, b_num);
			pstmt.executeUpdate();		
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, b_num);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}

	/* main화면 QnA list */
	public List<Qna_Board> mainbdlist(int startRow, int endRow) throws SQLException {
		List<Qna_Board> list = new ArrayList<Qna_Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select *" + "from (select rownum rn, a.*"
				+ "from (select * from qna_board order by b_num desc) a)" + "where rn between ? and ?";

		System.out.println("mainbdlist startRow ->" + startRow);
		System.out.println("mainbdlist endRow ->" + endRow);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return list;
	}
	
	public int choose(int b_num, int com_num) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "update qna_board set b_success='Y' where b_num=?";
		String sql2 = "update qna_comment set com_choose='Y' where b_num =? and com_num =?";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, b_num);
			pstmt.setInt(2, com_num);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}return result;	
	}
	
	//qnaList 답변을 기다리는 글만 보기
	public List<Qna_Board> getBoardList2(int startRow , int endRow, int sort ) throws SQLException {
		List<Qna_Board> list = new ArrayList<Qna_Board>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		if(sort==1) {
			String sql = "select * from ( select rownum rn, a.*, fn_user_img(a.user_id) fn_user_img from (select A.B_NUM, A.user_id , A.b_title,A.b_content,A.b_success, A.b_date,b.l_hash1,b.l_hash2,b.l_hash3   from qna_board A, \r\n"
					+ "		 	qna_hash B WHERE A.B_NUM = B.B_NUM order by A.b_date desc) a )\r\n"
					+ "		 		 where rn between ? and ? and b_success like 'N' ";
			
			System.out.println("Qna_BoardDao getBoardList sql->"+sql);
			System.out.println("Qna_BoardDao getBoardList startRow->"+startRow);
			System.out.println("Qna_BoardDao getBoardList endRow->"+endRow);
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				System.out.println(startRow);
				System.out.println(endRow);
				
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
	
					Qna_Board board = new Qna_Board();
					board.setB_num(rs.getInt("b_num"));
					System.out.println(rs.getInt("b_num"));
					board.setUser_id(rs.getString("user_id"));
					board.setB_title(rs.getString("b_title"));
					board.setB_content(rs.getString("b_content"));
					board.setFn_user_img(rs.getString("fn_user_img"));
	
					board.setL_hash1(rs.getString("l_hash1"));
					System.out.println("Qna_BoardDao getBoardList l_hash1->"+rs.getString("l_hash1"));
					board.setL_hash2(rs.getString("l_hash2"));
					System.out.println("Qna_BoardDao getBoardList l_hash2->"+rs.getString("l_hash2"));
					board.setL_hash3(rs.getString("l_hash3"));
					System.out.println("Qna_BoardDao getBoardList l_hash3->"+rs.getString("l_hash3"));
	
					if (rs.getString("b_success").equals("Y")) {
						board.setB_success("채택완료");
	
					} else {
						board.setB_success("답변대기");
					}
					list.add(board);
				}
			} catch (Exception e) {
				System.out.println("Qna_BoardDao getBoardList getMessage->"+e.getMessage());
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
		
		}
		
		if(sort==2) {
			String sql = "select * from ( select rownum rn, a.*, fn_user_img(a.user_id) fn_user_img from (select A.B_NUM, A.user_id , A.b_title,A.b_content,A.b_success, A.b_date,b.l_hash1,b.l_hash2,b.l_hash3   from qna_board A, \r\n"
					+ "		 	qna_hash B WHERE A.B_NUM = B.B_NUM order by A.com_cnt desc) a )\r\n"
					+ "		 		 where rn between ? and ? and b_success like 'N' ";
			
			System.out.println("Qna_BoardDao getBoardList sql->"+sql);
			System.out.println("Qna_BoardDao getBoardList startRow->"+startRow);
			System.out.println("Qna_BoardDao getBoardList endRow->"+endRow);
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				System.out.println(startRow);
				System.out.println(endRow);
				
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
	
					Qna_Board board = new Qna_Board();
					board.setB_num(rs.getInt("b_num"));
					System.out.println(rs.getInt("b_num"));
					board.setUser_id(rs.getString("user_id"));
					board.setB_title(rs.getString("b_title"));
					board.setB_content(rs.getString("b_content"));
					board.setFn_user_img(rs.getString("fn_user_img"));
	
					board.setL_hash1(rs.getString("l_hash1"));
					System.out.println("Qna_BoardDao getBoardList l_hash1->"+rs.getString("l_hash1"));
					board.setL_hash2(rs.getString("l_hash2"));
					System.out.println("Qna_BoardDao getBoardList l_hash2->"+rs.getString("l_hash2"));
					board.setL_hash3(rs.getString("l_hash3"));
					System.out.println("Qna_BoardDao getBoardList l_hash3->"+rs.getString("l_hash3"));
	
					if (rs.getString("b_success").equals("Y")) {
						board.setB_success("채택완료");
	
					} else {
						board.setB_success("답변대기");
					}
					list.add(board);
				}
			} catch (Exception e) {
				System.out.println("Qna_BoardDao getBoardList getMessage->"+e.getMessage());
			} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			}
	
		}
				
		return list;
	}
	
	
	
	

}
