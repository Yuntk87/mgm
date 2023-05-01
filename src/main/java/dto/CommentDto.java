package dto;

import java.util.Date;

public class CommentDto {
    private Integer fbc_num;
    private Integer fb_num;
    private String  commenter;
    private String  comment;
    private Date postDate;


	public Integer getFbc_num() {
		return fbc_num;
	}
	public void setFbc_num(Integer fbc_num) {
		this.fbc_num = fbc_num;
	}
	public Integer getFb_num() {
		return fb_num;
	}
	public void setFb_num(Integer fb_num) {
		this.fb_num = fb_num;
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
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	
	public CommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentDto(String commenter, String comment, Integer fb_num) {
		super();
		this.fb_num = fb_num;
		this.commenter = commenter;
		this.comment = comment;
	}
	
	public CommentDto(Integer fbc_num, String commenter, String comment) {
		super();
		this.fbc_num = fbc_num;
		this.commenter = commenter;
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "CommentDto [fbc_num=" + fbc_num + ", fb_num=" + fb_num + ", commenter=" + commenter + ", comment="
				+ comment + ", postDate=" + postDate + "]";
	}

	


}