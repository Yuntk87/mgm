package dao;

import java.sql.Date;
import java.time.LocalDateTime;
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
		String sql = "INSERT INTO mate_board(m_num, id, title, content, dDay, mateLimit) values(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, m.getM_num());
			psmt.setString(2, m.getId());
			psmt.setString(3, m.getTitle());
			psmt.setString(4, m.getContent());
			psmt.setDate(5, new java.sql.Date(m.getdDay().getTime()));
			psmt.setInt(6, m.getMateLimit());
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
		String sql = "UPDATE mate_board SET title=? , content=? , dDay=? WHERE mate_num=?";
		
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
		String query = "SELECT m.*, b.m_name FROM mate_board m INNER JOIN mountain_board b ON m.m_num = b.m_num WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);	
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				m = new MateBoardDto();
				m.setMate_num(rs.getInt(1));
				m.setM_num(rs.getInt(2));
				m.setId(rs.getString(3));
				m.setTitle(rs.getString(4));
				m.setContent(rs.getString(5));
				m.setdDay(rs.getTimestamp(6));
				m.setMateLimit(rs.getInt(7));
				m.setViewCount(rs.getInt(8));
				m.setCommentCount(rs.getInt(9));
				m.setPostDate(rs.getTimestamp(10));
				m.setM_name(rs.getString(11));
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
		String sql = "DELETE FROM mate_board WHERE mate_num=?";
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
		String sql = "SELECT m.*, b.m_name FROM mate_board m INNER JOIN mountain_board b ON m.m_num = b.m_num ";
		if(map.get("searchWord") != null) {
			sql += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		sql += " ORDER BY mate_num DESC ";
		sql += "LIMIT " + map.get("offset")+","+map.get("pageSize");

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				m = new MateBoardDto();
				m.setMate_num(rs.getInt(1));
				m.setM_num(rs.getInt(2));
				m.setId(rs.getString(3));
				m.setTitle(rs.getString(4));
				m.setContent(rs.getString(5));
				m.setdDay(rs.getTimestamp(6));
				m.setMateLimit(rs.getInt(7));
				m.setViewCount(rs.getInt(8));
				m.setCommentCount(rs.getInt(9));
				m.setPostDate(rs.getTimestamp(10));
				m.setM_name(rs.getString(11));
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
		String sql = "UPDATE mate_board SET viewCount=viewCount+1 WHERE mate_num=?";
		
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
