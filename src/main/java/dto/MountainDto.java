package dto;

public class MountainDto {
	private int m_num;
	private String m_name;
	private String m_addr_1;
	private String m_addr_2;
	private int level;
	private int m_recommend;
	
	
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_addr_1() {
		return m_addr_1;
	}
	public void setM_addr_1(String m_addr_1) {
		this.m_addr_1 = m_addr_1;
	}
	public String getM_addr_2() {
		return m_addr_2;
	}
	public void setM_addr_2(String m_addr_2) {
		this.m_addr_2 = m_addr_2;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getM_recommend() {
		return m_recommend;
	}
	public void setM_recommend(int m_recommend) {
		this.m_recommend = m_recommend;
	}
	
	
	public MountainDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MountainDto(String m_name, String m_addr_1, String m_addr_2, int level) {
		super();
		this.m_name = m_name;
		this.m_addr_1 = m_addr_1;
		this.m_addr_2 = m_addr_2;
		this.level = level;
	}
	
	@Override
	public String toString() {
		return "MountainDto [m_num=" + m_num + ", m_name=" + m_name + ", m_addr_1=" + m_addr_1 + ", m_addr_2="
				+ m_addr_2 + ", level=" + level + ", m_recommend=" + m_recommend + "]";
	}

	
}
