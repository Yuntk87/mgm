package dto;

import java.util.Date;

public class AskCommentDto {
	private Integer ac_num;
    private Integer ask_num;
    private String  commenter;
    private String  comment;
    private Date c_postDate;
    
    
	public Integer getAc_num() {
		return ac_num;
	}
	public void setAc_num(Integer ac_num) {
		this.ac_num = ac_num;
	}
	public Integer getAsk_num() {
		return ask_num;
	}
	public void setAsk_num(Integer ask_num) {
		this.ask_num = ask_num;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getC_postDate() {
		return c_postDate;
	}
	public void setC_postDate(Date c_postDate) {
		this.c_postDate = c_postDate;
	}
	
	public AskCommentDto() {
		super();
	}
	public AskCommentDto(String commenter, String comment, Integer ask_num) {
		super();
		this.ask_num = ask_num;
		this.commenter = commenter;
		this.comment = comment;
	}
	
	
	public AskCommentDto(Integer ac_num, String commenter, String comment) {
		super();
		this.ac_num = ac_num;
		this.commenter = commenter;
		this.comment = comment;
	}
	public AskCommentDto(Integer ac_num, String comment) {
		super();
		this.ac_num = ac_num;
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "AskCommentDto [ac_num=" + ac_num + ", ask_num=" + ask_num + ", commenter=" + commenter + ", comment="
				+ comment + ", c_postDate=" + c_postDate + "]";
	}
    
	
}
