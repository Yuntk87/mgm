package dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;

public class ConfirmDao extends JDBConnect {

	public ConfirmDao(ServletContext application) {
		super(application);
	}
	
	public int insertConfirmBoard (ConfirmBoardDto c) {
		int res=0;
		String sql = "INSERT INTO confirm_board(m_num, id) values(?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, c.getM_num());
			psmt.setString(2, c.getId());
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("인증게시판 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public ConfirmBoardDto selectCerBoard(int num) {
		ConfirmBoardDto c = null;
		String query = "SELECT*FROM confirm_board WHERE cb_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				c = new ConfirmBoardDto();
				c.setM_num(rs.getInt("m_num"));
				c.setId(rs.getString("id"));
				return c;
			}
		}
		catch (Exception e) {
			System.out.println("인증게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return c;
	}
	
	
	public int deleteCerBoard(int num) {
		int res=0;
		String sql = "DELETE FROM confirm_board WHERE cb_num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("인증게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM confirm_board";
		if(map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		System.out.print(sql);
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.print("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	
}
