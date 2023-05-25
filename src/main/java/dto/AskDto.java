package dto;

import java.util.Date;

public class AskDto {
	private int ask_num;
	private String id;
	private String nickName;
	
	private String title;
	private String content;
	private Date postDate;
	private int a_count;
	private String commenter;
	private String comment;
	private Date c_postDate;
	
	public int getAsk_num() {
		return ask_num;
	}
	public void setAsk_num(int ask_num) {
		this.ask_num = ask_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public int getA_count() {
		return a_count;
	}
	public void setA_count(int a_count) {
		this.a_count = a_count;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public AskDto() {
		super();
	}
	
	public AskDto(String id, String title, String content, String nickName) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.nickName = nickName;
	}
	@Override
	public String toString() {
		return "AskDto [ask_num=" + ask_num + ", id=" + id + ", title=" + title + ", content=" + content + ", postDate="
				+ postDate + ", a_count=" + a_count + ", nickName=" + nickName + "]";
	}
	
	
	
}
