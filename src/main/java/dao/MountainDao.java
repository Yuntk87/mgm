package dao;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;

import common.JDBConnect;

import dto.MountainDto;


public class MountainDao extends JDBConnect{

	public MountainDao(ServletContext application) {
		super(application);
		// TODO Auto-generated constructor stub
	}
	
	public int insertMountain (MountainDto m) {
		int res=0;
		String sql = "INSERT INTO mountain_board(m_name, m_addr_1, m_addr_2, level) values(?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, m.getM_name() );
			psmt.setString(2, m.getM_addr_1());
			psmt.setString(3, m.getM_addr_2());
			psmt.setInt(4, m.getLevel());
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("산 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int updateLevel(int level) {
		int res=0;
		String sql = "UPDATE mountain_board SET level=? WHERE m_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, level);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("레벨 수정 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public MountainDto selectMountain(int num) {
		MountainDto m = null;
		String query = "SELECT*FROM mountain_board WHERE m_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				m = new MountainDto();
				m.setM_num(rs.getInt("m_num"));
				m.setM_name(rs.getString("m_name"));
				m.setM_addr_1(rs.getString("m_addr_1"));
				m.setM_addr_2(rs.getString("m_addr_2"));
				m.setLevel(rs.getInt("level"));
				m.setM_recommend(rs.getInt("m_recommend"));
				return m;
			}
		}
		catch (Exception e) {
			System.out.println("산 조회 중 예외 발생");
			e.printStackTrace();
		}
		return m;
	}
	
	
	 public MountainDto selectMountain (String id) {
		 	MountainDto m = null; 
			try {
				String sql = "SELECT * FROM mountain_board WHERE m_name=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1,  id);
				rs = psmt.executeQuery();
				if(rs.next()) {
					m = new MountainDto();
					m.setM_num(rs.getInt("m_num"));
					m.setM_name(rs.getString("m_name"));
					m.setM_addr_1(rs.getString("m_addr_1"));
					m.setM_addr_2(rs.getString("m_addr_2"));
					m.setLevel(rs.getInt("level"));
					m.setM_recommend(rs.getInt("m_recommend"));
				}
			} catch (SQLException e) {
				System.out.println("산 조회중 오류발생");
				e.printStackTrace();
			}
			return m;
		}
	 
	public int selectMountainNum(String name) {
		int res = 0;
		String query = "SELECT m_num FROM mountain_board WHERE m_name=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt("m_num");
				return res;
			}
		}
		catch (Exception e) {
			System.out.println("산이름 조회 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	

	public int deleteMountain(int num) {
		int res=0;
		String sql = "DELETE FROM mountain_board WHERE m_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("산 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public List<MountainDto> selectList(Map<String, String>map){
		ArrayList<MountainDto> mbl = new ArrayList<MountainDto>();
		MountainDto m = null;
		String query = "SELECT*FROM mountain_board";
		if(map.get("searchWord")!=null) {
			query += " WHERE "+ map.get("searchField")+" "
					+ " LIKE '%" + map.get("searchWord")+"%' ";
		}
		query += " ORDER BY m_num DESC";
		query += " LIMIT " + map.get("offset")+","+map.get("pageSize");
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
			    m = new MountainDto();
				
				m.setM_num(rs.getInt("m_num"));
				m.setM_name(rs.getString("m_name"));
				m.setM_addr_1(rs.getString("m_addr_1"));
				m.setM_addr_2(rs.getString("m_addr_2"));
				m.setLevel(rs.getInt("level"));
				m.setM_recommend(rs.getInt("m_recommend"));
				mbl.add(m);
			}
		}
		catch(Exception e) {
			System.out.println("산 전체 조회 중 오류 발생");
			e.printStackTrace();
		}
		return mbl;
	}
	
	
	public int selectCount(Map<String, String>map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM mountain_board";
		if(map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.print("등록된 산 개수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int updateRecommend(int num) {
		int res=0;
		String sql = "UPDATE mountain_board SET m_recommend=m_recommend+1 WHERE m_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("추천수 업데이트 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateRecommend(int board_num, int m_recommend ) {
		int res=0;
		String sql = "UPDATE mountain_board SET m_recommend = m_recommend+? WHERE m_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, m_recommend);
			psmt.setInt(2, board_num);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("추천수 업데이트 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public MountainDto selectView(int m_num) {
		MountainDto dto = null;
		String sql = "SELECT * FROM mountain_board WHERE m_num = ?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, m_num);
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				dto = new MountainDto();
				dto.setM_num(rs.getInt("m_num"));
				dto.setM_name(rs.getString("m_name"));
				dto.setM_addr_1(rs.getString("m_addr_1"));
				dto.setM_addr_2(rs.getString("m_addr_2"));
				dto.setLevel(rs.getInt("level"));
				dto.setM_recommend(rs.getInt("m_recommend"));
			}
			
			
		} catch(Exception e) {
			System.out.println("산 불러오는 중 오류");
			e.printStackTrace();
		}
		return dto;
	} 
	
	
	public List<MountainDto> PopularList(){
		ArrayList<MountainDto> mbl = new ArrayList<MountainDto>();
		MountainDto m = null;
		String query = "SELECT * FROM mountain_board ORDER BY m_recommend DESC LIMIT 9";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
			    m = new MountainDto();
				m.setM_num(rs.getInt("m_num"));
				m.setM_name(rs.getString("m_name"));
				m.setM_addr_1(rs.getString("m_addr_1"));
				m.setM_addr_2(rs.getString("m_addr_2"));
				m.setLevel(rs.getInt("level"));
				m.setM_recommend(rs.getInt("m_recommend"));
				mbl.add(m);
			} System.out.println(mbl);
		}
		catch(Exception e) {
			System.out.println("산 인기순 조회 중 오류 발생");
			e.printStackTrace();
		}
		return mbl;
	}
	
	public String PopularNameList(){
		String res = "";
		String query = "SELECT m_name FROM mountain_board ORDER BY m_recommend DESC LIMIT 9";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				res += rs.getString("m_name")+" ";
			} System.out.println(res);
		}
		catch(Exception e) {
			System.out.println("산 인기순 조회 중 오류 발생");
			e.printStackTrace();
		}
		return res;
	}

}
