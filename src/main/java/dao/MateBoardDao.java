package dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.MateBoardDto;

public class MateBoardDao extends JDBConnect {

	public MateBoardDao(ServletContext application) {
		super(application);
	}

	public int insertMateBoard (MateBoardDto m) {
		int res=0;
		String sql = "INSERT INTO mate_board(m_num, id, nickName, title, content, dDay) values(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, m.getM_num());
			psmt.setString(2, m.getId());
			psmt.setString(3, m.getNickName());
			psmt.setString(4, m.getTitle());
			psmt.setString(5, m.getContent());
			psmt.setDate(6, (Date) m.getdDay());
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("메이트게시판 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public int updateMateBoard(int num, String title, String content, Date dDay) {
		int res=0;
		String sql = "UPDATE Mate_board SET title=? , content=? , dDay=? WHERE num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setDate(3, dDay);
			psmt.setInt(4, num);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("메이트게시글 수정 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public MateBoardDto selectMateBoard(int num) {
		MateBoardDto m = null;
		String query = "SELECT*FROM mate_board WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				m = new MateBoardDto();
				m.setM_num(rs.getInt("m_num"));
				m.setId(rs.getString("id"));
				m.setNickName(rs.getString("nickName"));
				m.setTitle(rs.getString("title"));
				m.setContent(rs.getString("content"));
				m.setdDay(rs.getDate("dDay"));
				return m;
			}
		}
		catch (Exception e) {
			System.out.println("메이트게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return m;
	}
	
	
	public int deleteMateBoard(int num) {
		int res=0;
		String sql = "DELETE FROM mate_board WHERE num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();			
		}
		catch(Exception e) {
			System.out.println("메이트게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
	public List<MateBoardDto> selectList(Map<String, Object>map) {
		ArrayList<MateBoardDto> mbs = new ArrayList<MateBoardDto>();
		MateBoardDto m = null;
		String sql = "SELECT * FROM mate_board ";
		if(map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		sql += " ORDER BY num DESC ";
		sql += "LIMIT " + map.get("offset")+","+map.get("pageSize");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				m = new MateBoardDto();
				m.setNum(rs.getInt(1));
				m.setM_num(rs.getInt(2));
				m.setId(rs.getString(3));
				m.setNickName(rs.getString(4));
				m.setTitle(rs.getString(5));
				m.setContent(rs.getString(6));
				m.setdDay(rs.getDate(7));
				m.setPostDate(rs.getTimestamp(8));
				m.setViewCount(rs.getInt(9));
				mbs.add(m);
			}
			
		}
		catch(Exception e) {
			System.out.print("메이트게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return mbs;
	}
	
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM mate_board";
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
			System.out.print("메이트게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int updateViewCnt(int num) {
		int res=0;
		String sql = "UPDATE mate_board SET viewCount=viewCount+1 WHERE num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("조회수 수정 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
}
