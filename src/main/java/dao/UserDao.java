package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.UserDto;
import dto.memberDto;

public class UserDao extends JDBConnect{
	public UserDao(ServletContext application) {
		super(application);
	}
	
	public int insertUser(UserDto u ) {
		int res=0;
		String sql="insert into user(email,password,nickName,name,phone,pNumber,addr1,addr2) values(?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1,u.getEmail());
			psmt.setString(2,u.getPassword());
			psmt.setString(3,u.getNickName());
			psmt.setString(4,u.getName());
			psmt.setString(5,u.getPhone());
			psmt.setString(6,u.getpNumber());
			psmt.setString(7,u.getAddr1());
			psmt.setString(8,u.getAddr2());
			res=psmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("회원입력중 오류발생");
			e.printStackTrace();
		}return res;
				    
	}  public UserDto selectUser(String nickName) {
		UserDto u = null; 
		try {
			String sql = "select * from user where nickName=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,  nickName);
			rs = psmt.executeQuery();
			if(rs.next()) {
				u = new UserDto();
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setNickName(rs.getString("nickName"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setpNumber(rs.getString("pNumber"));
				u.setAddr1(rs.getString("addr1"));
				u.setAddr1(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			System.out.println("회원조회중 오류발생");
			e.printStackTrace();
		}
		return u;
	}
	
	
	public ArrayList<UserDto> selectAll(){
		ArrayList<UserDto> uList = new ArrayList<UserDto>();
		try {
			String sql = "select * from user";
			psmt = con.prepareStatement(sql);
			rs=psmt.executeQuery();
			UserDto u = null;
			
			while(rs.next()) {
				u = new UserDto();
				u.setEmail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setNickName(rs.getString("nickName"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setpNumber(rs.getString("pNumber"));
				u.setAddr1(rs.getString("addr1"));
				u.setAddr1(rs.getString("addr2"));
				uList.add(u);
			}
		} catch (SQLException e) {
			System.out.println("전체조회중 오류발생");
			e.printStackTrace();
		}
		return uList;
	}
	
	
	
	public int delete(String nickName) {
		int result = 0;
		try {
			
			String sql = "DELETE FROM user WHERE nickName=?";
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, nickName);
			result = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int chkId(String nickName) {
		int res = 0;
		String query = "SELECT COUNT(*) FROM user WHERE nickName=? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, nickName);
			rs = psmt.executeQuery();
			if(rs.next()) {
				res = rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("아이디 조회 중 예외 발생");
			e.printStackTrace();
		} 
		return res;
	}
	
}
	    
	
	
	
	
	
