package dao;

import java.util.Date;

public class Qna_Comment extends Qna_Board {
	
		private int b_num;
		private int com_num;
		private String user_id;
		private Date com_date;
		private String com_content;
		
		
		public int getB_num() {
			return b_num;
		}
		public void setB_num(int b_num) {
			this.b_num = b_num;
		}
		public int getCom_num() {
			return com_num;
		}
		public void setCom_num(int com_num) {
			this.com_num = com_num;
		}
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public Date getCom_date() {
			return com_date;
		}
		public void setCom_date(Date com_date) {
			this.com_date = com_date;
		}
		public String getCom_content() {
			return com_content;
		}
		public void setCom_content(String com_content) {
			this.com_content = com_content;
		}

	}



