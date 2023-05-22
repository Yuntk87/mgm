package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.UserDto;

public class UserDao extends JDBConnect{
	public UserDao(ServletContext application) {
		super(application);
	}

	public int insertUser(UserDto u ) {
		int res=0;
		String sql="insert into user(id,password,nickName,name,phone,pNumber,gender,addr1,addr2) values(?,?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1,u.getId());
			psmt.setString(2,u.getPassword());
			psmt.setString(3,u.getNickName());
			psmt.setString(4,u.getName());
			psmt.setString(5,u.getPhone());
			psmt.setString(6,u.getpNumber());
			psmt.setString(7,u.getGender());
			psmt.setString(8,u.getAddr1());
			psmt.setString(9,u.getAddr2());
			res=psmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("회원입력중 오류발생");
			e.printStackTrace();
		}return res;
				    
	}  
	public UserDto selectUser(String id) {
		UserDto u = null; 
		try {
			String sql = "select * from user where id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,  id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				u = new UserDto();
				u.setId(rs.getString("id"));
				u.setPassword(rs.getString("password"));
				u.setNickName(rs.getString("nickName"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setpNumber(rs.getString("pNumber"));
				u.setGender(rs.getString("gender"));
				u.setAddr1(rs.getString("addr1"));
				u.setAddr1(rs.getString("addr2"));
				u.setLevel(rs.getInt("level"));
			}
		} catch (SQLException e) {
			System.out.println("회원조회중 오류발생");
			System.out.println("회원조회중 오류발생");
			e.printStackTrace();
		}
		return u;
	}
	public UserDto selectUserNickname(String nickName) {
		UserDto u = null; 
		try {
			String sql = "select * from user where nickName=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,  nickName);
			rs = psmt.executeQuery();
			if(rs.next()) {
				u = new UserDto();
				u.setId(rs.getString("id"));
				u.setPassword(rs.getString("password"));
				u.setNickName(rs.getString("nickName"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setpNumber(rs.getString("pNumber"));
				u.setGender(rs.getString("gender"));
				u.setAddr1(rs.getString("addr1"));
				u.setAddr1(rs.getString("addr2"));
				u.setLevel(rs.getInt("level"));
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
				u.setUser_num(rs.getInt("user_num"));
				u.setId(rs.getString("id"));
				u.setPassword(rs.getString("password"));
				u.setNickName(rs.getString("nickName"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setpNumber(rs.getString("pNumber"));
				u.setGender(rs.getString("gender"));
				u.setAddr1(rs.getString("addr1"));
				u.setAddr1(rs.getString("addr2"));
				u.setLevel(rs.getInt("level"));
				u.setPostDate(rs.getTimestamp("postDate"));
				uList.add(u);
			}
		} catch (SQLException e) {
			System.out.println("전체조회중 오류발생");
			e.printStackTrace();
		}
		return uList;
	}
	
	
	
	public int delete(int userNum) {
		int result = 0;
		try {
			
			String sql = "DELETE FROM user WHERE user_num=?";
			psmt = con.prepareStatement(sql); 
			psmt.setInt(1, userNum);
			result = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int delete(String id) {
		int res = 0;
		String sql="delete from user where id=?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, id);
			res=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
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
		
	public ArrayList search(String nickName){
		String sql="SELECT * FROM user WHERE nickName LIKE ?";
		ArrayList<UserDto> userList=new ArrayList<UserDto>();
		nickName = "%"+nickName+"%";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,nickName);
			rs = psmt.executeQuery();
			UserDto m = null;
			while(rs.next()) {
				m = new UserDto();
				m.setUser_num(rs.getInt(1));
				m.setId(rs.getString(2));
				m.setPassword(rs.getString(3));
				m.setNickName(rs.getString(4));
				m.setName(rs.getString(5));
				m.setPhone(rs.getString(6));
				m.setpNumber(rs.getString(7));
				m.setGender(rs.getString(8));
				m.setAddr1(rs.getString(9));
				m.setAddr2(rs.getString(10));
				m.setLevel(rs.getInt(11));
				m.setPostDate(rs.getTimestamp(12));
				userList.add(m);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}
	
	public int update(UserDto dto) {
		System.out.println(dto);
		int res = 0;
		String sql = "UPDATE user SET password=?,gender=?,addr1=?,addr2=?, nickName=? WHERE id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getPassword());
			psmt.setString(2, dto.getGender());
			psmt.setString(3, dto.getAddr1());
			psmt.setString(4, dto.getAddr2());
			psmt.setString(5, dto.getNickName());
			psmt.setString(6, dto.getId());
			System.out.println(sql);
			res = psmt.executeUpdate();	
			System.out.println(res);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원정보수정실패 - trycatch");
		} return res;
	}
	
	public int updateLevel(String id, int lv) {
		int res = 0;
		String sql = "UPDATE user SET level = level+? WHERE id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, lv);
			psmt.setString(2, id);
			res = psmt.executeUpdate();	
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원레벨 수정오류");
		} return res;
	}
	
	public ArrayList<UserDto> userRanking(){
		ArrayList<UserDto> uList = new ArrayList<UserDto>();
		try {
			String sql = "select * from user WHERE NOT id='admin' ORDER BY level DESC, postDate DESC LIMIT 5";
			psmt = con.prepareStatement(sql);
			rs=psmt.executeQuery();
			UserDto u = null;
			
			while(rs.next()) {
				u = new UserDto();
				u.setUser_num(rs.getInt("user_num"));
				u.setId(rs.getString("id"));
				u.setPassword(rs.getString("password"));
				u.setNickName(rs.getString("nickName"));
				u.setName(rs.getString("name"));
				u.setPhone(rs.getString("phone"));
				u.setpNumber(rs.getString("pNumber"));
				u.setGender(rs.getString("gender"));
				u.setAddr1(rs.getString("addr1"));
				u.setAddr1(rs.getString("addr2"));
				u.setLevel(rs.getInt("level"));
				u.setPostDate(rs.getTimestamp("postDate"));
				uList.add(u);
			}
		} catch (SQLException e) {
			System.out.println("유저랭킹 조회중 오류발생");
			e.printStackTrace();
		}
		return uList;
	}
	
	public List<HashMap<String, String>> userRankingMonth(String firstDay, String lastDay){
		List<HashMap<String, String>> uList = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map = null;
		
		try {
			String sql = "SELECT a.*,b.level FROM (SELECT id,COUNT(*) FROM confirm_board WHERE postDate BETWEEN ? AND ? GROUP BY id ORDER BY count(*) DESC LIMIT 5) a "
					+ "INNER JOIN (SELECT DISTINCT c.id,u.level FROM confirm_board c LEFT OUTER JOIN user u ON c.id = u.id) b ON a.id = b.id";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, firstDay);
			psmt.setString(2, lastDay);
			rs = psmt.executeQuery();
			
			while(rs.next()) {		
				map = new HashMap<String, String>();
				map.put("id", rs.getString(1));
				map.put("count", Integer.toString(rs.getInt(2)));
				map.put("level", Integer.toString(rs.getInt(3)));
				uList.add(map);
			}
			
		} catch (SQLException e) {
			System.out.println("이달 유저랭킹 조회중 오류발생");
			e.printStackTrace();
		}
		return uList;
	}
	
	public List<HashMap<String, String>> RepeatMountain(String id){
		List<HashMap<String, String>> uList = new ArrayList<HashMap<String, String>>();
		HashMap<String, String> map = null;
		
		try {
			String sql = "SELECT m_name FROM (SELECT m_num FROM confirm_board WHERE id=? GROUP BY m_num having count(*) > 1) c INNER JOIN mountain_board m ON c.m_num = m.m_num";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {		
				map = new HashMap<String, String>();
				map.put("mname", rs.getString(1));
				uList.add(map);
			}
			System.out.println(uList);
			
		} catch (SQLException e) {
			System.out.println("반복등반 조회중 오류발생");
			e.printStackTrace();
		}
		return uList;
	}
	
	public String findId(String name,String phone) {
		String id=null;
		try {
			String sql="select id from user where name=? and phone=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, name);
			psmt.setString(2, phone);
			rs = psmt.executeQuery();
			if(rs.next()) {
				id=rs.getString(1);
				System.out.println(id+"-----");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("아이디찾기 오류");
	}return id;
	
   }
	
	public String findPwd(String id,String phone,String name) {
		String pwd=null;
		try {
			String sql="select password from user where id=?and phone=? and name=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, phone);
			psmt.setString(3, name);
			rs = psmt.executeQuery();
			if(rs.next()) {
				pwd=rs.getString("user.password");
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호 찾기 오류");
	}
	return pwd;
   }
	
}
	    
	
	
	
	
	
