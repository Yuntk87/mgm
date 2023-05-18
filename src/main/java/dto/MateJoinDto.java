package dto;

import java.util.Date;

public class MateJoinDto {
	private int matejNum;
	private int mateNum;
	private String id;
	private int mNum;
	private Date dDay;
	private String jId;
	private Date postDate;
	private String m_name; // join으로 산이름 출력용도
	
	public int getMatejNum() {
		return matejNum;
	}
	public void setMatejNum(int matejNum) {
		this.matejNum = matejNum;
	}
	public int getMateNum() {
		return mateNum;
	}
	public void setMateNum(int mateNum) {
		this.mateNum = mateNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getmNum() {
		return mNum;
	}
	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	public Date getdDay() {
		return dDay;
	}
	public void setdDay(Date dDay) {
		this.dDay = dDay;
	}
	public String getjId() {
		return jId;
	}
	public void setjId(String jId) {
		this.jId = jId;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	public MateJoinDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MateJoinDto(int mateNum, String id, int mNum, Date dDay, String jId) {
		super();
		this.mateNum = mateNum;
		this.id = id;
		this.mNum = mNum;
		this.dDay = dDay;
		this.jId = jId;
	}
	@Override
	public String toString() {
		return "MateJoinDto [matejNum=" + matejNum + ", mateNum=" + mateNum + ", id=" + id + ", mNum=" + mNum
				+ ", dDay=" + dDay + ", jId=" + jId + ", postDate=" + postDate + "]";
	}
	
	
}
