package dao;

import java.util.Date;

public class Qna_Comment extends Qna_Board {
	
	
		private int com_num;
		private String com_content;
		private Date com_date;
		private String com_choose;
		
		
		public String getCom_choose() {
			return com_choose;
		}
		public void setCom_choose(String com_choose) {
			this.com_choose = com_choose;
		}
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
		public Date getCom_date() {
			return com_date;
		}
		public void setCom_date(Date com_date) {
			this.com_date = com_date;
		}

	}


