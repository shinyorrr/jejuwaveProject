package dao;

import java.util.Date;
                 
public class Qna_Board extends Qna_Hash {             //현지수정 
	private int b_num;
	private String user_id;
	private Date b_date;
	private String b_title;
	private String b_content;
	private String b_success;
	private String b_theme;
	
	
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_success() {
		return b_success;
	}
	public void setB_success(String b_success) {
		this.b_success = b_success;
	}
	public String getB_theme() {
		return b_theme;
	}
	public void setB_theme(String b_theme) {
		this.b_theme = b_theme;
	}

}
