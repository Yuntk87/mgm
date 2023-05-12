package dto;

import java.util.Date;

public class UserDto {
	private int user_num;
	private String id;
	private String password;
	private String nickName;
	private String name;
	private String phone;
	private String pNumber;
	private String gender;
	private String addr1;
	private String addr2;
	private int level;
	private Date postDate;
	
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
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
	
	public UserDto(String id, String password, String nickName, String name, String phone, String pNumber,
			String gender, String addr1, String addr2) {
		super();
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.name = name;
		this.phone = phone;
		this.pNumber = pNumber;
		this.gender = gender;
		this.addr1 = addr1;
		this.addr2 = addr2;
	}
	
	@Override
	public String toString() {
		return "UserDto [user_num=" + user_num + ", id=" + id + ", password=" + password + ", nickName=" + nickName
				+ ", name=" + name + ", phone=" + phone + ", pNumber=" + pNumber + ", gender=" + gender + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", level=" + level + ", postDate=" + postDate + "]";
	}
	

}
