package dto;

import java.util.Date;

public class FreeBoardDto {
	private int fbnum;
	private String category;
	private String id;
	private String nickName;
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	private String title;
	private String content;
	private Date postDate;
	private int viewCount;
	private int c_count;
	
	
	public int getFbnum() {
		return fbnum;
	}
	public void setFbnum(int fbnum) {
		this.fbnum = fbnum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getC_count() {
		return c_count;
	}
	public void setC_count(int c_count) {
		this.c_count = c_count;
	}
	
	
	public FreeBoardDto() {
		super();
	}
	
	public FreeBoardDto(String category, String id, String title, String content) {
		super();
		this.category = category;
		this.id = id;
		this.title = title;
		this.content = content;
	}
	public FreeBoardDto(String category, String id, String title, String content, String nickName) {
		super();
		this.category = category;
		this.id = id;
		this.title = title;
		this.content = content;
		this.nickName = nickName;
	}	
	public FreeBoardDto(int fbnum, String category, String title, String content, String id, String nickName) {
		super();
		this.fbnum = fbnum;
		this.category = category;
		this.id = id;
		this.title = title;
		this.content = content;
		this.nickName = nickName;
	}
	public FreeBoardDto(int fbnum, String category, String title, String content) {
		super();
		this.fbnum = fbnum;
		this.category = category;
		this.title = title;
		this.content = content;
	}
	@Override
	public String toString() {
		return "FreeBoardDto [fbnum=" + fbnum + ", category=" + category + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", postDate=" + postDate + ", viewCount=" + viewCount + ", c_count="
				+ c_count + "]";
	}
	

	
	
	
	
	
	
}
