package dao;

import java.util.Date;

public class Review {
	private int r_num;
	private String user_id;
	private String r_content;
	private Date r_date;
	private int r_avg;
	private int t_num;
	private int r_ref;
	private int r_restep;
	
	
	public int getR_ref() {
		return r_ref;
	}
	public void setR_ref(int r_ref) {
		this.r_ref = r_ref;
	}
	public int getR_restep() {
		return r_restep;
	}
	public void setR_restep(int r_restep) {
		this.r_restep = r_restep;
	}
	public int getT_num() {
		return t_num;
	}
	public void setT_num(int t_num) {
		this.t_num = t_num;
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public int getR_avg() {
		return r_avg;
	}
	public void setR_avg(int r_avg) {
		this.r_avg = r_avg;
	}
}
