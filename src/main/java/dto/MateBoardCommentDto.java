package dto;

import java.util.Date;

public class MateBoardCommentDto {
    private Integer matec_num;
    private Integer mate_num;
    private String  commenter;
    private String  comment;
    private Date postDate;
    
    
	public Integer getMatec_num() {
		return matec_num;
	}
	public void setMatec_num(Integer matec_num) {
		this.matec_num = matec_num;
	}
	public Integer getMate_num() {
		return mate_num;
	}
	public void setMate_num(Integer mate_num) {
		this.mate_num = mate_num;
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
	
	
	public MateBoardCommentDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MateBoardCommentDto(String commenter, String comment, Integer mate_num) {
		super();
		this.mate_num = mate_num;
		this.commenter = commenter;
		this.comment = comment;
	}
	public MateBoardCommentDto(Integer matec_num, String commenter, String comment) {
		super();
		this.matec_num = matec_num;
		this.commenter = commenter;
		this.comment = comment;
	}
	
	@Override
	public String toString() {
		return "MateBoardCommentDto [matec_num=" + matec_num + ", mate_num=" + mate_num + ", commenter=" + commenter
				+ ", comment=" + comment + ", postDate=" + postDate + "]";
	}

}