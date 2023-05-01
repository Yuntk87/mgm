package dto;

import java.util.Date;

public class ConfirmBoardDto {
	private int cd_num;
	private int m_num;
	private String id;
	private Date postDate;
	
	
	public int getCd_num() {
		return cd_num;
	}
	public void setCd_num(int cd_num) {
		this.cd_num = cd_num;
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
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	
	public ConfirmBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ConfirmBoardDto(int m_num, String id) {
		super();
		this.m_num = m_num;
		this.id = id;
	}
	
	
	@Override
	public String toString() {
		return "ConfirmBoardDto [cd_num=" + cd_num + ", m_num=" + m_num + ", id=" + id + ", postDate=" + postDate + "]";
	}
	
}
