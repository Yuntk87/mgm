package dto;

public class MountainDto {
	private int m_num;
	private String m_name;
	private String m_addr_do;
	private String m_addr_si;
	private String m_addr_gu;
	private String m_addr;
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
	public String getM_addr_do() {
		return m_addr_do;
	}
	public void setM_addr_do(String m_addr_do) {
		this.m_addr_do = m_addr_do;
	}
	public String getM_addr_si() {
		return m_addr_si;
	}
	public void setM_addr_si(String m_addr_si) {
		this.m_addr_si = m_addr_si;
	}
	public String getM_addr_gu() {
		return m_addr_gu;
	}
	public void setM_addr_gu(String m_addr_gu) {
		this.m_addr_gu = m_addr_gu;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
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
	
	
	public MountainDto(String m_name, String m_addr_do, String m_addr_si, String m_addr_gu, String m_addr, int level) {
		super();
		this.m_name = m_name;
		this.m_addr_do = m_addr_do;
		this.m_addr_si = m_addr_si;
		this.m_addr_gu = m_addr_gu;
		this.m_addr = m_addr;
		this.level = level;
	}
	
	@Override
	public String toString() {
		return "MountainDto [m_num=" + m_num + ", m_name=" + m_name + ", m_addr_do=" + m_addr_do + ", m_addr_si="
				+ m_addr_si + ", m_addr_gu=" + m_addr_gu + ", m_addr=" + m_addr + ", level=" + level + ", m_recommend="
				+ m_recommend + "]";
	}
	

	
	
	
	
	
	

	
}
