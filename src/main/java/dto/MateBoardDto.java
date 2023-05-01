package dto;

import java.util.Date;

public class MateBoardDto {
	private int num;
	private int m_num;
	private String id;
	private String nickName;
	private String title;
	private String content;
	private Date dDay;
	private Date postDate;
	private int viewCount;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public Date getdDay() {
		return dDay;
	}
	public void setdDay(Date dDay) {
		this.dDay = dDay;
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
	
	
	public MateBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MateBoardDto(int m_num, String id, String nickName, String title, String content, Date dDay) {
		super();
		this.m_num = m_num;
		this.id = id;
		this.nickName = nickName;
		this.title = title;
		this.content = content;
		this.dDay = dDay;
	}
	
	
	@Override
	public String toString() {
		return "MateBoardDto [num=" + num + ", m_num=" + m_num + ", id=" + id + ", nickName=" + nickName + ", title="
				+ title + ", content=" + content + ", dDay=" + dDay + ", postDate=" + postDate + ", viewCount="
				+ viewCount + "]";
	}
	
	
	
}
