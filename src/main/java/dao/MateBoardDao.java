package dao;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;
import dto.ConfirmBoardDto;
import dto.FreeBoardDto;
import dto.MateBoardDto;

public class MateBoardDao extends JDBConnect {

	public MateBoardDao(ServletContext application) {
		super(application);
	}

	public int insertMateBoard (MateBoardDto m) {
		int res=0;
		String sql = "INSERT INTO mate_board(m_num, id, title, content, dDay, mateLimit, nickName) values(?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, m.getM_num());
			psmt.setString(2, m.getId());
			psmt.setString(3, m.getTitle());
			psmt.setString(4, m.getContent());
			psmt.setTimestamp(5, new Timestamp(m.getdDay().getTime()));
			psmt.setInt(6, m.getMateLimit());
			psmt.setString(7, m.getNickName());
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
			psmt.setTimestamp(3, new Timestamp(dDay.getTime()));
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
				m.setMate_num(rs.getInt("mate_num"));
				m.setM_num(rs.getInt("m_num"));
				m.setId(rs.getString("id"));
				m.setNickName(rs.getString("nickName"));
				m.setTitle(rs.getString("title"));
				m.setContent(rs.getString("content"));
				m.setdDay(rs.getTimestamp("dDay"));
				m.setMateLimit(rs.getInt("mateLimit"));
				m.setViewCount(rs.getInt("viewcount"));
				m.setCommentCount(rs.getInt("commentCount"));
				m.setPostDate(rs.getTimestamp("postDate"));
				m.setJoinCheck(rs.getInt("joinCheck"));
				m.setM_name(rs.getString("m_name"));
				return m;
			}
		}
		catch (Exception e) {
			System.out.println("메이트게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return m;
	}
	
	
	public int updateEdit(MateBoardDto dto) {
			String sql = "UPDATE mate_board SET dDay=?, mateLimit=?, title=?, content=?, m_num=? WHERE mate_num=?";
			int res = 0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setTimestamp(1, new Timestamp(dto.getdDay().getTime()));
				psmt.setInt(2, dto.getMateLimit());
				psmt.setString(3, dto.getTitle());
				psmt.setString(4, dto.getContent());
				psmt.setInt(5, dto.getM_num());
				psmt.setInt(6, dto.getMate_num());
				
				res = psmt.executeUpdate();
			}
			catch(SQLException e) {
				System.out.println("게시물 수정 중 예외 발생");
				e.printStackTrace();
			}
			return res;
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
			if(map.get("joinCheck") != "") {
				sql += " AND joinCheck=" + map.get("joinCheck");
			}
		} else {
			if(map.get("joinCheck") != "") {
				sql += " WHERE joinCheck=" + map.get("joinCheck");
			}			
		}
		
		if(map.get("sortField") != null) {
			sql += " ORDER BY " + map.get("sortField");		
		} else {
			sql += " ORDER BY mate_num DESC";	
		}
		sql += " LIMIT " + map.get("offset")+","+map.get("pageSize");
		System.out.println(sql);

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				m = new MateBoardDto();
				m.setMate_num(rs.getInt("mate_num"));
				m.setM_num(rs.getInt("m_num"));
				m.setId(rs.getString("id"));
				m.setNickName(rs.getString("nickName"));
				m.setTitle(rs.getString("title"));
				m.setContent(rs.getString("content"));
				m.setdDay(rs.getTimestamp("dDay"));
				m.setMateLimit(rs.getInt("mateLimit"));
				m.setViewCount(rs.getInt("viewcount"));
				m.setCommentCount(rs.getInt("commentCount"));
				m.setPostDate(rs.getTimestamp("postDate"));
				m.setM_name(rs.getString("m_name"));
				m.setJoinCheck(rs.getInt("joinCheck"));
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
		String sql = "SELECT COUNT(*) FROM mate_board m INNER JOIN mountain_board b ON m.m_num = b.m_num";
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
			System.out.print("메이트게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int selectCountJoinCheck(Map<String, Object>map) {
		int totalCount = 0;
		String sql = "SELECT COUNT(*) FROM mate_board m INNER JOIN mountain_board b ON m.m_num = b.m_num WHERE joinCheck=0";
		
		if(map.get("searchWord") != null) {
			sql += " AND " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
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
	
	 public int updateCommentCnt(int num, int commentCnt) {
			int res=0;
			String sql = "update mate_board set commentCount = commentCount+? where mate_num =?";
			try {
				psmt= con.prepareStatement(sql);
				psmt.setInt(1, commentCnt);
				psmt.setInt(2, num);
				System.out.println(sql);
				res = psmt.executeUpdate();
			}catch(SQLException e) {
				System.out.println("댓글 수 수정 중 예외발생");
				e.printStackTrace();
			}
			return res;
		}
	 
	 public MateBoardDto selectView(int num) {
		 MateBoardDto dto = null;
			String sql = "SELECT * FROM mate_board WHERE mate_num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				rs = psmt.executeQuery();
				if(rs.next()) {
					dto = new MateBoardDto();
					dto.setMate_num(rs.getInt("mate_num"));
					dto.setM_num(rs.getInt("m_num"));
					dto.setId(rs.getString("id"));
					dto.setNickName(rs.getString("nickName"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setdDay(rs.getTimestamp("dDay"));
					dto.setMateLimit(rs.getInt("mateLimit"));
					dto.setViewCount(rs.getInt("count"));
					dto.setCommentCount(rs.getInt("commentCount"));
					dto.setPostDate(rs.getTimestamp("postDate"));
					dto.setM_name(rs.getString("m_name"));
					dto.setJoinCheck(rs.getInt("joinCheck"));
				}
			}
			catch(SQLException e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			System.out.println(dto);
			return dto;
		}
	 
	 public int deleteView(int num) {
			int res=0;
			String sql = "DELETE from mate_board WHERE mate_num=?";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setInt(1,num);
				res = psmt.executeUpdate();
			}catch(SQLException e) {
				System.out.println("게시물 삭제 중 예외발생");
				e.printStackTrace();
			}
			return res;
	}
	 
	public int updateJoinCheck(int mateNum, int checkNum) {
		int res=0;
		String sql = "UPDATE mate_board SET joinCheck=? WHERE mate_num=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, checkNum);
			psmt.setInt(2, mateNum);
			res = psmt.executeUpdate();	
		}
		catch(Exception e) {
			System.out.println("메이트게시글 참가가능 여부 수정 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	
}
