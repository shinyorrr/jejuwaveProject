package dao;

import java.util.Date;

public class Qna_Comment extends Qna_Board {
	
		private Date com_date;
		public Date getCom_date() {
			return com_date;
		}
		public void setCom_date(Date com_date) {
			this.com_date = com_date;
		}
		private int com_num;
		private String com_content;
		
		
		public int getCom_num() {
			return com_num;
		}
		public void setCom_num(int com_num) {
			this.com_num = com_num;
		}
	
		public String getCom_content() {
			return com_content;
		}
		public void setCom_content(String com_content) {
			this.com_content = com_content;
		}

	}


