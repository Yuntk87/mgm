package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.z_memberDto;

public class z_memberDao extends JDBConnect{
	public z_memberDao(ServletContext application) {
		super(application);
	}
	
	public int insertMember(z_memberDto m ) {
		int res=0;
		String sql="insert into member(id,pwd,name,birth,addr_do,addr_si,addr_gu,addr,tel,nickName) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1,m.getId());
			psmt.setString(2,m.getPwd());
			psmt.setString(3,m.getName());
			psmt.setDate(4,new java.sql.Date(m.getBirth().getTime()));
			psmt.setString(5,m.getAddr_do());
			psmt.setString(6,m.getAddr_si());
			psmt.setString(7,m.getAddr_gu());
			psmt.setString(8,m.getAddr());
			psmt.setString(9,m.getTel());
			psmt.setString(10,m.getNickName());
			res=psmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("회원입력중 오류발생");
			e.printStackTrace();
		}return res;
				    
	}  public z_memberDto selectUser(String id) {
		z_memberDto m = null; 
		try {
			String sql = "select * from member where id=?";
			psmt = con.prepareStatement(sql);
			psmt.setString(1,  id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				m = new z_memberDto();
				m.setId(rs.getString(2));
				m.setPwd(rs.getString(3));
				m.setName(rs.getString(4));
				m.setBirth(rs.getDate(5));
				m.setAddr_do(rs.getString(6));
				m.setAddr_si(rs.getString(7));
				m.setAddr_gu(rs.getString(8));
				m.setAddr(rs.getString(9));
				m.setTel(rs.getString(10));
				m.setNickName(rs.getString(11));
			}
		} catch (SQLException e) {
			System.out.println("회원조회중 오류발생");
			e.printStackTrace();
		}
		return m;
	}
	
	
	public ArrayList<z_memberDto> selectAll(){
		ArrayList<z_memberDto> mList = new ArrayList<z_memberDto>();
		try {
			String sql = "select * from member";
			psmt = con.prepareStatement(sql);
				rs=psmt.executeQuery();
			z_memberDto m = null;
			while(rs.next()) {
				m = new z_memberDto();
				m.setId(rs.getString(2));
				m.setPwd(rs.getString(3));
				m.setName(rs.getString(4));
				m.setBirth(rs.getDate(5));
				m.setAddr_do(rs.getString(6));
				m.setAddr_si(rs.getString(7));
				m.setAddr_gu(rs.getString(8));
				m.setAddr(rs.getString(9));
				m.setTel(rs.getString(10));
				m.setNickName(rs.getString(11));
				mList.add(m);
			}
		} catch (SQLException e) {
			System.out.println("전체조회중 오류발생");
			e.printStackTrace();
		}
		return mList;
	}
	
	
	
	public int delete(String id) {
		int result = 0;
		try {
			
			String sql = "DELETE FROM member WHERE id=?";
			psmt = con.prepareStatement(sql); 
			psmt.setString(1, id);
			result = psmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int chkId(String id) {
		int res = 0;
		String query = "SELECT COUNT(*) FROM user WHERE id=? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
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
	    
	
	
	
	
	
