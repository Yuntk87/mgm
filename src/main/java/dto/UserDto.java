package dto;

import java.util.Date;

public class UserDto {
	private int user_num;
	private String email;
	private String password;
	private String nickName;
	private String name;
	private String phone;
	private String pNumber;
	private String addr1;
	private String addr2;
	private Date postDate;
	
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getpNumber() {
		return pNumber;
	}
	public void setpNumber(String pNumber) {
		this.pNumber = pNumber;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	
	
	public UserDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserDto(String email, String password, String nickName, String name, String phone, String pNumber,
			String addr1, String addr2) {
		super();
		this.email = email;
		this.password = password;
		this.nickName = nickName;
		this.name = name;
		this.phone = phone;
		this.pNumber = pNumber;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}
	
	@Override
	public String toString() {
		return "UserDto [user_num=" + user_num + ", email=" + email + ", password=" + password + ", nickName="
				+ nickName + ", name=" + name + ", phone=" + phone + ", pNumber=" + pNumber + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", postDate=" + postDate + "]";
	}
	

}
