package dto;


import java.time.LocalDateTime;
import java.util.Date;

public class MateBoardDto {
	private int mate_num;
	private int m_num;
	private String id;
	private String title;
	private String content;
	private Date dDay;
	private int mateLimit;
	private int viewCount;
	private Date postDate;
	private int commentCount;
	private String m_name; // join으로 산이름 출력용도
	
	
	public int getMate_num() {
		return mate_num;
	}
	public void setMate_num(int mate_num) {
		this.mate_num = mate_num;
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
	public int getMateLimit() {
		return mateLimit;
	}
	public void setMateLimit(int mateLimit) {
		this.mateLimit = mateLimit;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public int getCommentCount() {
		return commentCount;
	}
	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	
	
	public MateBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MateBoardDto(int m_num, String id, String title, String content, Date dDay, int mateLimit) {
		super();
		this.m_num = m_num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.dDay = dDay;
		this.mateLimit = mateLimit;
	}
	
	public MateBoardDto(int mate_num, String title, String content, Date dDay, int mateLimit) {
		super();
		this.mate_num = mate_num;
		this.title = title;
		this.content = content;
		this.dDay = dDay;
		this.mateLimit = mateLimit;
	}
	@Override
	public String toString() {
		return "MateBoardDto [mate_num=" + mate_num + ", m_num=" + m_num + ", id=" + id + ", title=" + title
				+ ", content=" + content + ", dDay=" + dDay + ", mateLimit=" + mateLimit + ", viewCount=" + viewCount
				+ ", postDate=" + postDate + ", commentCount=" + commentCount + ", m_name=" + m_name + "]";
	}
	
}
