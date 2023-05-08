package dto;

import java.util.Date;

public class z_memberDto {
	private int mem_num;
	private String id;
	private String pwd;
	private String name;
	private String nickName;
	private Date birth;
	private String addr_do;
	private String addr_si;
	private String addr_gu;
	private String addr;	
	private String tel;
	private Date postDate;
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getAddr_do() {
		return addr_do;
	}
	public void setAddr_do(String addr_do) {
		this.addr_do = addr_do;
	}
	public String getAddr_si() {
		return addr_si;
	}
	public void setAddr_si(String addr_si) {
		this.addr_si = addr_si;
	}
	public String getAddr_gu() {
		return addr_gu;
	}
	public void setAddr_gu(String addr_gu) {
		this.addr_gu = addr_gu;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	public z_memberDto() {
		super();
	}
	
	public z_memberDto(String id, String pwd, String name, String nickName, Date birth, String addr_do, String addr_si, String addr_gu,
			String addr, String tel) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.addr_do = addr_do;
		this.addr_si = addr_si;
		this.addr_gu = addr_gu;
		this.addr = addr;
		this.tel = tel;
		this.nickName = nickName;
	}
	
	
	@Override
	public String toString() {
		return "memberDto [mem_num=" + mem_num + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", addr_do=" + addr_do + ", addr_si=" + addr_si + ", addr_gu=" + addr_gu + ", addr=" + addr + ", tel="
				+ tel + ", postDate=" + postDate + ", nickName=" + nickName + "]";
	}
	
	
	
	

	
	
	
}
