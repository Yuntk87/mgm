package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.MountainDto;
import dto.memberDto;

public class MountainDao extends JDBConnect{

	public MountainDao(ServletContext application) {
		super(application);
		// TODO Auto-generated constructor stub
	}
	
	public int insertMountain (MountainDto m) {
		int res=0;
		String sql = "INSERT INTO mountain_board(m_name, m_addr_do, m_addr_si, m_addr_gu, m_addr,level) values(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, m.getM_name() );
			psmt.setString(2, m.getM_addr_do());
			psmt.setString(3, m.getM_addr_si());
			psmt.setString(4, m.getM_addr_gu());
			psmt.setString(5, m.getM_addr());
			psmt.setInt(6, m.getLevel());
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
				m.setM_addr_do(rs.getString("m_addr_do"));
				m.setM_addr_si(rs.getString("m_addr_si"));
				m.setM_addr_gu(rs.getString("m_addr_gu"));
				m.setM_addr(rs.getString("m_addr"));
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
					m.setM_addr_do(rs.getString("m_addr_do"));
					m.setM_addr_si(rs.getString("m_addr_si"));
					m.setM_addr_gu(rs.getString("m_addr_gu"));
					m.setM_addr(rs.getString("m_addr"));
					m.setLevel(rs.getInt("level"));
					m.setM_recommend(rs.getInt("m_recommend"));
				}
			} catch (SQLException e) {
				System.out.println("산 조회중 오류발생");
				e.printStackTrace();
			}
			return m;
		}
	
	public List<MountainDto> selectList(Map<String, Object>map){
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
				m.setM_addr_do(rs.getString("m_addr_do"));
				m.setM_addr_si(rs.getString("m_addr_si"));
				m.setM_addr_gu(rs.getString("m_addr_gu"));
				m.setM_addr(rs.getString("m_addr"));
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
	
	
	public int selectCount(Map<String, Object>map) {
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
	
	
}
