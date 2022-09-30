package dao;

import java.sql.Date;

// community table
public class Commu {
	private int    c_num;
	private String user_id;
	private String c_content;
	private Date   c_date;
	private String c_hash;
	
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}
	public String getC_hash() {
		return c_hash;
	}
	public void setC_hash(String c_hash) {
		this.c_hash = c_hash;
	}
	
	// community_img table
	public class CommuImg {
		private int    c_img_num;
		private String c_img_path;
		
		public int getC_img_num() {
			return c_img_num;
		}
		public void setC_img_num(int c_img_num) {
			this.c_img_num = c_img_num;
		}
		public String getC_img_path() {
			return c_img_path;
		}
		public void setC_img_path(String c_img_path) {
			this.c_img_path = c_img_path;
		}
		
	}

}
